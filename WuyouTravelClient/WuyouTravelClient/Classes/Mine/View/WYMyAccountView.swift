//
//  WYMyAccountView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material

class WYMyAccountView: UIView {

    var contentView: UIView?
    var accountTopView: WYMyAccountTopView?
    var accountBtnsView: WYMyAccountBtnsView?
    var insuranceBtn: Button?
    var rechargeBtn: WYCallCarButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMyAccountView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initMyAccountView() {
        backgroundColor = UIColor.white
        
        contentView = UIView.init()
        addSubview(contentView!)
        contentView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(431.0 * kHeightRatio)
        })
        contentView?.backgroundColor = UIColor.white
        
        accountTopView = WYMyAccountTopView.init()
        contentView?.addSubview(accountTopView!)
        accountTopView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(contentView!)
            make.height.equalTo(296.0 * kHeightRatio)
        })
        
        accountBtnsView = WYMyAccountBtnsView.init()
        contentView?.addSubview(accountBtnsView!)
        accountBtnsView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(accountTopView!.snp.bottom)
            make.height.equalTo(134.0 * kHeightRatio)
        })
        
        rechargeBtn = WYCallCarButton.init()
        addSubview(rechargeBtn!)
        rechargeBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(26.0 * kWidthRatio)
            make.bottom.equalTo(self).offset(-24.0 * kHeightRatio)
            make.right.equalTo(self).offset(-26.0 * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        rechargeBtn?.setTitle(String.init("立即充值"), for: UIControlState())
        
        insuranceBtn = Button.init()
        addSubview(insuranceBtn!)
        insuranceBtn?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(rechargeBtn!)
            make.bottom.equalTo(rechargeBtn!.snp.top).offset(-kVerticalSpacing * kHeightRatio)
            make.height.equalTo(14.0 * kHeightRatio)
        })
        insuranceBtn?.backgroundColor = UIColor.white
        insuranceBtn?.image = UIImage.init(named: "mine_account_guarantee_icon_11x12_")
        insuranceBtn?.title = String.init("无忧出行账户安全保障，请放心使用")
        insuranceBtn?.titleColor = UIColor.globalBtnTitleDisabledColor()
        insuranceBtn?.titleLabel?.font = UIFont.globalFootMenuTextFont()
        insuranceBtn?.titleLabel?.textAlignment = .right
        insuranceBtn?.imageEdgeInsets = UIEdgeInsetsMake(0.0, -2.0 * kWidthRatio, 0.0, 2.0 * kWidthRatio)
        insuranceBtn?.titleEdgeInsets = UIEdgeInsetsMake(0.0, 2.0 * kWidthRatio, 0.0, -2.0 * kWidthRatio)
        insuranceBtn?.pulseAnimation = .none
    }
    
    
}
