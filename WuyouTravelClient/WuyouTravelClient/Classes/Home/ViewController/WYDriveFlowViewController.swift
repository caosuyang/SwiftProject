//
//  WYDriveFlowViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/25.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYDriveFlowViewController: UIViewController, BMKMapViewDelegate, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate {
    
    fileprivate var mapView: BMKMapView?
    fileprivate var locationService: BMKLocationService?
    fileprivate var locationCoordinate: CLLocationCoordinate2D?
    fileprivate var pointAnnotation: BMKPointAnnotation?
    fileprivate var annotationView: BMKPinAnnotationView?
    fileprivate var flowNotiView: WYDriveFlowNotiView?
    fileprivate var cancelOrderBtnView: WYCancelOrderBtnView?
    fileprivate var locateButton: UIButton?
    fileprivate var fareDetailView: WYFareDetailView?
    fileprivate var paymentBtnView: WYPaymentBtnView?
    fileprivate var paopaoView: WYPaopaoView?
    fileprivate var timer: Timer?
    fileprivate var seconds: Int = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initMapView()
        startLocationService()
        initDriveFlowNotiView()
        initCancleOrderBtnView()
        initLocateBtn()
        initPaymentBtnView()
        initFareDetailView()
        initTimer()
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mapView?.viewWillDisappear()
        mapView?.delegate = nil
        locationService?.delegate = nil
        timer?.invalidate()
        timer = nil
    }

}

// MARK: - init control

extension WYDriveFlowViewController {
    
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("等待应答")
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
    
    
    fileprivate func addPointAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        if pointAnnotation == nil {
            pointAnnotation = BMKPointAnnotation.init()
            pointAnnotation?.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        }
        mapView?.addAnnotation(pointAnnotation)
    }
    
    fileprivate func initDriveFlowNotiView() {
        flowNotiView = WYDriveFlowNotiView.init()
        mapView?.addSubview(flowNotiView!)
        flowNotiView?.snp.makeConstraints({ (make) in
            make.left.equalTo(mapView!).offset(kMargin * kWidthRatio)
            make.right.equalTo(mapView!).offset(-kMargin * kWidthRatio)
            make.top.equalTo(mapView!).offset(-kSecCellHeight * kHeightRatio - kShadowRadius * kHeightRatio)
            make.height.equalTo(kSecCellHeight * kHeightRatio)
        })
        flowNotiView?.titleLabel?.text = String.init("正在为你优先叫车")
    }
    
    fileprivate func initCancleOrderBtnView() {
        cancelOrderBtnView = WYCancelOrderBtnView.init()
        mapView?.addSubview(cancelOrderBtnView!)
        cancelOrderBtnView?.snp.makeConstraints({ (make) in
            make.left.equalTo(mapView!).offset(kMargin * kWidthRatio)
            make.bottom.equalTo(mapView!).offset(kFootBtnHeight * kHeightRatio)
            make.right.equalTo(mapView!).offset(-kMargin * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleTapCancelBtnViewEvent(tap:)))
        cancelOrderBtnView?.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func initLocateBtn() {
        locateButton = UIButton.init()
        mapView?.addSubview(locateButton!)
        locateButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(kMargin * kWidthRatio)
            make.bottom.equalTo(cancelOrderBtnView!.snp.top).offset(-40.0 * kHeightRatio)
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
    
    fileprivate func initPaymentBtnView() {
        paymentBtnView = WYPaymentBtnView.init()
        mapView?.addSubview(paymentBtnView!)
        paymentBtnView?.snp.makeConstraints({ (make) in
            make.left.equalTo(mapView!).offset(kMargin * kWidthRatio)
            make.right.equalTo(mapView!).offset(-kMargin * kWidthRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
            make.bottom.equalTo(mapView!).offset(kFootBtnHeight * kHeightRatio + 7.0 * kHeightRatio + 190.0 * kHeightRatio)
        })
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleTapPaymentBtnViewEvent(tap:)))
        paymentBtnView?.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func initFareDetailView() {
        fareDetailView = WYFareDetailView.init()
        mapView?.addSubview(fareDetailView!)
        fareDetailView?.snp.makeConstraints({ (make) in
            make.left.equalTo(mapView!).offset(kMargin * kWidthRatio)
            make.right.equalTo(mapView!).offset(-kMargin * kWidthRatio)
            make.height.equalTo(190.0 * kHeightRatio)
            make.bottom.equalTo(paymentBtnView!.snp.top).offset(-7.0 * kHeightRatio)
        })
        fareDetailView?.layer.cornerRadius = kCornerRadius
        fareDetailView?.layer.shadowColor = UIColor.globalShadowColor().cgColor
        fareDetailView?.layer.shadowOpacity = kShadowOpacity
        fareDetailView?.layer.shadowRadius = kShadowRadius
        fareDetailView?.layer.shadowOffset = kShadowOffset
        fareDetailView?.totalPriceView?.figureLabel?.text = String.init("108.6")
        fareDetailView?.starFareTypeView?.figureLabel?.text = String.init("18元")
        fareDetailView?.mileageFareTypeView?.figureLabel?.text = String.init("110.6元")
        fareDetailView?.voucherFareTypeView?.figureLabel?.text = String.init("20元")
    }
    
//    fileprivate func addRippleAnimation() {
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.lineWidth = kRoundedRectWidth
//        shapeLayer.strokeColor = UIColor.globalThemeDefaultColor().cgColor
//        let path = UIBezierPath(roundedRect: CGRect.init(x: 0.0, y: 0.0, width: kRoundedRectWidth, height: kRoundedRectWidth), cornerRadius: kRoundedRectWidth/2.0)
//        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = UIColor.globalThemeDefaultColor().cgColor
//        shapeLayer.position = center
//        shapeLayer.bounds = path.bounds
//        annotationView?.layer.addSublayer(shapeLayer)
//        
//        // transform.scale
//        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
//        scaleAnimation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
//        scaleAnimation.toValue = NSValue.init(caTransform3D: CATransform3DMakeScale(30.0 * kHeightRatio, 30.0 * kHeightRatio, 1.0))
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
//        groupAnimation.repeatCount = HUGE
//        shapeLayer.add(groupAnimation, forKey: nil)
//    }
    
    fileprivate func sonar(_ beginTime: CFTimeInterval) {
       
        // The circle in its smallest size.
        let circlePath1 = UIBezierPath(arcCenter: annotationView!.center, radius: CGFloat(3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        // The circle in its largest size.
        let circlePath2 = UIBezierPath(arcCenter: annotationView!.center, radius: CGFloat(80), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        // Configure the layer.
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.globalThemeDefaultColor().cgColor
        shapeLayer.fillColor = UIColor.globalThemeDefaultColor().cgColor
        // This is the path that's visible when there'd be no animation.
        shapeLayer.path = circlePath1.cgPath
        annotationView?.layer.addSublayer(shapeLayer)
        
        // Animate the path.
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = circlePath1.cgPath
        pathAnimation.toValue = circlePath2.cgPath
        
        // Animate the alpha value.
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 0.8
        alphaAnimation.toValue = 0
        
        // We want both path and alpha animations to run together perfectly, so
        // we put them into an animation group.
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = beginTime
        animationGroup.animations = [pathAnimation, alphaAnimation]
        animationGroup.duration = 2.76
        animationGroup.repeatCount = HUGE
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        
        // Add the animation to the layer.
        shapeLayer.add(animationGroup, forKey: "sonar")
    }
    
    
    
    fileprivate func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFire), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate func timerFire(timer: Timer) {
        seconds = seconds - 5
        if seconds / 5 == 4 {
            navigationItem.title = String.init("等待应答")
            
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
                self.flowNotiView?.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.mapView!).offset(8.0 * kHeightRatio)
                })
                self.cancelOrderBtnView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(-kMargin * kHeightRatio)
                })
                self.view?.layoutIfNeeded()
            }, completion: { (true) in
                self.flowNotiView?.titleLabel?.text = String.init("正在为您优先叫车")
                self.flowNotiView?.telBtn?.isHidden = true
            })
            
        } else if seconds / 5 == 3 {
            navigationItem.title = String.init("已接单")
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
                self.flowNotiView?.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.mapView!).offset(-kSecCellHeight * kHeightRatio - kShadowRadius * kHeightRatio)
                })
                self.cancelOrderBtnView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(kFootBtnHeight * kHeightRatio)
                })
                self.view?.layoutIfNeeded()
            }, completion: { (true) in
                
                UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
                    self.flowNotiView?.snp.updateConstraints({ (make) in
                        make.top.equalTo(self.mapView!).offset(8.0 * kHeightRatio)
                    })
                    self.cancelOrderBtnView?.snp.updateConstraints({ (make) in
                        make.bottom.equalTo(self.mapView!).offset(-kMargin * kHeightRatio)
                    })
                    self.view?.layoutIfNeeded()
                }, completion: { (true) in
                    self.flowNotiView?.titleLabel?.text = String.init("张师傅已接单，预计2分钟后到达")
                    self.flowNotiView?.telBtn?.isHidden = false

                })
            })
            
        } else if seconds / 5 == 2 {
            navigationItem.title = String.init("行程中")
            
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.flowNotiView?.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.mapView!).offset(-kSecCellHeight * kHeightRatio - kShadowRadius * kHeightRatio)
                })
                self.cancelOrderBtnView?.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.mapView!).offset(kFootBtnHeight * kHeightRatio)
                })
                self.view?.layoutIfNeeded()
            }, completion: { (true) in
                
                self.cancelOrderBtnView?.isHidden = true
                
                UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                    self.flowNotiView?.snp.updateConstraints({ (make) in
                        make.top.equalTo(self.mapView!).offset(8.0 * kHeightRatio)
                    })
                    self.view?.layoutIfNeeded()
                }, completion: { (true) in
                    self.flowNotiView?.titleLabel?.text = String.init("行程已开始，请您系好安全带")
                    self.flowNotiView?.telBtn?.isHidden = true
                    
                })
            })
            
        } else if seconds / 5 == 1 {
            navigationItem.title = String.init("已完成")
            
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.flowNotiView?.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.mapView!).offset(-kSecCellHeight * kHeightRatio - kShadowRadius * kHeightRatio)
                })
                self.view?.layoutIfNeeded()
            }, completion: { (true) in
                
                UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                    self.flowNotiView?.snp.updateConstraints({ (make) in
                        make.top.equalTo(self.mapView!).offset(8.0 * kHeightRatio)
                    })
                    self.paymentBtnView?.snp.updateConstraints({ (make) in
                        make.bottom.equalTo(self.mapView!).offset(-kMargin * kHeightRatio)
                    })
                    self.locateButton?.alpha = 0.0
                    self.view?.layoutIfNeeded()
                }, completion: { (true) in
                    self.locateButton?.isHidden = true
                    self.flowNotiView?.titleLabel?.text = String.init("当前订单已完成，请点击付款完成支付")
                    self.flowNotiView?.telBtn?.isHidden = true
                })
            })
            
        } else {
            timer.invalidate()
        }
    }
    
    

    
    @objc fileprivate func clickLocateBtnEvent() {
        print("clickLocateBtnEvent")
    }
    
    @objc fileprivate func handleTapCancelBtnViewEvent(tap: UITapGestureRecognizer) {
        print("handleTapCancelBtnViewEvent")
        navigationController?.popViewController(animated: true)
    }

    @objc fileprivate func handleTapPaymentBtnViewEvent(tap: UITapGestureRecognizer) {
        print("handleTapPaymentBtnViewEvent")
        let paymentVC = WYPaymentViewController.init()
        navigationController?.pushViewController(paymentVC, animated: true)
    }
    
}

// MARK: - Handle event

extension WYDriveFlowViewController {

    // MARK: - BMKMapViewDelegate
    // 地图区域将要改变会调用此接口
    func mapView(_ mapView: BMKMapView!, regionWillChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated \(mapView!.centerCoordinate)")
    }
    
    // 地图区域改变完成后会调用此接口
    func mapView(_ mapView: BMKMapView!, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated \(mapView!.centerCoordinate)")
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
        addPointAnnotation(latitude: locationCoordinate!.latitude, longitude: locationCoordinate!.longitude)
    }
    
    // 地图初始化完毕时会调用此接口
    func mapViewDidFinishLoading(_ mapView: BMKMapView!) {
        print("mapViewDidFinishLoading \(locationCoordinate!)")
    }
    
    // 地图渲染完毕后会调用此接口
    func mapViewDidFinishRendering(_ mapView: BMKMapView!) {
        print("mapViewDidFinishRendering \(mapView!.centerCoordinate)")
    }

    // MARK: - BMKMapViewDelegate
    // 根据anntation生成对应的View 大头针效果
    func mapView(_ mapView: BMKMapView!, viewFor annotation: BMKAnnotation!) -> BMKAnnotationView! {
        
        if (annotation as! BMKPointAnnotation) == pointAnnotation {
            let kAnnotationViewID = "annotationViewID"
            annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: kAnnotationViewID) as! BMKPinAnnotationView?
            if annotationView == nil {
                annotationView = BMKPinAnnotationView(annotation: annotation, reuseIdentifier: kAnnotationViewID)
                annotationView?.image = UIImage.init(named: "home_map_location_pin_17x28_")
                annotationView?.animatesDrop = false
                annotationView?.isDraggable = false
                paopaoView = WYPaopaoView.init(frame: CGRect(x: 0.0, y: 0.0, width: 137.0 * kWidthRatio, height: 38.0 * kHeightRatio))
                annotationView?.paopaoView = paopaoView!
            }
            annotationView?.annotation = annotation
            sonar(CACurrentMediaTime())
            sonar(CACurrentMediaTime() + 0.92)
            sonar(CACurrentMediaTime() + 1.84)
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
}
