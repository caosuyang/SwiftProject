//
//  WYSelectSiteViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import SVProgressHUD
import NVActivityIndicatorView

class WYSelectSiteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NVActivityIndicatorViewable, UITextFieldDelegate, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate, BMKPoiSearchDelegate {
    
    var selectSiteSearchView: WYSelectSiteSearchView?
    var tableView: UITableView?
    var addressArray = [WYSelectSiteModel]()
    var locationService: BMKLocationService?
    var geocodeSearch: BMKGeoCodeSearch?
    var reverseGeocodeSearchOption: BMKReverseGeoCodeOption?
    var poiSearch: BMKPoiSearch?
    var citySearchOption: BMKCitySearchOption?
    var coordinate: CLLocationCoordinate2D?
    var geocoder: CLGeocoder?
    var location: CLLocation?
    var cityString: String?
    var tagId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initSelectSiteSearchView()
        initTableView()
        initNVActivityIndicatorView()
        startLocationService()
        startGeocodeSearch()
        startPoiSearch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationService?.delegate = self
        geocodeSearch?.delegate = self
        poiSearch?.delegate = self
        selectSiteSearchView?.inputSiteTextField?.delegate = self
        selectSiteSearchView?.inputSiteTextField?.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationService?.delegate = nil
        geocodeSearch?.delegate = nil
        poiSearch?.delegate = nil
        selectSiteSearchView?.inputSiteTextField?.delegate = nil
        selectSiteSearchView?.inputSiteTextField?.resignFirstResponder()
        SVProgressHUD.dismiss()
    }
    
}

// MARK: - init control

extension WYSelectSiteViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initSelectSiteSearchView() {
        selectSiteSearchView = WYSelectSiteSearchView.init()
        view.addSubview(selectSiteSearchView!)
        selectSiteSearchView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(54.0 * kHeightRatio)
        })
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleCityLocationViewEvent))
        selectSiteSearchView?.cityLocationView?.addGestureRecognizer(tapGesture)
        
        selectSiteSearchView?.cancelButton?.addTarget(self, action: #selector(handleCancelBtnEvent), for: .touchUpInside)
    }
    
    fileprivate func initTableView() {
        tableView = UITableView.init()
        view.addSubview(tableView!)
        tableView?.snp.makeConstraints { (make) in
            make.top.equalTo(selectSiteSearchView!.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }
        tableView?.backgroundColor = UIColor.white
        tableView?.isScrollEnabled = true
        tableView?.separatorStyle = .none
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    fileprivate func initNVActivityIndicatorView() {
        startAnimating(CGSize(width: kItemBtnWH * kHeightRatio, height: kItemBtnWH * kHeightRatio), message: String.init("加载中"), messageFont: UIFont.semiBoldSystemFontOfSize(size: 12.0 * kHeightRatio), type: .ballSpinFadeLoader, color: .white, displayTimeThreshold: kDisplayTimeThreshold, minimumDisplayTime: kMinimumDisplayTime, backgroundColor: UIColor.init(r: 0, g: 0, b: 0, alpha: kAlpha), textColor: .white)
    }
    
    fileprivate func startLocationService() {
        locationService = BMKLocationService.init()
        locationService?.startUserLocationService()
    }
    
    fileprivate func startGeocodeSearch() {
        geocodeSearch = BMKGeoCodeSearch.init()
    }
    
    fileprivate func startPoiSearch() {
        poiSearch = BMKPoiSearch.init()
    }
    
    fileprivate func reverseGeocode(coordinate: CLLocationCoordinate2D) {
        if reverseGeocodeSearchOption == nil {
            reverseGeocodeSearchOption = BMKReverseGeoCodeOption.init()
        }
        reverseGeocodeSearchOption?.reverseGeoPoint = coordinate
        let flag = geocodeSearch?.reverseGeoCode(reverseGeocodeSearchOption)
        if flag! {
            print("反geo检索发送成功")
        } else {
            print("反geo检索发送失败")
        }
    }
    
    // 实现相关delegate 处理位置信息更新 处理方向变更信息
    internal func didUpdateUserHeading(_ userLocation: BMKUserLocation!) {
        print(userLocation.heading)
        
    }
    
    // 处理位置坐标更新
    func didUpdate(_ userLocation: BMKUserLocation!) {
        print(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude)
        coordinate = userLocation.location.coordinate
        if navigationItem.title == String.init("选择下车地点") {
            starGeocoder(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
        } else if navigationItem.title == String.init("选择上车地点") {
            reverseGeocode(coordinate: userLocation.location.coordinate)
        }
        
        locationService?.stopUserLocationService()
    }
    
    // 接收反向地理编码结果
    func onGetReverseGeoCodeResult(_ searcher: BMKGeoCodeSearch!, result: BMKReverseGeoCodeResult!, errorCode error: BMKSearchErrorCode) {
        print("onGetReverseGeoCodeResult, result: \(result), error: \(error)")
        if error == BMK_SEARCH_NO_ERROR {
            addressArray.removeAll()
            let poiList = result.poiList as NSArray?
            poiList?.enumerateObjects({ (obj, idx, unsafeMutablePointer) in
                let model = WYSelectSiteModel.init()
                let object = obj as AnyObject
                model.mainName = object.name
                model.detailAddress = object.address
                model.city = object.city
                model.pt = object.pt
                model.poi_uid = object.uid
                selectSiteSearchView?.cityLocationView?.cityLocatedLabel?.text = object.city
                cityString = object.city
                addressArray.append(model)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                    self.stopAnimating()
                }
                tableView?.reloadData()
            })
            
        } else {
            print("抱歉，未找到结果")
            SVProgressHUD.showError(withStatus: String.init("抱歉，未找到结果"))
        }
    }
    
    fileprivate func starCitySearchOption(city: String, keyword: String) {
        if citySearchOption == nil {
            citySearchOption = BMKCitySearchOption.init()
        }
        citySearchOption?.city = city
        citySearchOption?.keyword = keyword
        let flag = poiSearch?.poiSearch(inCity: citySearchOption)
        if flag! {
            print("城市内检索发送成功")
        } else {
            print("城市内检索发送失败")
        }
    }
    
    func onGetPoiResult(_ searcher: BMKPoiSearch!, result poiResult: BMKPoiResult!, errorCode: BMKSearchErrorCode) {
        if errorCode == BMK_SEARCH_NO_ERROR {
            addressArray.removeAll()
            if poiResult.poiInfoList == nil {
                return
            }
            print(poiResult.poiInfoList, poiResult.poiInfoList.count)
            for i in 0..<poiResult.poiInfoList.count {
                let poi = poiResult.poiInfoList[i] as? BMKPoiInfo
                let model = WYSelectSiteModel.init()
                model.mainName = poi?.name
                model.detailAddress = poi?.address
                model.city = poi?.city
                model.pt = poi?.pt
                model.poi_uid = poi?.uid
                addressArray.append(model)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                    self.stopAnimating()
                }
                tableView?.reloadData()
            }
        } else if errorCode == BMK_SEARCH_AMBIGUOUS_KEYWORD {
            print("检索词有歧义")
            SVProgressHUD.showError(withStatus: String.init("检索词有歧义"))
        } else {
            print("抱歉，未找到结果")
            SVProgressHUD.showError(withStatus: String.init("抱歉，未找到结果"))
        }
    }
    
    fileprivate func starGeocoder(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        if geocoder == nil {
            geocoder = CLGeocoder.init()
        }
        location = CLLocation.init(latitude: latitude, longitude: longitude)
        geocoder?.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) in
            let placemark = placemarks?.first
            self.selectSiteSearchView?.cityLocationView?.cityLocatedLabel?.text = placemark?.locality
            self.cityString = placemark?.locality
            self.starCitySearchOption(city: placemark!.locality!, keyword: placemark!.administrativeArea!)
        })
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 53.0 * kHeightRatio
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as? WYSelectSiteTableViewCell
        if cell == nil {
            cell = WYSelectSiteTableViewCell.init(style: .default, reuseIdentifier: kCellId)
        }
        cell?.selectionStyle = .none
        cell?.siteModel = addressArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        var tempModel = WYSelectSiteModel.init()
        tempModel = addressArray[indexPath.row]
        NotificationCenter.default.post(name: WYSelectSiteNotification, object: self, userInfo: ["tempModel": tempModel, "tagId": tagId!])
        selectSiteSearchView?.inputSiteTextField?.resignFirstResponder()
        navigationController?.popViewController(animated: true)
    }

    
}


extension WYSelectSiteViewController {
    
    @objc fileprivate func handleCityLocationViewEvent() {
        print("handleCityLocationViewEvent")
    }
    
    @objc fileprivate func handleCancelBtnEvent() {
        print("handleCancelBtnEvent")
        selectSiteSearchView?.inputSiteTextField?.resignFirstResponder()
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        selectSiteSearchView?.inputSiteTextField?.resignFirstResponder()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll")
        selectSiteSearchView?.inputSiteTextField?.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        if textField.text?.length == 0 {
            reverseGeocode(coordinate: coordinate!)
        } else {
            starCitySearchOption(city: cityString!, keyword: textField.text!)
        }
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        reverseGeocode(coordinate: coordinate!)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn")
        let keywordString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        print(keywordString)
        if keywordString.length == 0 {
            reverseGeocode(coordinate: coordinate!)
        } else {
            starCitySearchOption(city: cityString!, keyword: keywordString)
        }
        return true
    }

    
}
