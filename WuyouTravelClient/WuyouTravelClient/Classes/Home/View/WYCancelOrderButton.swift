//
//  WYCancelOrderButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/23.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYCancelOrderButton: UIButton {

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
        setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnTitleDefaultColor()), for: .normal)
        setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnHighlightedColor()), for: .highlighted)
        setTitle(String.init("取消订单"), for: .normal)
        setTitleColor(UIColor.globalHeadlineColor(), for: .normal)
        titleLabel?.font = UIFont.globalTitleRegularFont()
    }
    
    private func initBorderAttribute() {
        layer.masksToBounds = true
        layer.borderWidth = kBorderWidth / 2
        layer.borderColor = UIColor.globalBtnTitleDefaultColor().cgColor
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
