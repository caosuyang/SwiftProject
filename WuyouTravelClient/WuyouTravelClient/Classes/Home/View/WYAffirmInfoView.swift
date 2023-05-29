//
//  WYAffirmInfoView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYAffirmInfoView: UIView {

    var carTypeScrollView: WYCarTypeScrollView?
    var servicePriceView: WYServicePriceView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initAffirmInfoView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initAffirmInfoView() {
        backgroundColor = UIColor.globalBackgroundColor()
        carTypeScrollView = WYCarTypeScrollView.init()
        addSubview(carTypeScrollView!)
        carTypeScrollView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(73.0 * kHeightRatio)
        })
        
        servicePriceView = WYServicePriceView.init()
        addSubview(servicePriceView!)
        servicePriceView?.snp.makeConstraints({ (make) in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(carTypeScrollView!.snp.bottom)
        })
    }

}
