//
//  WYCancelOrderBtnView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/6.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYCancelOrderBtnView: UIView {

    var textLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCancelOrderBtnView()
        initShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initCancelOrderBtnView() {
        backgroundColor = UIColor.white
        isUserInteractionEnabled = true
        
        textLabel = UILabel.init()
        addSubview(textLabel!)
        textLabel?.snp.makeConstraints({ (make) in
            make.center.equalTo(self)
            make.height.equalTo(15.0 * kHeightRatio)
        })
        textLabel?.backgroundColor = UIColor.white
        textLabel?.text = String.init("取消订单")
        textLabel?.textAlignment = .center
        textLabel?.textColor = UIColor.globalHeadlineColor()
        textLabel?.font = UIFont.globalTitleRegularFont()
    }
    
    private func initShadow() {
        layer.cornerRadius = kCornerRadius
        layer.shadowColor = UIColor.globalShadowColor().cgColor
        layer.shadowOpacity = kShadowOpacity
        layer.shadowRadius = kShadowRadius
        layer.shadowOffset = kShadowOffset
    }
}
