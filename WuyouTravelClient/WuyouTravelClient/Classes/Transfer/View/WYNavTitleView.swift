//
//  WYNavTitleView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYNavTitleView: UIView {

    var pickUpBtn: UIButton?
    var sendBtn: UIButton?
    var bottomLineView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNavTitleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initNavTitleView() {
        backgroundColor = UIColor.globalThemeDefaultColor()
        
        pickUpBtn = UIButton.init()
        addSubview(pickUpBtn!)
        pickUpBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(17.0 * kHeightRatio)
        })
        pickUpBtn?.backgroundColor = UIColor.globalThemeDefaultColor()
        pickUpBtn?.setTitle(String.init("接机"), for: UIControlState())
        pickUpBtn?.setTitleColor(UIColor.globalBtnTitleDefaultColor(), for: UIControlState())
        pickUpBtn?.titleLabel?.font = UIFont.globalTitleRegularFont()
        pickUpBtn?.titleLabel?.textAlignment = .center
        
        sendBtn = UIButton.init()
        addSubview(sendBtn!)
        sendBtn?.snp.makeConstraints({ (make) in
            make.right.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(17.0 * kHeightRatio)
            make.left.equalTo(pickUpBtn!.snp.right).offset(16.0 * kWidthRatio)
        })
        sendBtn?.backgroundColor = UIColor.globalThemeDefaultColor()
        sendBtn?.setTitle(String.init("送机"), for: UIControlState())
        sendBtn?.setTitleColor(UIColor.init(r: 146, g: 182, b: 240), for: UIControlState())
        sendBtn?.titleLabel?.font = UIFont.globalTitleRegularFont()
        sendBtn?.titleLabel?.textAlignment = .center

        bottomLineView = UIView.init()
        addSubview(bottomLineView!)
        bottomLineView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(kSplitLineHeight * 2)
            make.width.equalTo(pickUpBtn!)
        })
        bottomLineView?.backgroundColor = UIColor.white
    }
    
}
