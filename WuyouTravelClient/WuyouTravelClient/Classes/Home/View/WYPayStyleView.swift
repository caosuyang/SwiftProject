//
//  WYPayStyleView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPayStyleView: UIView {


    var payHeadView: WYFareHeadView?
    var balancePayView: WYPayRowView?
    var wxPayView: WYPayRowView?
    var aliPayView: WYPayRowView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initPayStyleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPayStyleView() {
        backgroundColor = .white
        
        payHeadView = WYFareHeadView.init()
        addSubview(payHeadView!)
        payHeadView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(41.0 * kHeightRatio)
        })
        payHeadView?.headTitleLabel?.text = String.init("支付方式")
        payHeadView?.splitLineView_left?.snp.updateConstraints({ (make) in
            make.left.equalTo(payHeadView!).offset(88.0 * kWidthRatio)
        })
        payHeadView?.splitLineView_right?.snp.updateConstraints({ (make) in
            make.right.equalTo(payHeadView!).offset(-88.0 * kWidthRatio)
        })
        
        balancePayView = WYPayRowView.init()
        addSubview(balancePayView!)
        balancePayView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(payHeadView!.snp.bottom).offset(10.0 * kHeightRatio)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        balancePayView?.iconView?.image = UIImage.init(named: "info_service_price_icon_12x13_")
        balancePayView?.titleLabel?.text = String.init("账户余额")
        balancePayView?.chooseBtn?.isSelected = true
        
        
        wxPayView = WYPayRowView.init()
        addSubview(wxPayView!)
        wxPayView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(balancePayView!.snp.bottom)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        wxPayView?.iconView?.image = UIImage.init(named: "payment_wxpay_icon_13x12_")
        wxPayView?.titleLabel?.text = String.init("微信支付")
        wxPayView?.iconView?.snp.updateConstraints({ (make) in
            make.left.equalTo(wxPayView!).offset(70.0 * kWidthRatio)
            make.width.equalTo(13.0 * kWidthRatio)
            make.height.equalTo(12.0 * kHeightRatio)
        })
        wxPayView?.titleLabel?.snp.updateConstraints({ (make) in
            make.left.equalTo(wxPayView!.iconView!.snp.right).offset(8.0 * kWidthRatio)
        })

        
        aliPayView = WYPayRowView.init()
        addSubview(aliPayView!)
        aliPayView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(wxPayView!.snp.bottom)
            make.height.equalTo(28.0 * kHeightRatio)
            make.bottom.equalTo(self).offset(-10.0 * kHeightRatio)
        })
        aliPayView?.iconView?.image = UIImage.init(named: "payment_alipay_icon_12x12_")
        aliPayView?.titleLabel?.text = String.init("支付宝支付")
        aliPayView?.iconView?.snp.updateConstraints({ (make) in
            make.left.equalTo(aliPayView!).offset(70.5 * kWidthRatio)
            make.width.equalTo(12.0 * kWidthRatio)
        })
        aliPayView?.titleLabel?.snp.updateConstraints({ (make) in
            make.left.equalTo(aliPayView!.iconView!.snp.right).offset(8.5 * kWidthRatio)
        })
       


        
        
    }
    
}
