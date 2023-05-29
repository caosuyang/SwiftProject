//
//  WYMyOrderDetailView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyOrderDetailView: UIView {

    var travelInfoView: WYTravelInfoView?
    var fareDetailView: WYFareDetailView?
    var payStyleView: WYFareTypeView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMyOrderDetailView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initMyOrderDetailView() {
        backgroundColor = UIColor.white
        
        travelInfoView = WYTravelInfoView.init()
        addSubview(travelInfoView!)
        travelInfoView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
            make.top.equalTo(self).offset(26.0 * kHeightRatio)
            make.height.equalTo(198.0 * kHeightRatio)
        })
        
        fareDetailView = WYFareDetailView.init()
        addSubview(fareDetailView!)
        fareDetailView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
            make.top.equalTo(travelInfoView!.snp.bottom).offset(20.0 * kHeightRatio)
            make.height.equalTo(180.0 * kHeightRatio)
        })
        fareDetailView?.starFareTypeView?.titleLabel?.textColor = UIColor.globalMainBodyColor()
        fareDetailView?.starFareTypeView?.figureLabel?.textColor = UIColor.globalMainBodyColor()
        fareDetailView?.mileageFareTypeView?.titleLabel?.textColor = UIColor.globalMainBodyColor()
        fareDetailView?.mileageFareTypeView?.figureLabel?.textColor = UIColor.globalMainBodyColor()
        
        payStyleView = WYFareTypeView.init()
        addSubview(payStyleView!)
        payStyleView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(fareDetailView!)
            make.top.equalTo(fareDetailView!.snp.bottom)
            make.height.equalTo(20.0 * kHeightRatio)
        })
        payStyleView?.backgroundColor = UIColor.white
        payStyleView?.titleLabel?.text = String.init("支付方式")
        payStyleView?.titleLabel?.textColor = UIColor.globalMainBodyColor()
        payStyleView?.figureLabel?.text = String.init("XXXX")
        payStyleView?.figureLabel?.textColor = UIColor.globalMainBodyColor()
    }

}
