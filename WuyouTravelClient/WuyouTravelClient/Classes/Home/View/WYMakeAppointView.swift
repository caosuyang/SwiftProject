//
//  WYMakeAppointView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMakeAppointView: UIView {

    var iconView: UIImageView?
    var tipLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initControls() {
        backgroundColor = .white
        isUserInteractionEnabled = true
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(114.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.equalTo(12.0 * kWidthRatio)
            make.height.equalTo(15.0 * kHeightRatio)
        }
        iconView?.image = UIImage.init(named: "home_appoint_time_icon_12x15_")
        
        tipLabel = UILabel.init()
        addSubview(tipLabel!)
        tipLabel?.snp.makeConstraints { (make) in
            make.left.equalTo(iconView!.snp.right).offset(8.0 * kWidthRatio)
            make.centerY.equalTo(iconView!)
            make.height.equalTo(14.0 * kHeightRatio)
        }
        tipLabel?.backgroundColor = UIColor.white
        tipLabel?.text = String.init("请选择预约时间")
        tipLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        tipLabel?.font = UIFont.globalMainTextFont()
    }
}
