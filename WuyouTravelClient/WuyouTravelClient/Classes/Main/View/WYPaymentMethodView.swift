//
//  WYPaymentMethodView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/4.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPaymentMethodView: UIView {
    
    var bottomContentView: UIView?
    var methodTipView: UIView?
    var methodTipLabel: UILabel?
    var wxPayButton: WYPaymentTypeButton?
    var aliPayButton: WYPaymentTypeButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initPaymentMethodView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPaymentMethodView() {
        backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
        isUserInteractionEnabled = true
        isHidden = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickChooseTimeBgView(tap:)))
        addGestureRecognizer(tapGesture)
        
        bottomContentView = UIView.init()
        addSubview(bottomContentView!)
        bottomContentView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self).offset(210.0 * kHeightRatio)
            make.height.equalTo(210.0 * kHeightRatio)
        })
        bottomContentView?.backgroundColor = UIColor.white
        
        
        methodTipView = UIView.init()
        bottomContentView?.addSubview(methodTipView!)
        methodTipView?.snp.makeConstraints({ (make) in
            make.left.right.top.equalTo(bottomContentView!)
            make.height.equalTo(50.0 * kHeightRatio)
        })
        methodTipView?.backgroundColor = UIColor.white
        
        methodTipLabel = UILabel.init()
        methodTipView?.addSubview(methodTipLabel!)
        methodTipLabel?.snp.makeConstraints({ (make) in
            make.center.equalTo(methodTipView!)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        methodTipLabel?.backgroundColor = UIColor.white
        methodTipLabel?.text = String.init("请选择支付方式")
        methodTipLabel?.textAlignment = .center
        methodTipLabel?.textColor = UIColor.globalMainBodyColor()
        methodTipLabel?.font = UIFont.globalMainTextFont()
        
        wxPayButton = WYPaymentTypeButton.init()
        bottomContentView?.addSubview(wxPayButton!)
        wxPayButton?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(bottomContentView!)
            make.top.equalTo(methodTipView!.snp.bottom)
            make.height.equalTo(80.0 * kHeightRatio)
        })
        wxPayButton?.iconView?.image = UIImage.init(named: "mine_account_wxpay_icon_24x21_")
        wxPayButton?.textLabel?.text = String.init("微信支付")
        
        aliPayButton = WYPaymentTypeButton.init()
        bottomContentView?.addSubview(aliPayButton!)
        aliPayButton?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(bottomContentView!)
            make.top.equalTo(wxPayButton!.snp.bottom)
            make.height.equalTo(80.0 * kHeightRatio)
        })
        aliPayButton?.iconView?.image = UIImage.init(named: "mine_account_alipay_icon_22x22_")
        aliPayButton?.textLabel?.text = String.init("支付宝支付")
        aliPayButton?.iconView?.snp.updateConstraints({ (make) in
            make.width.equalTo(22.0 * kWidthRatio)
            make.height.equalTo(22.0 * kHeightRatio)
        })
        aliPayButton?.textLabel?.snp.updateConstraints({ (make) in
            make.left.equalTo(aliPayButton!.iconView!.snp.right).offset(14.0 * kWidthRatio)
        })
    }
    
    @objc private func clickChooseTimeBgView(tap: UITapGestureRecognizer) {
        print("clickChooseTimeBgView")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self).offset(210.0 * kHeightRatio)
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }

}
