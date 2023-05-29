//
//  WYMineFooterView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import SnapKit

class WYMineFooterView: UIView {

    var versionCodeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMineFooterView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WYMineFooterView {
    fileprivate func initMineFooterView() {
        versionCodeLabel = UILabel.init()
        addSubview(versionCodeLabel)
        versionCodeLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        versionCodeLabel.backgroundColor = UIColor.white
        versionCodeLabel.text = String.init("无忧出行V")?.appending(versionCode)
        versionCodeLabel.textColor = UIColor.globalBtnTitleDisabledColor()
        versionCodeLabel.font = UIFont.globalSupTextFont()
    }
}
