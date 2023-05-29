//
//  WYSiteView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYSiteView: UIView {

    var iconView: UIImageView?
    var siteLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSiteView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSiteView() {
        backgroundColor = .white
        
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(14.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.height.equalTo(11.0 * kHeightRatio)
        }
        iconView?.backgroundColor = .white
        iconView?.image = UIImage.init(named: "transfer_sel_time_icon_11x11_")
        
        siteLabel = UILabel.init()
        addSubview(siteLabel!)
        siteLabel?.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(34.0 * kWidthRatio)
            make.centerY.equalTo(iconView!)
            make.height.equalTo(14.0 * kHeightRatio)
            make.right.equalTo(self).offset(-19.0 * kWidthRatio)
        }
        siteLabel?.backgroundColor = UIColor.white
        siteLabel?.text = String.init("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        siteLabel?.textColor = UIColor.globalMainBodyColor()
        siteLabel?.font = UIFont.globalMainTextFont()
    }


}
