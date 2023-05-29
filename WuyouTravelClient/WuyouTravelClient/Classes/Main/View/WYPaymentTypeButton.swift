//
//  WYPaymentTypeButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/6.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPaymentTypeButton: UIButton {
    
    var iconView: UIImageView?
    var textLabel: UILabel?
    var splitLineView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initPaymentTypeButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initPaymentTypeButton() {
        setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .normal)
        setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnHighlightedColor()), for: .highlighted)
        
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(122.0 * kWidthRatio)
            make.width.equalTo(24.0 * kWidthRatio)
            make.height.equalTo(21.0 * kHeightRatio)
        })
        iconView?.backgroundColor = UIColor.white
        iconView?.image = UIImage.init(named: "mine_account_wxpay_icon_24x21_")
        
        textLabel = UILabel.init()
        addSubview(textLabel!)
        textLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(iconView!.snp.right).offset(13.0 * kWidthRatio)
            make.centerY.equalTo(iconView!)
            make.height.equalTo(17.0 * kHeightRatio)
        })
        textLabel?.backgroundColor = UIColor.white
        textLabel?.text = String.init("微信支付")
        textLabel?.textAlignment = .left
        textLabel?.textColor = UIColor.globalHeadlineColor()
        textLabel?.font = UIFont.globalNavHeadlineFont()
        
        splitLineView = UIView.init()
        addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
            make.top.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView?.backgroundColor = UIColor.globalSplitLineColor()
    }
}
