//
//  WYLoginView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/13.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material
import SnapKit

class WYLoginView: UIView {
    
    var titleLabel: UILabel?
    var telNumTextField: TextField?
    var yzmCodeTextField: TextField?
    var yzmCodeBtn: Button?
    var loginBtn: Button?
    var bottomLineView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initBackgroundColor()
        initTitleLabel()
        initTelNumberTextField()
        initSecurityCodeTextField()
        initSecurityCodeBtn()
        initLoginBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension WYLoginView {
    fileprivate func initBackgroundColor() {
        backgroundColor = UIColor.white
    }
    
    fileprivate func initTitleLabel() {
        titleLabel = UILabel.init()
        addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(53.0 * kHeightRatio)
            make.centerX.equalTo(self)
            make.height.equalTo(20.0 * kHeightRatio)
        }
        titleLabel?.backgroundColor = UIColor.white
        titleLabel?.text = String.init("请使用手机号登录")
        titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 20.0 * kHeightRatio)
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.textAlignment = .center
        
    }
    
    fileprivate func initTelNumberTextField() {
        telNumTextField = TextField.init()
        addSubview(telNumTextField!)
        telNumTextField?.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(24.0 * kWidthRatio)
            make.right.equalTo(self).offset(-24.0 * kWidthRatio)
            make.top.equalTo(titleLabel!.snp.bottom).offset(58.0 * kHeightRatio)
            make.height.equalTo(kInputFieldHeight * kHeightRatio)
        }
        telNumTextField?.backgroundColor = UIColor.white
        telNumTextField?.font = UIFont.globalTitleBoldFont()
        telNumTextField?.textColor = UIColor.globalHeadlineColor()
        telNumTextField?.textInset = kFieldSpacing * kHeightRatio
        telNumTextField?.placeholder = String.init("请输入手机号码")
        telNumTextField?.placeholderLabel.font = UIFont.globalTitleRegularFont()
        telNumTextField?.placeholderVerticalOffset = kFieldSpacing * kHeightRatio
        telNumTextField?.placeholderActiveColor = UIColor.globalThemeDefaultColor()
        telNumTextField?.placeholderNormalColor = UIColor.globalThemeDisabledColor()
        telNumTextField?.dividerNormalHeight = kSplitLineHeight
        telNumTextField?.dividerActiveHeight = kSplitLineHeight
        telNumTextField?.dividerNormalColor = UIColor.globalSplitLineColor()
        telNumTextField?.dividerActiveColor = UIColor.globalSplitLineColor()
        telNumTextField?.isClearIconButtonEnabled = false
        telNumTextField?.isClearIconButtonAutoHandled = false
        telNumTextField?.returnKeyType = .next
        telNumTextField?.keyboardType = .numberPad
        telNumTextField?.keyboardAppearance = .light
    }
    
    fileprivate func initSecurityCodeTextField() {
        yzmCodeTextField = TextField.init()
        addSubview(yzmCodeTextField!)
        yzmCodeTextField?.snp.makeConstraints { (make) in
            make.left.equalTo(telNumTextField!)
            make.right.equalTo(telNumTextField!).offset(-105.0 * kWidthRatio)
            make.top.equalTo(telNumTextField!.snp.bottom).offset(22.0 * kHeightRatio)
            make.height.equalTo(kInputFieldHeight * kHeightRatio)
        }
        yzmCodeTextField?.backgroundColor = UIColor.white
        yzmCodeTextField?.font = UIFont.globalTitleBoldFont()
        yzmCodeTextField?.textColor = UIColor.globalHeadlineColor()
        yzmCodeTextField?.textInset = kFieldSpacing * kHeightRatio
        yzmCodeTextField?.placeholder = String.init("请输入验证码")
        yzmCodeTextField?.placeholderLabel.font = UIFont.globalTitleRegularFont()
        yzmCodeTextField?.placeholderVerticalOffset = kFieldSpacing * kHeightRatio
        yzmCodeTextField?.placeholderActiveColor = UIColor.globalThemeDefaultColor()
        yzmCodeTextField?.placeholderNormalColor = UIColor.globalThemeDisabledColor()
        yzmCodeTextField?.dividerNormalHeight = kSplitLineHeight
        yzmCodeTextField?.dividerActiveHeight = kSplitLineHeight
        yzmCodeTextField?.dividerNormalColor = UIColor.globalSplitLineColor()
        yzmCodeTextField?.dividerActiveColor = UIColor.globalSplitLineColor()
        yzmCodeTextField?.isClearIconButtonEnabled = false
        yzmCodeTextField?.isClearIconButtonAutoHandled = false
        yzmCodeTextField?.returnKeyType = .done
        yzmCodeTextField?.keyboardType = .numberPad
        yzmCodeTextField?.keyboardAppearance = .light
        
        bottomLineView = UIView.init()
        addSubview(bottomLineView!)
        bottomLineView?.snp.makeConstraints { (make) in
            make.left.equalTo(yzmCodeTextField!.snp.right)
            make.bottom.equalTo(yzmCodeTextField!)
            make.right.equalTo(telNumTextField!)
            make.height.equalTo(yzmCodeTextField!.dividerNormalHeight)
        }
        bottomLineView?.backgroundColor = yzmCodeTextField!.dividerNormalColor
        
    }
    
    fileprivate func initSecurityCodeBtn() {
        yzmCodeBtn = Button()
        addSubview(yzmCodeBtn!)
        yzmCodeBtn?.snp.makeConstraints { (make) in
            make.left.equalTo(yzmCodeTextField!.snp.right).offset(2.5 * kWidthRatio)
            make.centerY.equalTo(yzmCodeTextField!)
            make.right.equalTo(telNumTextField!).offset(-2.5 * kWidthRatio)
            make.size.equalTo(CGSize(width: 100.0 * kWidthRatio, height: 30.0 * kHeightRatio))
        }
        yzmCodeBtn?.backgroundColor = UIColor(r: 219, g: 219, b: 219)
        yzmCodeBtn?.title = String.init("获取验证码")
        yzmCodeBtn?.titleLabel?.font = UIFont.globalTitleRegularFont()
        yzmCodeBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
        yzmCodeBtn?.pulseColor = UIColor.white
        yzmCodeBtn?.pulseAnimation = .backing
        yzmCodeBtn?.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(2.0))!
        yzmCodeBtn?.isUserInteractionEnabled = false
    }
    
    fileprivate func initLoginBtn() {
        loginBtn = Button()
        addSubview(loginBtn!)
        loginBtn?.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(36.0 * kWidthRatio)
            make.top.equalTo(yzmCodeTextField!.snp.bottom).offset(35.0 * kHeightRatio)
            make.right.equalTo(self).offset(-36.0 * kWidthRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        }
        loginBtn?.backgroundColor = UIColor.globalThemeDisabledColor()
        loginBtn?.title = String.init("登录")
        loginBtn?.titleLabel?.font = UIFont.globalTitleBoldFont()
        loginBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
        loginBtn?.pulseColor = UIColor.white
        loginBtn?.pulseAnimation = .backing
        loginBtn?.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(kCornerRadius))!
        loginBtn?.isUserInteractionEnabled = false
    }
}


