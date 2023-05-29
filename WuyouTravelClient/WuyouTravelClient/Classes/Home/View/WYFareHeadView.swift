//
//  WYFareHeadView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYFareHeadView: UIView {

    var splitLineView_left: UIView?
    var splitLineView_right: UIView?
    var headTitleLabel: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFareHeadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFareHeadView() {
        backgroundColor = UIColor.white
        headTitleLabel = UILabel.init()
        addSubview(headTitleLabel!)
        headTitleLabel?.snp.makeConstraints({ (make) in
            make.center.equalTo(self)
            make.height.equalTo(11.0 * kHeightRatio)
        })
        headTitleLabel?.backgroundColor = UIColor.white
        headTitleLabel?.text = String.init("车费详情")
        headTitleLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        headTitleLabel?.textAlignment = .center
        headTitleLabel?.font = UIFont.globalFootMenuTextFont()
        
        splitLineView_left = UIView.init()
        addSubview(splitLineView_left!)
        splitLineView_left?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(75.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(kHeightRatio)
            make.right.equalTo(headTitleLabel!.snp.left).offset(-8.0 * kWidthRatio)
        })
        splitLineView_left?.backgroundColor = UIColor(r: 237, g: 237, b: 237)
        
        splitLineView_right = UIView.init()
        addSubview(splitLineView_right!)
        splitLineView_right?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-75.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(kHeightRatio)
            make.left.equalTo(headTitleLabel!.snp.right).offset(8.0 * kWidthRatio)
        })
        splitLineView_right?.backgroundColor = UIColor(r: 237, g: 237, b: 237)
        
        
    }

}
