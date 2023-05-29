//
//  WYNoticeTimeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/29.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYNoticeTimeView: UIView {


    var dateLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNoticeTimeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initNoticeTimeView() {
        backgroundColor = UIColor.init(r: 219, g: 219, b: 219)
        layer.cornerRadius = kBorderWidth
        
        dateLabel = UILabel.init()
        addSubview(dateLabel!)
        dateLabel?.snp.makeConstraints({ (make) in
            make.center.equalTo(self)
            make.height.equalTo(9.0 * kHeightRatio)
            make.left.equalTo(self).offset(6.0 * kWidthRatio)
            make.right.equalTo(self).offset(-6.0 * kWidthRatio)
        })
        dateLabel?.backgroundColor = UIColor.init(r: 219, g: 219, b: 219)
        dateLabel?.text = String.init("XXXX-XX-XX XX:XX")
        dateLabel?.textColor = UIColor.globalBtnTitleDefaultColor()
        dateLabel?.font = UIFont.globalFootMenuTextFont()
        dateLabel?.textAlignment = .center
        
        
        
    }

}
