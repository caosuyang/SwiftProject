//
//  WYPaopaoView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPaopaoView: BMKActionPaopaoView {
    
    var paoImgView: UIImageView?
    var paoViewLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPaopaoView() {
        paoImgView = UIImageView.init()
        addSubview(paoImgView!)
        paoImgView?.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
            make.width.equalTo(137.0 * kWidthRatio)
            make.height.equalTo(38.0 * kHeightRatio)
        }
        paoImgView?.image = UIImage.init(named: "home_map_location_dialog_132x33_")
        paoImgView?.layer.shadowColor = UIColor.globalShadowColor().cgColor
        paoImgView?.layer.shadowOpacity = kShadowOpacity
        paoImgView?.layer.shadowRadius = 1.5
        paoImgView?.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        paoViewLabel = UILabel.init()
        paoImgView?.addSubview(paoViewLabel!)
        paoViewLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(paoImgView!)
            make.centerY.equalTo(paoImgView!).offset(-1.5 * kHeightRatio)
            make.height.equalTo(14.0 * kHeightRatio)
            make.width.equalTo(105.0 * kWidthRatio)
        })
        paoViewLabel?.text = String.init("当前位置叫车")
        paoViewLabel?.textAlignment = .center
        paoViewLabel?.textColor = UIColor.globalHeadlineColor()
        paoViewLabel?.font = UIFont.globalMainTextFont()

    }

}
