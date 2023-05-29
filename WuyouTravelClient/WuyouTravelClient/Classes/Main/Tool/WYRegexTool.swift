//
//  WYRegexTool.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation

class WYRegexTool {

    // 验证手机号
    class func validatePhoneNumber(phoneNum: String) -> Bool {
        let phoneRegex = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phoneNum)
    }

    // 验证验证码
    class func validateSecurityCode(yzmCode: String) -> Bool {
        let yzmCodeRegex = "\\d{6}"
        let yzmCodePredicate = NSPredicate(format: "SELF MATCHES %@", yzmCodeRegex)
        return yzmCodePredicate.evaluate(with: yzmCode)
    }
    
    // 验证用户名
    class func validateUserName(userName: String) -> Bool {
        let userNameRegex = "^[A-Za-z0-9]{6,20}+$"
        let userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegex)
        return userNamePredicate.evaluate(with: userName)
    }
    
}
