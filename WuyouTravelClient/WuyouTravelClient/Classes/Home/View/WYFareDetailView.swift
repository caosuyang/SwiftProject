//
//  WYFareDetailView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/23.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYFareDetailView: UIView {

    var fareHeadView: WYFareHeadView?
    var totalPriceBgView: UIView?
    var totalPriceView: WYFareTotalPriceView?
    var starFareTypeView: WYFareTypeView?
    var mileageFareTypeView: WYFareTypeView?
    var voucherFareTypeView: WYFareTypeView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initFareDetailView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func initShadow() {
        layer.cornerRadius = kCornerRadius
        layer.shadowColor = UIColor.globalShadowColor().cgColor
        layer.shadowOpacity = kShadowOpacity
        layer.shadowRadius = kShadowRadius
        layer.shadowOffset = kShadowOffset
    }

    private func initFareDetailView() {
        backgroundColor = .white
        
        fareHeadView = WYFareHeadView.init()
        addSubview(fareHeadView!)
        fareHeadView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(41.0 * kHeightRatio)
        })
        
        totalPriceBgView = UIView.init()
        addSubview(totalPriceBgView!)
        totalPriceBgView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(fareHeadView!.snp.bottom)
            make.height.equalTo(33.0 * kHeightRatio)
        })
        totalPriceBgView?.backgroundColor = UIColor.white
        
        totalPriceView = WYFareTotalPriceView.init()
        totalPriceBgView?.addSubview(totalPriceView!)
        totalPriceView?.snp.makeConstraints({ (make) in
            make.center.equalTo(totalPriceBgView!)
            make.height.equalTo(totalPriceBgView!)
        })
        totalPriceView?.figureLabel?.text = String.init("0.0")
        
        
        starFareTypeView = WYFareTypeView.init()
        addSubview(starFareTypeView!)
        starFareTypeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(totalPriceBgView!.snp.bottom).offset(15.0 * kHeightRatio)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        starFareTypeView?.titleLabel?.text = String.init("起步价")
        starFareTypeView?.figureLabel?.text = String.init("0.0元")
        
        mileageFareTypeView = WYFareTypeView.init()
        addSubview(mileageFareTypeView!)
        mileageFareTypeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(starFareTypeView!.snp.bottom)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        mileageFareTypeView?.titleLabel?.text = String.init("里程费(0.0公里)")
        mileageFareTypeView?.figureLabel?.text = String.init("0.0元")
        
        voucherFareTypeView = WYFareTypeView.init()
        addSubview(voucherFareTypeView!)
        voucherFareTypeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(mileageFareTypeView!.snp.bottom)
            make.height.equalTo(28.0 * kHeightRatio)
            make.bottom.equalTo(self).offset(-15.0 * kHeightRatio)
        })
        voucherFareTypeView?.titleLabel?.text = String.init("代金券抵用")
        voucherFareTypeView?.figureLabel?.text = String.init("0.0元")
        voucherFareTypeView?.titleLabel?.textColor = UIColor.globalThemeDefaultColor()
        voucherFareTypeView?.figureLabel?.textColor = UIColor.globalThemeDefaultColor()
    }
}
