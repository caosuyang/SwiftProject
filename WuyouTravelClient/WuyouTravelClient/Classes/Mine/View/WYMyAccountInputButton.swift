//
//  WYMyAccountInputButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyAccountInputButton: UIButton {
    
    var textField: UITextField?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initMyAccountInputButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initMyAccountInputButton() {
        backgroundColor = UIColor.white
        textField = UITextField.init()
        addSubview(textField!)
        textField?.snp.makeConstraints({ (make) in
            make.center.equalTo(self)
            make.width.equalTo(60.0 * kWidthRatio)
            make.height.equalTo(15.0 * kHeightRatio)
        })
        textField?.backgroundColor = UIColor.white
        textField?.borderStyle = .none
        textField?.textColor = UIColor.globalHeadlineColor()
        textField?.font = UIFont.globalMainTextFont()
        textField?.placeholder = String.init("其他金额")
        textField?.attributedPlaceholder = NSAttributedString.init(string: String.init("其他金额"), attributes: [NSAttributedStringKey.font:UIFont.globalMainTextFont() ?? UIFont.systemFont(ofSize: 14.0  * kHeightRatio)])
        textField?.attributedPlaceholder = NSAttributedString.init(string: String.init("其他金额"), attributes: [  NSAttributedStringKey.foregroundColor:UIColor.globalBtnTitleDisabledColor()])
        textField?.keyboardType = .numberPad
        layer.borderWidth = kBorderWidth / 2
        layer.borderColor = UIColor.globalBorderNormalColor().cgColor
    }
}
