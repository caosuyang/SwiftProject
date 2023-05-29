//
//  WYFareTypeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYFareTypeView: UIView {

    var titleLabel: UILabel?
    var figureLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initFareTypeLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFareTypeLabel() {
        backgroundColor = UIColor.white
        titleLabel = UILabel.init()
        addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(60.0 * kWidthRatio)
            make.centerY.equalTo(self)
        })
        titleLabel?.backgroundColor = UIColor.white
        titleLabel?.text = String.init("XXXXXXX")
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.globalMainTextFont()
        
        figureLabel = UILabel.init()
        addSubview(figureLabel!)
        figureLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-60.0 * kWidthRatio)
            make.centerY.equalTo(self)
        })
        figureLabel?.backgroundColor = UIColor.white
        figureLabel?.text = String.init("XXX元")
        figureLabel?.textColor = UIColor.globalHeadlineColor()
        figureLabel?.textAlignment = .center
        figureLabel?.font = UIFont.globalMainTextFont()
    }
}
