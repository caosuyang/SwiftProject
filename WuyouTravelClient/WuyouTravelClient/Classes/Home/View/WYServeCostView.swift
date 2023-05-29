//
//  WYServeCostView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/21.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYServeCostView: UIView {

    var iconView: UIImageView?
    var tipLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initServeCostView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initServeCostView() {
        backgroundColor = UIColor.white
        
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(45.0 * kWidthRatio)
            make.centerY.equalTo(self).offset(2.0 * kHeightRatio)
            make.width.equalTo(12.0 * kWidthRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        iconView?.backgroundColor = .white
        iconView?.image = UIImage.init(named: "info_service_price_icon_12x13_")
        
        tipLabel = UILabel.init()
        addSubview(tipLabel!)
        tipLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(iconView!.snp.right).offset(10.0 * kWidthRatio)
            make.centerY.equalTo(iconView!)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        tipLabel?.backgroundColor = UIColor.white
        tipLabel?.text = String.init("服务价格")
        tipLabel?.textColor = UIColor.globalHeadlineColor()
        tipLabel?.font = UIFont.globalMainTextFont()
    }

}
