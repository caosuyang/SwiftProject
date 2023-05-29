//
//  WYPaymetView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPaymetView: UIView {

    var fareDetailView: WYFareDetailView?
    var payStyleView: WYPayStyleView?
    var definePayBtn: WYCallCarButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initPaymentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPaymentView() {
        backgroundColor = UIColor.white
        fareDetailView = WYFareDetailView.init()
        addSubview(fareDetailView!)
        fareDetailView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
            make.top.equalTo(self).offset(20.0 * kHeightRatio)
            make.height.equalTo(180.0 * kHeightRatio)
        })
        
        
        payStyleView = WYPayStyleView.init()
        addSubview(payStyleView!)
        payStyleView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(fareDetailView!.snp.bottom).offset(23.0 * kHeightRatio)
            make.height.equalTo(145.0 * kHeightRatio)
        })
        
        definePayBtn = WYCallCarButton.init()
        addSubview(definePayBtn!)
        definePayBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(28.0 * kWidthRatio)
            make.bottom.equalTo(self).offset(-27.0 * kHeightRatio)
            make.right.equalTo(self).offset(-28.0 * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        definePayBtn?.setTitle(String.init("确认支付"), for: UIControlState())
    }
}
