//
//  WYModView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYModView: UIView {
    
    var barView: WYBarView?
    var contentView: WYContentView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initShadow()
        initControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initShadow() {
        backgroundColor = UIColor.clear
        layer.shadowColor = UIColor.globalShadowColor().cgColor
        layer.shadowOpacity = kShadowOpacity
        layer.shadowRadius = kShadowRadius
        layer.shadowOffset = kShadowOffset
    }

    private func initControls() {
        contentView = WYContentView.init()
        addSubview(contentView!)
        contentView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(100.0 * kHeightRatio)
        })
        
        barView = WYBarView.init()
        addSubview(barView!)
        barView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.bottom.equalTo(contentView!.snp.top)
            make.height.equalTo(33.0 * kHeightRatio)
        })
    }
}
