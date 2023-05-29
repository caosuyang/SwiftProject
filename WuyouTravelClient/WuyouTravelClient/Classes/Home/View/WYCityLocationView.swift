//
//  WYCityLocationView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/22.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYCityLocationView: UIView {

    var cityLocatedLabel: UILabel?
    var dropdownImgView: UIImageView?
    var lableWidth: CGFloat?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCityLocationView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCityLocationView() {
        backgroundColor = .white
        isUserInteractionEnabled = true
        cityLocatedLabel = UILabel.init()
        cityLocatedLabel?.backgroundColor = UIColor.white
        cityLocatedLabel?.text = String.init("选城市")
        cityLocatedLabel?.textColor = UIColor.black
        cityLocatedLabel?.font = UIFont.globalTitleBoldFont()
        cityLocatedLabel?.textAlignment = .left
        lableWidth = cityLocatedLabel!.text!.getTextWidth(height: 16.0 * kHeightRatio)
        addSubview(cityLocatedLabel!)
        cityLocatedLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(16.0 * kHeightRatio)
            make.width.equalTo(lableWidth!)
        })
        
        dropdownImgView = UIImageView.init()
        addSubview(dropdownImgView!)
        dropdownImgView?.snp.makeConstraints({ (make) in
            make.left.equalTo(cityLocatedLabel!.snp.right).offset(10.0 * kWidthRatio)
            make.centerY.equalTo(cityLocatedLabel!)
            make.width.equalTo(9.0 * kWidthRatio)
            make.height.equalTo(4.0 * kHeightRatio)
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
        })
        dropdownImgView?.backgroundColor = UIColor.white
        dropdownImgView?.image = UIImage.init(named: "site_city_dropdown_9x4_")
    }

    
}
