//
//  WYMyAccountBtn.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyAccountBtn: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMyAccountBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initMyAccountBtn() {
        backgroundColor = UIColor.white
        setTitle(String.init("XX元"), for: UIControlState())
        setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        titleLabel?.font = UIFont.globalMainTextFont()
        layer.borderWidth = kBorderWidth / 2
        layer.backgroundColor = UIColor.globalBorderNormalColor().cgColor
    }
}
