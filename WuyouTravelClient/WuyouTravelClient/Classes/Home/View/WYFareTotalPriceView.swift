//
//  WYFareTotalPriceView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYFareTotalPriceView: UIView {

    var figureLabel: UILabel?
    var unitLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initFareTotalPriceView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initFareTotalPriceView() {
        backgroundColor = UIColor.white
        
        figureLabel = UILabel.init()
        addSubview(figureLabel!)
        figureLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self)
            make.centerY.equalTo(self)
            make.height.equalTo(18.0 * kHeightRatio)
        })
        figureLabel?.backgroundColor = UIColor.white
        figureLabel?.text = String.init("XX")
        figureLabel?.textColor = UIColor.globalHeadlineColor()
        figureLabel?.textAlignment = .center
        figureLabel?.font = UIFont.regularSystemFontOfSize(size: 23.0 * kHeightRatio)
        
        unitLabel = UILabel.init()
        addSubview(unitLabel!)
        unitLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(figureLabel!.snp.right).offset(6.0 * kWidthRatio)
            make.right.equalTo(self)
            make.centerY.equalTo(figureLabel!).offset(1.0 * kHeightRatio)
            make.height.equalTo(12.0 * kHeightRatio)
        })
        unitLabel?.backgroundColor = UIColor.white
        unitLabel?.text = String.init("元")
        unitLabel?.textColor = UIColor.globalHeadlineColor()
        unitLabel?.textAlignment = .center
        unitLabel?.font = UIFont.globalMainTextFont()
    }
}
