//
//  WYLoginViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/11.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material
import SnapKit
import SVProgressHUD

class WYLoginViewController: UIViewController, TextFieldDelegate {
    
    var loginView: WYLoginView?
    var timer: Timer?
    var seconds: Int = 60
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initLoginView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginView?.telNumTextField?.delegate = self
        loginView?.yzmCodeTextField?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        loginView?.telNumTextField?.delegate = nil
        loginView?.yzmCodeTextField?.delegate = nil
        timer?.invalidate()
        timer = nil
    }

}

// MARK: - init control

extension WYLoginViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initLoginView() {
        loginView = WYLoginView()
        view.addSubview(loginView!)
        loginView?.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        loginView?.yzmCodeBtn?.addTarget(self, action: #selector(clickGetSecuratyBtn), for: .touchUpInside)
        loginView?.loginBtn?.addTarget(self, action: #selector(handleLoginEvent), for: .touchUpInside)
    }
    
}

extension WYLoginViewController {
    @objc fileprivate func handleLoginEvent() {
        print("handleLoginEvent")
        if WYRegexTool.validateSecurityCode(yzmCode: loginView!.yzmCodeTextField!.text!) {
            
            if WYRegexTool.validatePhoneNumber(phoneNum: loginView!.telNumTextField!.text!) {
                print("正在登录...")
                SVProgressHUD.showInfo(withStatus: String.init("正在登录..."))
                navigationController?.popViewController(animated: true)
            } else {
                print("请输入有效的手机号码")
                SVProgressHUD.showError(withStatus: String.init("请输入有效的手机号码"))
            }
            
        } else {
            print("请输入有效的验证码")
            SVProgressHUD.showError(withStatus: String.init("请输入有效的验证码"))
        }
    }
    
    @objc fileprivate func clickGetSecuratyBtn() {
        print("clickGetSecuratyBtn")
        
        if WYRegexTool.validatePhoneNumber(phoneNum: loginView!.telNumTextField!.text!) {
            print("验证码已发送，请查收")
            SVProgressHUD.showSuccess(withStatus: String.init("验证码已发送，请查收"))
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFire), userInfo: nil, repeats: true)
        } else {
            print("请输入有效的手机号码")
            SVProgressHUD.showError(withStatus: String.init("请输入有效的手机号码"))
        }
        
    }
    
    @objc fileprivate func timerFire(timer: Timer) {
        if seconds == 1 {
            timer.invalidate()
            seconds = 60
            loginView?.yzmCodeBtn?.title = String.init("重新获取")
            loginView?.yzmCodeBtn?.backgroundColor = UIColor.globalThemeDefaultColor()
            loginView?.yzmCodeBtn?.titleColor = UIColor.globalBtnTitleDefaultColor()
            loginView?.yzmCodeBtn?.isUserInteractionEnabled = true
        } else {
            seconds = seconds - 1
//            loginView?.yzmCodeBtn?.title = String.init(String(describing: seconds))?.appending("S后重发")
            loginView?.yzmCodeBtn?.title = String.init(String.init(seconds)).appending("S后重发")
            loginView?.yzmCodeBtn?.backgroundColor = UIColor(r: 219, g: 219, b: 219)
            loginView?.yzmCodeBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
            loginView?.yzmCodeBtn?.isUserInteractionEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        loginView?.telNumTextField?.resignFirstResponder()
        loginView?.yzmCodeTextField?.resignFirstResponder()
    }
    
    @nonobjc func textField(textField: UITextField, didChange text: String?) {
        print("didChange")
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn")
        let string = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField.isEqual(loginView?.telNumTextField) {
            if string.length > 11 {
                return false
            } else if string.length == 11 {
                loginView?.yzmCodeBtn?.backgroundColor = UIColor.globalThemeDefaultColor()
                loginView?.yzmCodeBtn?.titleColor = UIColor.globalBtnTitleDefaultColor()
                loginView?.yzmCodeBtn?.isUserInteractionEnabled = true
                
                if loginView?.yzmCodeTextField?.text?.length == 6 {
                    loginView?.loginBtn?.backgroundColor = UIColor.globalThemeDefaultColor()
                    loginView?.loginBtn?.titleColor = UIColor.globalBtnTitleDefaultColor()
                    loginView?.loginBtn?.isUserInteractionEnabled = true
                }
                
            } else if string.length > 0 && string.length < 11 {
                loginView?.loginBtn?.backgroundColor = UIColor.globalThemeDisabledColor()
                loginView?.loginBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
                loginView?.loginBtn?.isUserInteractionEnabled = false
                if loginView!.yzmCodeBtn!.title!.contains(String.init("S后重发")) {
                    return false
                } else if loginView!.yzmCodeBtn!.title!.contains(String.init("获取验证码")) || loginView!.yzmCodeBtn!.title!.contains(String.init("重新获取")) {
                    loginView?.yzmCodeBtn?.backgroundColor = UIColor(r: 219, g: 219, b: 219)
                    loginView?.yzmCodeBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
                    loginView?.yzmCodeBtn?.isUserInteractionEnabled = false
                    return true
                }
            } else if string.length == 0 {
                loginView?.loginBtn?.backgroundColor = UIColor.globalThemeDisabledColor()
                loginView?.loginBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
                loginView?.loginBtn?.isUserInteractionEnabled = false
                if loginView!.yzmCodeBtn!.title!.contains(String.init("S后重发")) {
                    return false
                } else if loginView!.yzmCodeBtn!.title!.contains(String.init("获取验证码")) || loginView!.yzmCodeBtn!.title!.contains(String.init("重新获取")) {
                    loginView?.yzmCodeBtn?.title = String.init("获取验证码")
                    loginView?.yzmCodeBtn?.backgroundColor = UIColor(r: 219, g: 219, b: 219)
                    loginView?.yzmCodeBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
                    loginView?.yzmCodeBtn?.isUserInteractionEnabled = false
                    return true
                }
            }
        } else if textField.isEqual(loginView?.yzmCodeTextField) {
            if string.length > 6 {
                return false
            } else if string.length == 6 {
                
                if loginView?.telNumTextField?.text?.length == 11 {
                    loginView?.loginBtn?.backgroundColor = UIColor.globalThemeDefaultColor()
                    loginView?.loginBtn?.titleColor = UIColor.globalBtnTitleDefaultColor()
                    loginView?.loginBtn?.isUserInteractionEnabled = true
                }
                
            } else if string.length < 6 {
                loginView?.loginBtn?.backgroundColor = UIColor.globalThemeDisabledColor()
                loginView?.loginBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
                loginView?.loginBtn?.isUserInteractionEnabled = false
            }
        }
        return true
    }
    
   
    
}
