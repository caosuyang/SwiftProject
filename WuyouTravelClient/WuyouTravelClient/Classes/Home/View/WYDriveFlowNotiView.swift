//
//  WYDriveFlowNotiView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/23.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYDriveFlowNotiView: UIView {

    var titleLabel: UILabel?
    var telBtn: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initDriveFlowNotificationView()
        initShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initDriveFlowNotificationView() {
        backgroundColor = .white
        
        titleLabel = UILabel.init()
        addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(22.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        titleLabel?.backgroundColor = .white
        titleLabel?.text = String.init("XXXXXXXXXXXXXXXX")
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.font = UIFont.globalMainTextFont()
        
        telBtn = UIButton.init()
        addSubview(telBtn!)
        telBtn?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-18.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.height.equalTo(22.0 * kHeightRatio)
        })
        telBtn?.isHidden = true
        telBtn?.backgroundColor = UIColor.white
        telBtn?.setImage(UIImage.init(named: "order_recevied_tel_btn_22x22_"), for: .normal)
        
    }
    
    private func initShadow() {
        layer.cornerRadius = kCornerRadius
        layer.shadowColor = UIColor.globalShadowColor().cgColor
        layer.shadowOpacity = kShadowOpacity
        layer.shadowRadius = kShadowRadius
        layer.shadowOffset = kShadowOffset
    }
}
