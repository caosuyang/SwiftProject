//
//  WYCarTypeButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/21.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYCarTypeButton: UIButton {

    var imgView: UIImageView?
    var textLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCarTypeBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCarTypeBtn() {
        backgroundColor = UIColor.white
        imgView = UIImageView.init()
        addSubview(imgView!)
        imgView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(8.0 * kWidthRatio)
            make.top.equalTo(self).offset(26.0 * kHeightRatio)
            make.width.equalTo(40.0 * kWidthRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        imgView?.backgroundColor = UIColor.white
        imgView?.image = UIImage.init(named: "car_official_img_sel_40x12_")
        
        textLabel = UILabel.init()
        addSubview(textLabel!)
        textLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(imgView!.snp.bottom).offset(16.0 * kHeightRatio)
            make.centerX.equalTo(imgView!)
            make.height.equalTo(12.0 * kHeightRatio)
        })
        textLabel?.backgroundColor = UIColor.white
        textLabel?.text = String.init("XXXX")
        textLabel?.font = UIFont.globalSupTextFont()
        textLabel?.textColor = UIColor.globalThemeDefaultColor()
    }
}
