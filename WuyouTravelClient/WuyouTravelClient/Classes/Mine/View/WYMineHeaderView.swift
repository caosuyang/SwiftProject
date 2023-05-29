//
//  WYMineHeaderView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material
import SnapKit

class WYMineHeaderView: UIView {

    var iconView: UIImageView!
    var telNumberLabel: UILabel!
    var comNameLabel: UILabel!
    var cancelBtn: Button!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMineHeaderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension WYMineHeaderView {
    fileprivate func initMineHeaderView() {
        iconView = UIImageView.init()
        iconView.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(50.0 * kHeightRatio / 2))!
        addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(23.0 * kWidthRatio)
            make.bottom.equalTo(self).offset(-56.0 * kHeightRatio)
            make.width.height.equalTo(50.0 * kHeightRatio)
        }
        iconView.backgroundColor = UIColor.globalThemeDefaultColor()
        iconView.image = UIImage.init(named: "mine_sideslip_head_icon_50x50_")
        
        telNumberLabel = UILabel.init()
        addSubview(telNumberLabel)
        telNumberLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(14.0 * kWidthRatio)
            make.top.equalTo(iconView).offset(6.0 * kHeightRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        }
        telNumberLabel.backgroundColor = UIColor.globalThemeDefaultColor()
        telNumberLabel.text = String.init("XXX****XXXX")
        telNumberLabel.textColor = UIColor.white
        telNumberLabel.font = UIFont.globalTitleBoldFont()
        
        comNameLabel = UILabel.init()
        addSubview(comNameLabel)
        comNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(telNumberLabel)
            make.bottom.equalTo(iconView).offset(-5.0 * kHeightRatio)
            make.height.equalTo(11.0 * kHeightRatio)
            make.right.equalTo(self).offset(-14.0 * kWidthRatio)
        }
        comNameLabel.backgroundColor = UIColor.globalThemeDefaultColor()
        comNameLabel.text = String.init("XXXXXXXXXXXXXXXXX")
        comNameLabel.textColor = UIColor.white
        comNameLabel.font = UIFont.globalSupTextFont()
        
        cancelBtn = Button.init()
        addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(41.0 * kHeightRatio)
            make.right.equalTo(self).offset(-11.0 * kWidthRatio)
            make.width.height.equalTo(17.0 * kHeightRatio)
        }
        cancelBtn.backgroundColor = UIColor.globalThemeDefaultColor()
        cancelBtn.image = UIImage.init(named: "mine_sideslip_close_btn_17x17_")
    }
}
