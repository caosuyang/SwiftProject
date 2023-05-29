//
//  WYCharterViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/21.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material
import SVProgressHUD

class WYCharterViewController: UIViewController, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate {
    
    fileprivate var transferView: WYTransferView?
    fileprivate var chooseTimeView: WYChooseTimeView?
    fileprivate var locationService: BMKLocationService?
    fileprivate var geocodeSearch: BMKGeoCodeSearch?
    fileprivate var reverseGeocodeSearchOption: BMKReverseGeoCodeOption?
    fileprivate var addressArray = [WYSelectSiteModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initTransferView()
        initChooseTimeView()
        startLocationService()
        startGeocodeSearch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationService?.delegate = self
        geocodeSearch?.delegate = self
        addNotificationCenter()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationService?.delegate = nil
        geocodeSearch?.delegate = nil
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


// MARK: - init control

extension WYCharterViewController {
    
    fileprivate func addNotificationCenter() {
        NotificationCenter.default .addObserver(self, selector: #selector(getSelectSiteModel(notification:)), name: WYSelectSiteNotification, object: nil)
    }
    
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("送车")
    }
    
    fileprivate func initTransferView() {
        transferView = WYTransferView.init()
        view.addSubview(transferView!)
        transferView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        transferView?.servicePriceView?.servicePriceView?.estimatePriceView?.priceFigureLabel?.text = String.init("108.6")
        
        transferView?.contentView?.snp.updateConstraints({ (make) in
            make.height.equalTo(187.0 * kHeightRatio)
        })
        
        transferView?.fliNoView?.snp.updateConstraints({ (make) in
            make.top.equalTo(transferView!.contentView!).offset(0.0 * kHeightRatio)
            make.height.equalTo(0.0 * kHeightRatio)
        })
        
        transferView?.fliNoView?.iconView?.snp.updateConstraints({ (make) in
            make.height.equalTo(0.0 * kHeightRatio)
        })
        
        transferView?.fliNoView?.textLabel?.snp.updateConstraints({ (make) in
            make.height.equalTo(0.0 * kHeightRatio)
        })
        
        transferView?.fliNoView?.splitLineView?.alpha = 0.0
        
        transferView?.fliNoView?.isHidden = true
        
        transferView?.boardTimeView?.textLabel?.text = String.init("请选择用车时间")
        
        transferView?.askCarBtn?.setTitle(String.init("预约"), for: UIControlState())
        
        let timeGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleBoardTimeViewEvent))
        transferView?.boardTimeView?.addGestureRecognizer(timeGesture)
        
        let locateGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleLocationSiteViewEvent))
        transferView?.locationSiteView?.addGestureRecognizer(locateGesture)
        
        let getOffGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleGetOffSiteViewEvent))
        transferView?.getOffSiteView?.addGestureRecognizer(getOffGesture)
        
        transferView?.servicePriceView?.carTypeScrollView?.officialBtn?.addTarget(self, action: #selector(clickOfficialBtnEvent), for: .touchUpInside)
        
        transferView?.servicePriceView?.carTypeScrollView?.businessBtn?.addTarget(self, action: #selector(clickBusinessBtnEvent), for: .touchUpInside)
        
        transferView?.servicePriceView?.carTypeScrollView?.luxuryBtn?.addTarget(self, action: #selector(clickLuxuryBtnEvent), for: .touchUpInside)
    }
    
    fileprivate func initChooseTimeView() {
        let window = UIApplication.shared.keyWindow
        chooseTimeView = WYChooseTimeView.init()
        window?.addSubview(chooseTimeView!)
        chooseTimeView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(window!)
        })
    }
    
    fileprivate func startLocationService() {
        locationService = BMKLocationService.init()
        locationService?.startUserLocationService()
    }
    
    fileprivate func startGeocodeSearch() {
        geocodeSearch = BMKGeoCodeSearch.init()
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
    
}

// MARK: - Handle event

extension WYCharterViewController {
    
    @objc fileprivate func getSelectSiteModel(notification: Notification) {
        print("getSelectSiteModel")
        let tagId: Int = notification.userInfo?["tagId"] as! Int
        let model: WYSelectSiteModel = notification.userInfo?["tempModel"] as! WYSelectSiteModel
        
        if tagId == 5 {
            transferView?.locationSiteView?.textLabel?.text = model.mainName
        } else if tagId == 6 {
            transferView?.getOffSiteView?.textLabel?.text = model.mainName
            transferView?.getOffSiteView?.textLabel?.textColor = UIColor.globalHeadlineColor()
        }
    }
    
    
    @objc fileprivate func handleBoardTimeViewEvent() {
        print("handleBoardTimeViewEvent")
    
        chooseTimeView?.isHidden = false
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.chooseTimeView?.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: kAlpha)
            self.chooseTimeView?.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self.chooseTimeView!)
            })
            self.chooseTimeView?.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc fileprivate func handleLocationSiteViewEvent() {
        print("handleLocationSiteViewEvent")
        let locationSiteVC = WYSelectSiteViewController.init()
        locationSiteVC.tagId = 5
        locationSiteVC.navigationItem.title = String.init("选择上车地点")
        navigationController?.pushViewController(locationSiteVC, animated: true)
    }
    
    @objc fileprivate func handleGetOffSiteViewEvent() {
        print("handleGetOffSiteViewEvent")
        let getOffSiteVC = WYSelectSiteViewController.init()
        getOffSiteVC.tagId = 6
        getOffSiteVC.navigationItem.title = String.init("选择下车地点")
        navigationController?.pushViewController(getOffSiteVC, animated: true)
    }
    
    @objc fileprivate func clickOfficialBtnEvent() {
        print("clickOfficialBtnEvent")
        transferView?.servicePriceView?.carTypeScrollView?.officialBtn?.imgView?.image = UIImage.init(named: "car_official_img_sel_40x12_")
        transferView?.servicePriceView?.carTypeScrollView?.businessBtn?.imgView?.image = UIImage.init(named: "car_business_img_nor_40x13_")
        transferView?.servicePriceView?.carTypeScrollView?.luxuryBtn?.imgView?.image = UIImage.init(named: "car_luxury_img_nor_40x13_")
        transferView?.servicePriceView?.carTypeScrollView?.officialBtn?.textLabel?.textColor = UIColor.globalThemeDefaultColor()
        transferView?.servicePriceView?.carTypeScrollView?.businessBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        transferView?.servicePriceView?.carTypeScrollView?.luxuryBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.transferView?.servicePriceView?.carTypeScrollView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.transferView!.servicePriceView!.carTypeScrollView!.splitLineView_bottom!).offset(42.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    @objc fileprivate func clickBusinessBtnEvent() {
        print("clickBusinessBtnEvent")
        transferView?.servicePriceView?.carTypeScrollView?.officialBtn?.imgView?.image = UIImage.init(named: "car_official_img_nor_40x12_")
        transferView?.servicePriceView?.carTypeScrollView?.businessBtn?.imgView?.image = UIImage.init(named: "car_business_img_sel_40x13_")
        transferView?.servicePriceView?.carTypeScrollView?.luxuryBtn?.imgView?.image = UIImage.init(named: "car_luxury_img_nor_40x13_")
        transferView?.servicePriceView?.carTypeScrollView?.officialBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        transferView?.servicePriceView?.carTypeScrollView?.businessBtn?.textLabel?.textColor = UIColor.globalThemeDefaultColor()
        transferView?.servicePriceView?.carTypeScrollView?.luxuryBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.transferView?.servicePriceView?.carTypeScrollView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.transferView!.servicePriceView!.carTypeScrollView!.splitLineView_bottom!).offset(157.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    @objc fileprivate func clickLuxuryBtnEvent() {
        print("clickLuxuryBtnEvent")
        transferView?.servicePriceView?.carTypeScrollView?.officialBtn?.imgView?.image = UIImage.init(named: "car_official_img_nor_40x12_")
        transferView?.servicePriceView?.carTypeScrollView?.businessBtn?.imgView?.image = UIImage.init(named: "car_business_img_nor_40x13_")
        transferView?.servicePriceView?.carTypeScrollView?.luxuryBtn?.imgView?.image = UIImage.init(named: "car_luxury_img_sel_40x13_")
        transferView?.servicePriceView?.carTypeScrollView?.officialBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        transferView?.servicePriceView?.carTypeScrollView?.businessBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        transferView?.servicePriceView?.carTypeScrollView?.luxuryBtn?.textLabel?.textColor = UIColor.globalThemeDefaultColor()
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.transferView?.servicePriceView?.carTypeScrollView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.transferView!.servicePriceView!.carTypeScrollView!.splitLineView_bottom!).offset(275.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    // MARK: - BMKLocationServiceDelegate
    // 处理位置坐标更新
    func didUpdate(_ userLocation: BMKUserLocation!) {
        print(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude)
        reverseGeocode(coordinate: userLocation.location.coordinate)
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
                addressArray.append(model)
            })
            transferView?.locationSiteView?.textLabel?.text = addressArray.first?.mainName
        } else {
            print("抱歉，未找到结果")
        }
    }
}
