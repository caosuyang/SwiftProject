//
//  WYPayRowView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPayRowView: UIView {

    var iconView: UIImageView?
    var titleLabel: UILabel?
    var chooseBtn: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initPayRowView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPayRowView() {
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(71.0 * kWidthRatio)
            make.width.equalTo(12.0 * kWidthRatio)
            make.height.equalTo(13.0 * kHeightRatio)
            make.centerY.equalTo(self)
        })
        iconView?.backgroundColor = UIColor.white
        iconView?.image = UIImage.init(named: "info_service_price_icon_12x13_")
        
        titleLabel = UILabel.init()
        addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(iconView!.snp.right).offset(9.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(14.0 * kHeightRatio)
        })
        titleLabel?.backgroundColor = UIColor.white
        titleLabel?.text = String.init("XXXX")
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.globalMainTextFont()
        
        chooseBtn = UIButton.init()
        addSubview(chooseBtn!)
        chooseBtn?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-73.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.height.equalTo(13.0 * kHeightRatio)
        })
        chooseBtn?.backgroundColor = UIColor.white
        chooseBtn?.setImage(UIImage.init(named: "payment_choose_btn_nor_13x13_"), for: .normal)
        chooseBtn?.setImage(UIImage.init(named: "payment_choose_btn_sel_13x13_"), for: .selected)
    }
}
