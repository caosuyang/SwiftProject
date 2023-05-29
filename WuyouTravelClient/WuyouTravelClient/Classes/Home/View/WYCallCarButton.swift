//
//  WYCallCarButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/25.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYCallCarButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initBasicAttribute()
        initBorderAttribute()
        initShadowAttribute()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initBasicAttribute() {
        setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalThemeDefaultColor()), for: .normal)
        setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalThemeHighlightedColor()), for: .highlighted)
        setTitle(String.init("立即叫车"), for: UIControlState())
        setTitleColor(UIColor.globalBtnTitleDefaultColor(), for: .normal)
        setTitleColor(UIColor.globalBtnHighlightedColor(), for: .highlighted)
        titleLabel?.font = UIFont.globalTitleBoldFont()
    }
    
    private func initBorderAttribute() {
        layer.masksToBounds = true
        layer.borderWidth = kBorderWidth / 2
        layer.borderColor = UIColor.globalThemeDefaultColor().cgColor
        layer.cornerRadius = kCornerRadius
    }
    
    open func initShadowAttribute() {
        layer.shadowColor = UIColor.globalShadowColor().cgColor
        layer.shadowOpacity = kShadowOpacity
        layer.shadowRadius = kShadowRadius
        layer.shadowOffset = kShadowOffset
        layer.backgroundColor = UIColor.globalShadowColor().cgColor
    }
}
