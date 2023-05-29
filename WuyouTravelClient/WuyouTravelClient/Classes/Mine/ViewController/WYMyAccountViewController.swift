//
//  WYMyAccountViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material
import SVProgressHUD

class WYMyAccountViewController: UIViewController, UITextFieldDelegate {

    var detailButton: Button?
    var myAccountView: WYMyAccountView?
    var paymentMethodView: WYPaymentMethodView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNotification()
        initBackgroundColor()
        initNavigationItem()
        initMyAccountView()
        initPaymentMethodView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myAccountView?.accountBtnsView?.accountBtn_more?.textField?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        myAccountView?.accountBtnsView?.accountBtn_more?.textField?.delegate = nil
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

// MARK: - init control

extension WYMyAccountViewController {
    
    // 注册通知中心，监听键盘状态
    fileprivate func initNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("我的账户")
        
        detailButton = Button.init()
        detailButton?.backgroundColor = UIColor.globalThemeDefaultColor()
        detailButton?.image = UIImage.init(named: "nav_details_btn_nor_11x12_")
        detailButton?.title = String.init("明细")
        detailButton?.titleColor = UIColor.globalBtnTitleDefaultColor()
        detailButton?.titleLabel?.font = UIFont.globalMainTextFont()
        detailButton?.titleLabel?.textAlignment = .right
        detailButton?.imageEdgeInsets = UIEdgeInsetsMake(0.0, -3.0 * kWidthRatio, 0.0, 3.0 * kWidthRatio)
        detailButton?.titleEdgeInsets = UIEdgeInsetsMake(0.0, 3.0 * kWidthRatio, 0.0, -3.0 * kWidthRatio)
        detailButton?.pulseAnimation = .none
        detailButton?.addTarget(self, action: #selector(clickDetailBtnEvent), for: .touchUpInside)
        navigationItem.rightViews = [detailButton!]
        
//        let contentView = View()
//        contentView.backgroundColor = UIColor.clear
//        contentView.addSubview(detailButton!)
//        detailButton?.snp.makeConstraints { (make) in
//            make.centerY.equalTo(contentView)
//            make.right.equalTo(contentView).offset(-kMargin * kWidthRatio)
//            make.width.equalTo(44.0 * kWidthRatio)
//            make.height.equalTo(22.0 * kHeightRatio)
//        }
//        navigationItem.rightViews = [contentView]
        
    }
    
    fileprivate func initMyAccountView() {
        myAccountView = WYMyAccountView.init()
        view.addSubview(myAccountView!)
        myAccountView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        myAccountView?.accountTopView?.figureLabel?.text = String.init("80.66")
        myAccountView?.rechargeBtn?.addTarget(self, action: #selector(clickRechargeBtnEvent), for: .touchUpInside)
        myAccountView?.insuranceBtn?.addTarget(self, action: #selector(clickInsuranceBtnEvent), for: .touchUpInside)
    }
    
    fileprivate func initPaymentMethodView() {
        let window = UIApplication.shared.keyWindow
        paymentMethodView = WYPaymentMethodView.init()
        window?.addSubview(paymentMethodView!)
        paymentMethodView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(window!)
        })
        paymentMethodView?.wxPayButton?.addTarget(self, action: #selector(clickWxPayBtnEvent), for: .touchUpInside)
        paymentMethodView?.aliPayButton?.addTarget(self, action: #selector(clickAliPayBtnEvent), for: .touchUpInside)
    }
}

extension WYMyAccountViewController {
    @objc fileprivate func clickDetailBtnEvent() {
        print("clickDetailBtnEvent")
        let detailVC = WYAccountDetailTableViewController.init()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc fileprivate func clickRechargeBtnEvent() {
        print("clickRechargeBtnEvent")

        paymentMethodView?.isHidden = false
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.paymentMethodView?.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: kAlpha)
            self.paymentMethodView?.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self.paymentMethodView!)
            })
            self.paymentMethodView?.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc fileprivate func clickWxPayBtnEvent() {
        print("clickWxPayBtnEvent")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
            self.paymentMethodView?.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.paymentMethodView?.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self.paymentMethodView!).offset(210.0 * kHeightRatio)
            })
            self.paymentMethodView?.layoutIfNeeded()
        }) { (true) in
            self.paymentMethodView?.isHidden = true
            let rechargeNoticeVC = WYRechargeNoticeViewController.init()
            self.navigationController?.pushViewController(rechargeNoticeVC, animated: true)
        }
    }
    
    @objc fileprivate func clickAliPayBtnEvent() {
        print("clickAliPayBtnEvent")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.paymentMethodView?.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.paymentMethodView?.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self.paymentMethodView!).offset(210.0 * kHeightRatio)
            })
            self.paymentMethodView?.layoutIfNeeded()
        }) { (true) in
            self.paymentMethodView?.isHidden = true
            let rechargeNoticeVC = WYRechargeNoticeViewController.init()
            self.navigationController?.pushViewController(rechargeNoticeVC, animated: true)
        }
        
    }
    
    @objc fileprivate func clickInsuranceBtnEvent() {
        print("clickInsuranceBtnEvent")
        SVProgressHUD.showInfo(withStatus: String.init("无忧出行账户安全保障，请放心使用"))
        
    }
    
    @objc fileprivate func keyboardWillChange(_ notification: Notification) {
        print("keyboardWillChange")
        if let userInfo = notification.userInfo {
            let value = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double
            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
            let frame = value?.cgRectValue
            let intersection = frame?.intersection(view.frame)
            let contentViewBottomOriginY = myAccountView!.height - myAccountView!.contentView!.height
            print(duration!, UIViewAnimationOptions(rawValue: curve!), -intersection!.height + contentViewBottomOriginY)
            UIView.animate(withDuration: duration!, delay: kDelayInterval, options: UIViewAnimationOptions(rawValue: curve!), animations: {
                self.myAccountView?.contentView?.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.myAccountView!).offset(-intersection!.height + contentViewBottomOriginY)
                })
                self.myAccountView?.layoutIfNeeded()
            }, completion: nil)
            
//            UIView.animate(withDuration: 0.25, delay: kDelayInterval, options: .curveEaseInOut, animations: {
//                self.myAccountView?.contentView?.snp.updateConstraints({ (make) in
//                    make.top.equalTo(self.myAccountView!).offset(-49.0)
//                })
//                self.myAccountView?.layoutIfNeeded()
//            }, completion: nil)
            
        }
    }
    
    @objc fileprivate func keyboardWillHidden(_ notification: Notification) {
        print("keyboardWillHidden")
        if let userInfo = notification.userInfo {
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double
            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
            print(duration!, UIViewAnimationOptions(rawValue: curve!))
            
            UIView.animate(withDuration: duration!, delay: kDelayInterval, options: UIViewAnimationOptions(rawValue: curve!), animations: {
                self.myAccountView?.contentView?.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.myAccountView!)
                })
                self.myAccountView?.layoutIfNeeded()
            }, completion: nil)
            
//            UIView.animate(withDuration: 0.25, delay: kDelayInterval, options: .curveEaseInOut, animations: {
//                self.myAccountView?.contentView?.snp.updateConstraints({ (make) in
//                    make.top.equalTo(self.myAccountView!)
//                })
//                self.myAccountView?.layoutIfNeeded()
//            }, completion: nil)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        myAccountView?.accountBtnsView?.accountBtn_more?.textField?.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        myAccountView?.accountBtnsView?.accountBtn_50?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        myAccountView?.accountBtnsView?.accountBtn_100?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        myAccountView?.accountBtnsView?.accountBtn_200?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        myAccountView?.accountBtnsView?.accountBtn_500?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        myAccountView?.accountBtnsView?.accountBtn_1000?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        myAccountView?.accountBtnsView?.accountBtn_more?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn")
        let string = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if string.length > 6 {
            return false
        }
        return true
    }
}
