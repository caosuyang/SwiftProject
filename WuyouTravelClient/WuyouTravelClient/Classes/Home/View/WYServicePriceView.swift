//
//  WYServicePriceView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/21.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYServicePriceView: UIView {

    var serveCostView: WYServeCostView?
    var estimatePriceView: WYEstimatePriceView?
    var splitLineView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initServicePrice()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initServicePrice() {
        backgroundColor = UIColor.white
        
        serveCostView = WYServeCostView.init()
        addSubview(serveCostView!)
        serveCostView?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.5)
        })
        
        estimatePriceView = WYEstimatePriceView.init()
        addSubview(estimatePriceView!)
        estimatePriceView?.snp.makeConstraints({ (make) in
            make.right.top.bottom.equalTo(self)
            make.left.equalTo(serveCostView!.snp.right)
            make.width.equalTo(self).multipliedBy(0.5)
        })
        
        splitLineView = UIView.init()
        serveCostView?.addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.right.equalTo(serveCostView!)
            make.top.equalTo(serveCostView!).offset(21.0 * kHeightRatio)
            make.bottom.equalTo(serveCostView!).offset(-15.0 * kHeightRatio)
            make.width.equalTo(kSplitLineHeight)
        })
        splitLineView?.backgroundColor = UIColor(r: 239, g: 239, b: 239)
    }
    
}
