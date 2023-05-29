//
//  WYHomeViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/10.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material
import SnapKit
import Spring

class WYHomeViewController: UIViewController, BMKMapViewDelegate, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate {
    
    fileprivate var myCenterBtn: IconButton!
    fileprivate var notiBtn: IconButton!
    fileprivate var logoIcon: View!
    fileprivate var mapView: BMKMapView?
    fileprivate var locationService: BMKLocationService?
    fileprivate var pointAnnotation: BMKPointAnnotation?
    fileprivate var locationCoordinate: CLLocationCoordinate2D?
    fileprivate var pointCoordinate: CLLocationCoordinate2D?
    fileprivate var geocodeSearch: BMKGeoCodeSearch?
    fileprivate var reverseGeocodeSearchOption: BMKReverseGeoCodeOption?
    
    fileprivate var annotationView: UIImageView?
    fileprivate var paoView: UIImageView?
    fileprivate var paoViewLabel: UILabel?
    fileprivate var modView: WYModView?
    fileprivate var locateButton: UIButton?
    fileprivate var callCarButton: WYCallCarButton?
    fileprivate var addressArray = [WYSelectSiteModel]()
    fileprivate var chooseTimeView: WYChooseTimeView?
    fileprivate var starCoordinate: CLLocationCoordinate2D?
    fileprivate var endCoordinate: CLLocationCoordinate2D?
    fileprivate var returnBackBtn: IconButton!
    fileprivate var tagId: Int?

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initMapView()
        startLocationService()
        initPointAnnotation()
        startGeocodeSearch()
        initModView()
        initLocateBtn()
        initCallCarBtn()
        initChooseTimeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView?.viewWillAppear()
        mapView?.delegate = self
        locationService?.delegate = self
        geocodeSearch?.delegate = self
        addNotificationCenter()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mapView?.viewWillDisappear()
        mapView?.delegate = nil
        locationService?.delegate = nil
        geocodeSearch?.delegate = nil
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - init control

extension WYHomeViewController {
    
    fileprivate func addNotificationCenter() {
        NotificationCenter.default .addObserver(self, selector: #selector(getSelectSiteModel(notification:)), name: WYSelectSiteNotification, object: nil)
    }
    
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.leftViews.removeAll()
        navigationItem.rightViews.removeAll()
        navigationItem.centerViews.removeAll()
        navigationItem.title?.removeAll()
        myCenterBtn = IconButton(image: UIImage(named: "nav_mycenter_btn_16x17_"))
        myCenterBtn.pulseColor = .white
        myCenterBtn.addTarget(self, action: #selector(handleMyCenterBtn), for: .touchUpInside)
        navigationItem.leftViews = [myCenterBtn]
        
        notiBtn = IconButton(image: UIImage(named: "nav_noti_btn_nor_15x17_"))
        notiBtn.pulseColor = .white
        notiBtn.addTarget(self, action: #selector(handleNoticeBtn), for: .touchUpInside)
        navigationItem.rightViews = [notiBtn]
        
        logoIcon = View.init()
        logoIcon.backgroundColor = Color.clear
        logoIcon.image = UIImage(named: "nav_titleview_logo_98x22_")
        let contentView = View()
        contentView.backgroundColor = Color.clear
        contentView.addSubview(logoIcon)
        logoIcon.snp.makeConstraints { (make) in
            make.center.equalTo(contentView)
            make.size.equalTo(CGSize(width: 98.0 * kWidthRatio, height: 22.0 * kHeightRatio))
        }
        navigationItem.centerViews = [contentView]
    }
    
    fileprivate func initMapView() {
        mapView = BMKMapView.init()
        view.addSubview(mapView!)
        mapView?.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        mapView?.backgroundColor = UIColor.globalBackgroundColor()
        mapView?.minZoomLevel = 4.7
        mapView?.showMapScaleBar = true
        mapView?.mapScaleBarPosition = CGPoint(x: kMargin * kWidthRatio, y: screenHeight - kMargin * kHeightRatio)
        mapView?.logoPosition = BMKLogoPositionRightBottom
        mapView?.isRotateEnabled = false
        mapView?.isOverlookEnabled = false
    }
    
    fileprivate func startLocationService() {
        locationService = BMKLocationService.init()
        locationService?.startUserLocationService()
        mapView?.showsUserLocation = false
        mapView?.userTrackingMode = BMKUserTrackingModeFollow
        let param = BMKLocationViewDisplayParam.init()
        param.isAccuracyCircleShow = false
        param.locationViewImgName = String.init("bnavi_icon_location_custom")
        param.canShowCallOut = false
        mapView?.updateLocationView(with: param)
        mapView?.zoomLevel = 17
        mapView?.showsUserLocation = true
    }
    
    fileprivate func initPointAnnotation() {
        annotationView = UIImageView.init()
        mapView?.addSubview(annotationView!)
        annotationView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(mapView!)
            make.centerY.equalTo(mapView!).offset(-14.0 * kHeightRatio)
            make.width.equalTo(17.0 * kWidthRatio)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        annotationView?.image = UIImage.init(named: "home_map_location_pin_17x28_")
        
        paoView = UIImageView.init()
        mapView?.addSubview(paoView!)
        paoView?.snp.makeConstraints { (make) in
            make.centerX.equalTo(annotationView!)
            make.bottom.equalTo(annotationView!.snp.top).offset(-6.0 * kHeightRatio)
            make.width.equalTo(137.0 * kWidthRatio)
            make.height.equalTo(38.0 * kHeightRatio)
        }
        paoView?.image = UIImage.init(named: "home_map_location_dialog_132x33_")
        paoView?.layer.shadowColor = UIColor.globalShadowColor().cgColor
        paoView?.layer.shadowOpacity = kShadowOpacity
        paoView?.layer.shadowRadius = 1.5
        paoView?.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)

        paoViewLabel = UILabel.init()
        paoView?.addSubview(paoViewLabel!)
        paoViewLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(paoView!)
            make.centerY.equalTo(paoView!).offset(-1.5 * kHeightRatio)
            make.height.equalTo(14.0 * kHeightRatio)
            make.width.equalTo(105.0 * kWidthRatio)
        })
        paoViewLabel?.text = String.init("当前位置叫车")
        paoViewLabel?.textAlignment = .center
        paoViewLabel?.textColor = UIColor.globalHeadlineColor()
        paoViewLabel?.font = UIFont.globalMainTextFont()
        
        
    }
    
//    
//    fileprivate func addPointAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        if pointAnnotation == nil {
//            pointAnnotation = BMKPointAnnotation.init()
//            pointAnnotation?.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
//        }
//        mapView?.addAnnotation(pointAnnotation)
//    }
    
    
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
    
    
    fileprivate func initModView() {
        modView = WYModView.init()
        mapView?.addSubview(modView!)
        modView?.snp.makeConstraints({ (make) in
            make.left.equalTo(mapView!).offset(kMargin * kWidthRatio)
            make.right.equalTo(mapView!).offset(-kMargin * kWidthRatio)
            make.bottom.equalTo(mapView!).offset(-19.0 * kHeightRatio)
            make.height.equalTo(133.0 * kHeightRatio)
        })
        modView?.barView?.nowButton?.addTarget(self, action: #selector(clickNowBtnEvent), for: .touchUpInside)
        modView?.barView?.bookButton?.addTarget(self, action: #selector(clickBookBtnEvent), for: .touchUpInside)
        modView?.barView?.transferButton?.addTarget(self, action: #selector(clickTransferBtnEvent), for: .touchUpInside)
        modView?.barView?.charterButton?.addTarget(self, action: #selector(clickCharterBtnEvent), for: .touchUpInside)
        
        let starGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleStarPlaceEvent))
        modView?.contentView?.starSiteView?.addGestureRecognizer(starGesture)
        
        let endGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleEndPlaceEvent))
        modView?.contentView?.endSiteView?.addGestureRecognizer(endGesture)
        
        let timeGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleMakeAppointEvent))
        modView?.contentView?.makeAppointView?.addGestureRecognizer(timeGesture)
        
        
        modView?.contentView?.carTypeScrollView?.bottomLineView?.snp.updateConstraints({ (make) in
            make.left.equalTo(modView!.contentView!.carTypeScrollView!.splitLineView_bottom!).offset(35.0 * kWidthRatio)
        })
        modView?.contentView?.carTypeScrollView?.officialBtn?.addTarget(self, action: #selector(clickOfficialBtnEvent), for: .touchUpInside)
        
        modView?.contentView?.carTypeScrollView?.businessBtn?.addTarget(self, action: #selector(clickBusinessBtnEvent), for: .touchUpInside)
        
        modView?.contentView?.carTypeScrollView?.luxuryBtn?.addTarget(self, action: #selector(clickLuxuryBtnEvent), for: .touchUpInside)
        modView?.contentView?.servicePriceView?.estimatePriceView?.priceFigureLabel?.text = String.init("108.6")
    }
    
    fileprivate func initLocateBtn() {
        locateButton = UIButton.init()
        mapView?.addSubview(locateButton!)
        locateButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(modView!)
            make.bottom.equalTo(modView!.snp.top).offset(-21.0 * kHeightRatio)
            make.width.height.equalTo(24.0 * kHeightRatio)
        })
        locateButton?.backgroundColor = .white
        locateButton?.setImage(UIImage.init(named: "home_map_location_btn_24x24_"), for: .normal)
        locateButton?.layer.shadowColor = UIColor.globalShadowColor().cgColor
        locateButton?.layer.shadowOpacity = kShadowOpacity
        locateButton?.layer.shadowRadius = 1.5
        locateButton?.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        locateButton?.addTarget(self, action: #selector(clickLocateBtnEvent), for: .touchUpInside)
    }
    
    fileprivate func initCallCarBtn() {
        callCarButton = WYCallCarButton.init()
        mapView?.addSubview(callCarButton!)
        callCarButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(mapView!).offset(kMargin * kWidthRatio)
            make.bottom.equalTo(mapView!).offset(kFootBtnHeight * kHeightRatio)
            make.right.equalTo(mapView!).offset(-kMargin * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        callCarButton?.isHidden = true
        callCarButton?.setTitle(String.init("立即叫车"), for: UIControlState())
        callCarButton?.addTarget(self, action: #selector(clickCallCarBtnEvent), for: .touchUpInside)
    }
    
    fileprivate func initChooseTimeView() {
        let window = UIApplication.shared.keyWindow
        chooseTimeView = WYChooseTimeView.init()
        window?.addSubview(chooseTimeView!)
        chooseTimeView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(window!)
        })
    }
    
}

// MARK: - Handle event

extension WYHomeViewController {
    
    @objc fileprivate func clickOfficialBtnEvent() {
        print("clickOfficialBtnEvent")
        modView?.contentView?.carTypeScrollView?.officialBtn?.imgView?.image = UIImage.init(named: "car_official_img_sel_40x12_")
        modView?.contentView?.carTypeScrollView?.businessBtn?.imgView?.image = UIImage.init(named: "car_business_img_nor_40x13_")
        modView?.contentView?.carTypeScrollView?.luxuryBtn?.imgView?.image = UIImage.init(named: "car_luxury_img_nor_40x13_")
        modView?.contentView?.carTypeScrollView?.officialBtn?.textLabel?.textColor = UIColor.globalThemeDefaultColor()
        modView?.contentView?.carTypeScrollView?.businessBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        modView?.contentView?.carTypeScrollView?.luxuryBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.modView?.contentView?.carTypeScrollView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.modView!.contentView!.carTypeScrollView!.splitLineView_bottom!).offset(35.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    @objc fileprivate func clickBusinessBtnEvent() {
        print("clickBusinessBtnEvent")
        modView?.contentView?.carTypeScrollView?.officialBtn?.imgView?.image = UIImage.init(named: "car_official_img_nor_40x12_")
        modView?.contentView?.carTypeScrollView?.businessBtn?.imgView?.image = UIImage.init(named: "car_business_img_sel_40x13_")
        modView?.contentView?.carTypeScrollView?.luxuryBtn?.imgView?.image = UIImage.init(named: "car_luxury_img_nor_40x13_")
        modView?.contentView?.carTypeScrollView?.officialBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        modView?.contentView?.carTypeScrollView?.businessBtn?.textLabel?.textColor = UIColor.globalThemeDefaultColor()
        modView?.contentView?.carTypeScrollView?.luxuryBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.modView?.contentView?.carTypeScrollView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.modView!.contentView!.carTypeScrollView!.splitLineView_bottom!).offset(145.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    @objc fileprivate func clickLuxuryBtnEvent() {
        print("clickLuxuryBtnEvent")
        modView?.contentView?.carTypeScrollView?.officialBtn?.imgView?.image = UIImage.init(named: "car_official_img_nor_40x12_")
        modView?.contentView?.carTypeScrollView?.businessBtn?.imgView?.image = UIImage.init(named: "car_business_img_nor_40x13_")
        modView?.contentView?.carTypeScrollView?.luxuryBtn?.imgView?.image = UIImage.init(named: "car_luxury_img_sel_40x13_")
        modView?.contentView?.carTypeScrollView?.officialBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        modView?.contentView?.carTypeScrollView?.businessBtn?.textLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        modView?.contentView?.carTypeScrollView?.luxuryBtn?.textLabel?.textColor = UIColor.globalThemeDefaultColor()
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.modView?.contentView?.carTypeScrollView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.modView!.contentView!.carTypeScrollView!.splitLineView_bottom!).offset(258.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }

    
    @objc fileprivate func getSelectSiteModel(notification: Notification) {
        tagId = notification.userInfo?["tagId"] as? Int
        let model: WYSelectSiteModel = notification.userInfo?["tempModel"] as! WYSelectSiteModel
        if tagId == 0 {
            modView?.contentView?.starSiteView?.siteLabel?.text = model.mainName
            starCoordinate = model.pt
            if locationCoordinate != nil {
                mapView?.setCenter(starCoordinate!, animated: true)
            }
        } else if tagId == 1 {
            modView?.contentView?.endSiteView?.siteLabel?.text = model.mainName
            modView?.contentView?.endSiteView?.siteLabel?.textColor = UIColor.globalHeadlineColor()
            endCoordinate = model.pt
            
            navigationItem.leftViews.removeAll()
            navigationItem.rightViews.removeAll()
            navigationItem.centerViews.removeAll()
            navigationItem.title?.removeAll()
            returnBackBtn = IconButton(image: UIImage(named: "nav_back_btn_nor_22x22_"))
            returnBackBtn.pulseColor = .white
            returnBackBtn.addTarget(self, action: #selector(handleReturnBackBtn), for: .touchUpInside)
            navigationItem.leftViews = [returnBackBtn]
            navigationItem.title = String.init("确认信息")
            
            
            callCarButton?.isHidden = false
            modView?.contentView?.endSiteView?.isHidden = true
            modView?.contentView?.starSiteView?.isHidden = true
            modView?.contentView?.carTypeScrollView?.isHidden = false
            modView?.contentView?.servicePriceView?.isHidden = false
            
            if modView!.barView!.bookButton!.isUserInteractionEnabled {
                UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                    self.callCarButton?.snp.updateConstraints({ (make) in
                        make.bottom.equalTo(self.mapView!).offset(-6.5 * kHeightRatio)
                    })
                    self.modView?.snp.updateConstraints({ (make) in
                        make.bottom.equalTo(self.mapView!).offset(-58.0 * kHeightRatio)
                        make.height.equalTo(183.0 * kHeightRatio)
                    })
                    self.modView?.contentView?.snp.updateConstraints({ (make) in
                        make.height.equalTo(150.0 * kHeightRatio)
                    })
                    self.modView?.contentView?.endSiteView?.snp.updateConstraints { (make) in
                        make.height.equalTo(77.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.starSiteView?.snp.updateConstraints { (make) in
                        make.height.equalTo(73.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.carTypeScrollView?.snp.updateConstraints { (make) in
                        make.height.equalTo(77.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.servicePriceView?.snp.updateConstraints { (make) in
                        make.height.equalTo(73.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.carTypeScrollView?.splitLineView_top?.alpha = 0.0
                    self.view.layoutIfNeeded()
                }, completion: nil)
            } else {
                UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                    self.callCarButton?.snp.updateConstraints({ (make) in
                        make.bottom.equalTo(self.mapView!).offset(-6.5 * kHeightRatio)
                    })
                    self.modView?.snp.updateConstraints({ (make) in
                        make.bottom.equalTo(self.mapView!).offset(-58.0 * kHeightRatio)
                        make.height.equalTo(246.0 * kHeightRatio)
                    })
                    self.modView?.contentView?.snp.updateConstraints({ (make) in
                        make.height.equalTo(213.0 * kHeightRatio)
                    })
                    self.modView?.contentView?.endSiteView?.snp.updateConstraints { (make) in
                        make.height.equalTo(77.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.starSiteView?.snp.updateConstraints { (make) in
                        make.height.equalTo(73.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.carTypeScrollView?.snp.updateConstraints { (make) in
                        make.height.equalTo(77.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.servicePriceView?.snp.updateConstraints { (make) in
                        make.height.equalTo(73.0 * kHeightRatio)
                    }
                    self.modView?.contentView?.carTypeScrollView?.splitLineView_top?.alpha = 1.0
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }
    
    @objc fileprivate func clickCallCarBtnEvent() {
        print("clickCallCarBtnEvent")
        let driveFlowVC = WYDriveFlowViewController.init()
        navigationController?.pushViewController(driveFlowVC, animated: true)
    }
    
    @objc fileprivate func handleReturnBackBtn() {
        print("handleReturnBackBtn")
        initNavigationItem()
        modView?.contentView?.endSiteView?.siteLabel?.text = String.init("请输入目的地")
        modView?.contentView?.endSiteView?.siteLabel?.textColor = UIColor.globalPlaceholderColor()
        if modView!.barView!.bookButton!.isUserInteractionEnabled {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.callCarButton?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(kFootBtnHeight * kHeightRatio)
                })
                self.view.layoutIfNeeded()
            }) { (true) in
                self.callCarButton?.isHidden = true
            }
            
            modView?.contentView?.carTypeScrollView?.isHidden = true
            modView?.contentView?.servicePriceView?.isHidden = true
            modView?.contentView?.endSiteView?.isHidden = false
            modView?.contentView?.starSiteView?.isHidden = false
            
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-19.0 * kHeightRatio)
                    make.height.equalTo(133.0 * kHeightRatio)
                })
                self.modView?.contentView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(100.0 * kHeightRatio)
                })
                self.modView?.contentView?.starSiteView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.modView?.contentView?.endSiteView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.modView?.contentView?.carTypeScrollView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.modView?.contentView?.servicePriceView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.callCarButton?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(kFootBtnHeight * kHeightRatio)
                })
                self.view.layoutIfNeeded()
            }) { (true) in
                self.callCarButton?.isHidden = true
            }
            
            modView?.contentView?.carTypeScrollView?.isHidden = true
            modView?.contentView?.servicePriceView?.isHidden = true
            modView?.contentView?.endSiteView?.isHidden = false
            modView?.contentView?.starSiteView?.isHidden = false
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-19.0 * kHeightRatio)
                    make.height.equalTo(203.0 * kHeightRatio)
                })
                self.modView?.contentView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(172.0 * kHeightRatio)
                })
                self.modView?.contentView?.starSiteView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.modView?.contentView?.endSiteView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.modView?.contentView?.carTypeScrollView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.modView?.contentView?.servicePriceView?.snp.updateConstraints { (make) in
                    make.height.equalTo(kFirCellHeight * kHeightRatio)
                }
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        
    }
    
    @objc fileprivate func handleMyCenterBtn() {
        print("handleMyCenterBtn")
        navigationDrawerController?.toggleLeftView()
    }
    
    @objc fileprivate func handleNoticeBtn() {
        print("handleNoticeBtn")
        navigationController?.pushViewController(WYNoticeViewController(), animated: true)
    }
    
    // 预约
    @objc fileprivate func clickBookBtnEvent() {
        print("clickBookBtnEvent")
        modView?.barView?.bookButton?.isUserInteractionEnabled = false
        modView?.barView?.nowButton?.isUserInteractionEnabled = true
        modView?.barView?.bookButton?.shapeLayer?.fillColor = UIColor.white.cgColor
        modView?.barView?.bookButton?.shapeLayer?.strokeColor = UIColor.white.cgColor
        modView?.barView?.bookButton?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        modView?.barView?.nowButton?.shapeLayer?.fillColor = UIColor.globalBackgroundColor().cgColor
        modView?.barView?.nowButton?.shapeLayer?.strokeColor = UIColor.globalBackgroundColor().cgColor
        modView?.barView?.nowButton?.setTitleColor(UIColor.globalBtnTitleDisabledColor(), for: UIControlState())
        
        if navigationItem.title != String.init("确认信息") {
            // animate
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.contentView?.makeAppointView?.iconView?.alpha = 1.0
                self.modView?.contentView?.makeAppointView?.tipLabel?.alpha = 1.0
                self.modView?.contentView?.starSiteView?.splitView?.alpha = 1.0
                
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-19.0 * kHeightRatio)
                    make.height.equalTo(203.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(172.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.makeAppointView?.iconView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(15.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.makeAppointView?.tipLabel?.snp.updateConstraints({ (make) in
                    make.height.equalTo(14.0 * kHeightRatio)
                })
                self.view?.layoutIfNeeded()
                
            }, completion: nil)
        } else {
            // animate
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.contentView?.makeAppointView?.iconView?.alpha = 1.0
                self.modView?.contentView?.makeAppointView?.tipLabel?.alpha = 1.0
                self.modView?.contentView?.starSiteView?.splitView?.alpha = 1.0
                
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-58.0 * kHeightRatio)
                    make.height.equalTo(246.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(213.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.makeAppointView?.iconView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(15.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.makeAppointView?.tipLabel?.snp.updateConstraints({ (make) in
                    make.height.equalTo(14.0 * kHeightRatio)
                })
                self.modView?.contentView?.carTypeScrollView?.splitLineView_top?.alpha = 1.0
                self.view?.layoutIfNeeded()
                
            }, completion: nil)
        }
        
    
    }
    
    // 现在
    @objc fileprivate func clickNowBtnEvent() {
        print("clickNowBtnEvent")
        modView?.barView?.nowButton?.isUserInteractionEnabled = false
        modView?.barView?.bookButton?.isUserInteractionEnabled = true
        modView?.barView?.nowButton?.shapeLayer?.fillColor = UIColor.white.cgColor
        modView?.barView?.nowButton?.shapeLayer?.strokeColor = UIColor.white.cgColor
        modView?.barView?.nowButton?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        modView?.barView?.bookButton?.shapeLayer?.fillColor = UIColor.globalBackgroundColor().cgColor
        modView?.barView?.bookButton?.shapeLayer?.strokeColor = UIColor.globalBackgroundColor().cgColor
        modView?.barView?.bookButton?.setTitleColor(UIColor.globalBtnTitleDisabledColor(), for: UIControlState())
        
        
        if navigationItem.title != String.init("确认信息") {
            // animate
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.contentView?.makeAppointView?.iconView?.alpha = 0.0
                self.modView?.contentView?.makeAppointView?.tipLabel?.alpha = 0.0
                self.modView?.contentView?.starSiteView?.splitView?.alpha = 0.0
                
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-19.0 * kHeightRatio)
                    make.height.equalTo(133.0 * kHeightRatio)
                })
                self.modView?.contentView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(100.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.makeAppointView?.iconView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(0.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.makeAppointView?.tipLabel?.snp.updateConstraints({ (make) in
                    make.height.equalTo(0.0 * kHeightRatio)
                })
                
                self.view?.layoutIfNeeded()
            }, completion: nil)

        } else {
            // animate
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.contentView?.makeAppointView?.iconView?.alpha = 0.0
                self.modView?.contentView?.makeAppointView?.tipLabel?.alpha = 0.0
                self.modView?.contentView?.starSiteView?.splitView?.alpha = 0.0
                
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-58.0 * kHeightRatio)
                    make.height.equalTo(183.0 * kHeightRatio)
                })
                self.modView?.contentView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(150.0 * kHeightRatio)
                })

                self.modView?.contentView?.makeAppointView?.iconView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(0.0 * kHeightRatio)
                })
                
                self.modView?.contentView?.makeAppointView?.tipLabel?.snp.updateConstraints({ (make) in
                    make.height.equalTo(0.0 * kHeightRatio)
                })
                self.modView?.contentView?.carTypeScrollView?.splitLineView_top?.alpha = 0.0
                self.view?.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
   
    // 接送机
    @objc fileprivate func clickTransferBtnEvent() {
        print("clickTransferBtnEvent")
        let transferVC = WYTransferViewController.init()
        navigationController?.pushViewController(transferVC, animated: true)
    }
    
    // 包车
    @objc fileprivate func clickCharterBtnEvent() {
        print("clickCharterBtnEvent")
        let charterVC = WYCharterViewController.init()
        navigationController?.pushViewController(charterVC, animated: true)
    }
    
    // 定位
    @objc fileprivate func clickLocateBtnEvent() {
        print("clickLocateBtnEvent")
        mapView?.setCenter(locationCoordinate!, animated: true)
    }
    
    
    @objc fileprivate func handleStarPlaceEvent() {
        print("handleStarPlaceEvent")
        let starPlaceVC = WYSelectSiteViewController.init()
        starPlaceVC.tagId = 0
        starPlaceVC.navigationItem.title = String.init("选择上车地点")
        navigationController?.pushViewController(starPlaceVC, animated: true)
    }
    
    @objc fileprivate func handleEndPlaceEvent() {
        print("handleEndPlaceEvent")
        let endPlaceVC = WYSelectSiteViewController.init()
        endPlaceVC.tagId = 1
        endPlaceVC.navigationItem.title = String.init("选择下车地点")
        navigationController?.pushViewController(endPlaceVC, animated: true)
    }
    
    
    @objc fileprivate func handleMakeAppointEvent() {
        print("handleMakeAppointEvent")
        chooseTimeView?.isHidden = false
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.chooseTimeView?.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: kAlpha)
            self.chooseTimeView?.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self.chooseTimeView!)
            })
            self.chooseTimeView?.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
    //  UIView Animation
    // MARK: - 地图区域将要发生改变调用
    fileprivate func callRegionWillChangeAnimated() {
        
        self.modView?.contentView?.starSiteView?.siteLabel?.text = String.init("正在获取上车地点...")
        
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
            self.paoView?.alpha = 0.0
            self.paoViewLabel?.alpha = 0.0
            self.paoView?.snp.updateConstraints { (make) in
                make.bottom.equalTo(self.annotationView!.snp.top).offset(6.0 * kHeightRatio)
                make.width.equalTo(0.0 * kWidthRatio)
                make.height.equalTo(0.0 * kHeightRatio)
            }
            self.paoViewLabel?.snp.updateConstraints({ (make) in
                make.height.equalTo(0.0 * kHeightRatio)
                make.width.equalTo(0.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        if navigationItem.title != String.init("确认信息") {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(self.modView!.height)
                })
                self.view.layoutIfNeeded()
                
            }, completion: nil)
        } else {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(self.modView!.height)
                })
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.callCarButton?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(self.modView!.height + kFootBtnHeight * kHeightRatio + 6.5 * kHeightRatio)
                })
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    
    
    
    // MARK: - 地图区域已经发生改变调用
    fileprivate func callRegionDidChangeAnimated() {
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
            self.paoView?.alpha = 1.0
            self.paoViewLabel?.alpha = 1.0
            self.paoView?.snp.updateConstraints { (make) in
                make.bottom.equalTo(self.annotationView!.snp.top).offset(-6.0 * kHeightRatio)
                make.width.equalTo(137.0 * kWidthRatio)
                make.height.equalTo(38.0 * kHeightRatio)
            }
            self.paoViewLabel?.snp.updateConstraints({ (make) in
                make.height.equalTo(14.0 * kHeightRatio)
                make.width.equalTo(105.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        
//        addRippleAnimation(center: annotationView!.center)
        
        
        if navigationItem.title != String.init("确认信息") {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-19.0 * kHeightRatio)
                })
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.callCarButton?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-6.5 * kHeightRatio)
                })
                self.modView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-58.0 * kHeightRatio)
                })
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        
        
    }
    
//    func addRippleAnimation(center: CGPoint) {
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.lineWidth = kLineWidth
//        shapeLayer.strokeColor = UIColor.globalThemeDefaultColor().cgColor
//        let path = UIBezierPath(roundedRect: CGRect.init(x: 0.0, y: 0.0, width: kRoundedRectWidth, height: kRoundedRectWidth), cornerRadius: kRoundedRectWidth/2.0)
//        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = UIColor.globalThemeDefaultColor().cgColor
//        shapeLayer.position = center
//        shapeLayer.bounds = path.bounds
//        mapView?.layer.addSublayer(shapeLayer)
//        
//        // transform.scale
//        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
//        scaleAnimation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
//        scaleAnimation.toValue = NSValue.init(caTransform3D: CATransform3DMakeScale(20.0 * kWidthRatio, 10.0 * kHeightRatio, 1.0))
//        
//        // opacity
//        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
//        alphaAnimation.fromValue = 1
//        alphaAnimation.toValue  = 0
//        
//        // group animation
//        let groupAnimation = CAAnimationGroup()
//        groupAnimation.animations  = [scaleAnimation, alphaAnimation]
//        groupAnimation.duration = kTimeDuration
//        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        groupAnimation.isRemovedOnCompletion = false
//        groupAnimation.repeatCount = kRepeatCount
//        shapeLayer.add(groupAnimation, forKey: nil)
//    }
    
    
    // MARK: - BMKMapViewDelegate
    // 地图区域将要改变会调用此接口
    func mapView(_ mapView: BMKMapView!, regionWillChangeAnimated animated: Bool) {
        print("regionWillChangeAnimated \(mapView!.centerCoordinate)")
        callRegionWillChangeAnimated()
    }
    
    // 地图区域改变完成后会调用此接口
    func mapView(_ mapView: BMKMapView!, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated \(mapView!.centerCoordinate)")
        reverseGeocode(coordinate: mapView!.centerCoordinate)
        callRegionDidChangeAnimated()
    }
    
    
    
    // MARK: - BMKLocationServiceDelegate
    // 实现相关delegate 处理位置信息更新 处理方向变更信息
    internal func didUpdateUserHeading(_ userLocation: BMKUserLocation!) {
        print(userLocation.heading)
        mapView?.updateLocationData(userLocation)

    }

    // 处理位置坐标更新
    func didUpdate(_ userLocation: BMKUserLocation!) {
        print(mapView!.centerCoordinate.latitude, mapView!.centerCoordinate.longitude)
        print(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude)
        mapView?.updateLocationData(userLocation)
        locationCoordinate = userLocation.location.coordinate
    }
    
    // 地图初始化完毕时会调用此接口
    func mapViewDidFinishLoading(_ mapView: BMKMapView!) {
        print("mapViewDidFinishLoading \(locationCoordinate!)")
        reverseGeocode(coordinate: locationCoordinate!)
        callRegionWillChangeAnimated()
    }
    
    // 地图渲染完毕后会调用此接口
    func mapViewDidFinishRendering(_ mapView: BMKMapView!) {
        print("mapViewDidFinishRendering \(mapView!.centerCoordinate)")
        callRegionDidChangeAnimated()
    }
    
    
    // MARK: - BMKMapViewDelegate
    // 根据anntation生成对应的View 大头针效果
    func mapView(_ mapView: BMKMapView!, viewFor annotation: BMKAnnotation!) -> BMKAnnotationView! {
        
        if (annotation as! BMKPointAnnotation) == pointAnnotation {
            let kAnnotationViewID = "annotationViewID"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: kAnnotationViewID) as! BMKPinAnnotationView?
            if annotationView == nil {
                annotationView = BMKPinAnnotationView(annotation: annotation, reuseIdentifier: kAnnotationViewID)
                annotationView?.image = UIImage.init(named: "home_map_car_icon_13x13_")
                annotationView!.animatesDrop = false
                annotationView!.isDraggable = false
            }
            annotationView?.annotation = annotation
            return annotationView
        }
        return nil
    }
    
    // 当mapView新添加annotation views时，调用此接口
    func mapView(_ mapView: BMKMapView!, didAddAnnotationViews views: [Any]!) {
        print("didAddAnnotationViews")
    }
    
    // 当选中一个annotation views时，调用此接口
    func mapView(_ mapView: BMKMapView!, didSelect view: BMKAnnotationView!) {
        print("didSelect")
    }
    
    // 当取消选中一个annotation views时，调用此接口
    func mapView(_ mapView: BMKMapView!, didDeselect view: BMKAnnotationView!) {
        print("didDeselect")
    }
    
    // 拖动annotation view时，若view的状态发生变化，会调用此函数
    func mapView(_ mapView: BMKMapView!, annotationView view: BMKAnnotationView!, didChangeDragState newState: UInt, fromOldState oldState: UInt) {
        print("annotation view state change : \(oldState) : \(newState)")
    }
    
    // 当点击annotation view弹出的泡泡时，调用此接口
    func mapView(_ mapView: BMKMapView!, annotationViewForBubble view: BMKAnnotationView!) {
        print("annotationViewForBubble")
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
            self.modView?.contentView?.starSiteView?.siteLabel?.text = addressArray.first?.mainName
        } else {
            print("抱歉，未找到结果")
        }
    }
}
