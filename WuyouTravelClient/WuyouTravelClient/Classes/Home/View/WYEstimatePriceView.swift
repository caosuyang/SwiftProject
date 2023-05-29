//
//  WYEstimatePriceView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/21.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYEstimatePriceView: UIView {

    var priceFigureLabel: UILabel?
    var estimateTiplabel: UILabel?
    var unitTipLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initServicePrice()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initServicePrice() {
        backgroundColor = UIColor.white
        
        priceFigureLabel = UILabel.init()
        addSubview(priceFigureLabel!)
        priceFigureLabel?.snp.makeConstraints({ (make) in
            make.center.equalTo(self)
            make.height.equalTo(18.0 * kHeightRatio)
        })
        priceFigureLabel?.backgroundColor = .white
        priceFigureLabel?.text = String.init("0.0")
        priceFigureLabel?.font = UIFont.regularSystemFontOfSize(size: 23.0 * kHeightRatio)
        priceFigureLabel?.textColor = UIColor.globalHeadlineColor()
        
        
        estimateTiplabel = UILabel.init()
        addSubview(estimateTiplabel!)
        estimateTiplabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(priceFigureLabel!.snp.left).offset(-5.0 * kWidthRatio)
            make.centerY.equalTo(priceFigureLabel!).offset(1.5 * kHeightRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        estimateTiplabel?.backgroundColor = .white
        estimateTiplabel?.text = String.init("约")
        estimateTiplabel?.font = UIFont.globalMainTextFont()
        estimateTiplabel?.textColor = UIColor.globalHeadlineColor()
        
        unitTipLabel = UILabel.init()
        addSubview(unitTipLabel!)
        unitTipLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(priceFigureLabel!.snp.right).offset(6.0 * kWidthRatio)
            make.centerY.equalTo(priceFigureLabel!).offset(1.5 * kHeightRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        unitTipLabel?.backgroundColor = .white
        unitTipLabel?.text = String.init("元")
        unitTipLabel?.font = UIFont.globalMainTextFont()
        unitTipLabel?.textColor = UIColor.globalHeadlineColor()

    }
}
