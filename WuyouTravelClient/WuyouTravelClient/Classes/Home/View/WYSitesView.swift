//
//  WYSitesView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYSitesView: UIView {

    var iconView: UIImageView?
    var siteLabel: UILabel?
    var splitView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initControls() {
    
        backgroundColor = .clear
        isUserInteractionEnabled = true
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(22.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.height.equalTo(6.0 * kHeightRatio)
        }
        iconView?.backgroundColor = .white
        iconView?.image = UIImage.init(named: "home_endplace_icon_6x6_")
        
        siteLabel = UILabel.init()
        addSubview(siteLabel!)
        siteLabel?.snp.makeConstraints { (make) in
            make.left.equalTo(iconView!.snp.right).offset(11.0 * kWidthRatio)
            make.centerY.equalTo(iconView!)
            make.height.equalTo(14.0 * kHeightRatio)
            make.right.equalTo(self).offset(-22.0 * kWidthRatio)
        }
        siteLabel?.backgroundColor = UIColor.white
        siteLabel?.text = String.init("请输入目的地")
        siteLabel?.textColor = UIColor.globalPlaceholderColor()
        siteLabel?.font = UIFont.globalMainTextFont()
        
        splitView = UIView.init()
        addSubview(splitView!)
        splitView?.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(22.0 * kWidthRatio)
            make.right.equalTo(self).offset(-22.0 * kWidthRatio)
            make.top.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        }
        splitView?.backgroundColor = UIColor(r: 219.0, g: 219.0, b: 219.0)
    }

}
