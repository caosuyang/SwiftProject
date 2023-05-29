//
//  WYMyAccountTopView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyAccountTopView: UIView {


    var iconView: UIImageView?
    var tipLabel: UILabel?
    var figureLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMyAccountTopView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initMyAccountTopView() {
        backgroundColor = UIColor.white
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(50.0 * kHeightRatio)
            make.centerX.equalTo(self)
            make.width.equalTo(75.0 * kWidthRatio)
            make.height.equalTo(78.0 * kHeightRatio)
        })
        iconView?.backgroundColor = UIColor.white
        iconView?.image = UIImage.init(named: "mine_account_img_75x78_")
        
        tipLabel = UILabel.init()
        addSubview(tipLabel!)
        tipLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(iconView!)
            make.top.equalTo(iconView!.snp.bottom).offset(33.0 * kHeightRatio)
            make.height.equalTo(16.0 * kHeightRatio)
        })
        tipLabel?.backgroundColor = UIColor.white
        tipLabel?.text = String.init("金额 (元)")
        tipLabel?.textAlignment = .center
        tipLabel?.textColor = UIColor.globalHeadlineColor()
        tipLabel?.font = UIFont.globalTitleRegularFont()
        
        figureLabel = UILabel.init()
        addSubview(figureLabel!)
        figureLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(iconView!)
            make.top.equalTo(tipLabel!.snp.bottom).offset(22.0 * kHeightRatio)
            make.height.equalTo(37.0 * kHeightRatio)
            make.bottom.equalTo(self).offset(-58.0 * kHeightRatio)
        })
        figureLabel?.backgroundColor = UIColor.white
        figureLabel?.text = String.init("0.00")
        figureLabel?.textAlignment = .center
        figureLabel?.textColor = UIColor.globalHeadlineColor()
        figureLabel?.font = UIFont.regularSystemFontOfSize(size: 50.0 * kHeightRatio)

    }
}
