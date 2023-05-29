//
//  WYVoucherTopView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYVoucherTopView: UIView {
    var availableBtn: UIButton?
    var usedBtn: UIButton?
    var expiredBtn: UIButton?
    var bottomLineView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initVoucherTopView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initVoucherTopView() {
        backgroundColor = UIColor.globalBackgroundColor()
        
        // btns
        let channelBtnWidth = screenWidth / 3
        availableBtn = UIButton.init()
        addSubview(availableBtn!)
        availableBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self)
            make.top.bottom.equalTo(self)
            make.width.equalTo(channelBtnWidth)
        })
        availableBtn?.backgroundColor = UIColor.white
        availableBtn?.tag = 0
        availableBtn?.setTitle(String.init("可使用"), for: UIControlState())
        availableBtn?.titleLabel?.textAlignment = .center
        availableBtn?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        availableBtn?.titleLabel?.font = UIFont.globalTitleRegularFont()
        
        usedBtn = UIButton.init()
        addSubview(usedBtn!)
        usedBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(availableBtn!.snp.right)
            make.top.bottom.equalTo(self)
            make.width.equalTo(availableBtn!)
        })
        usedBtn?.backgroundColor = UIColor.white
        usedBtn?.tag = 1
        usedBtn?.setTitle(String.init("已使用"), for: UIControlState())
        usedBtn?.titleLabel?.textAlignment = .center
        usedBtn?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        usedBtn?.titleLabel?.font = UIFont.globalTitleRegularFont()
        
        expiredBtn = UIButton.init()
        addSubview(expiredBtn!)
        expiredBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(usedBtn!.snp.right)
            make.top.bottom.equalTo(self)
            make.width.equalTo(usedBtn!)
        })
        expiredBtn?.backgroundColor = UIColor.white
        expiredBtn?.tag = 2
        expiredBtn?.setTitle(String.init("已过期"), for: UIControlState())
        expiredBtn?.titleLabel?.textAlignment = .center
        expiredBtn?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        expiredBtn?.titleLabel?.font = UIFont.globalTitleRegularFont()
        
        bottomLineView = UIView.init()
        addSubview(bottomLineView!)
        bottomLineView?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self)
            make.height.equalTo(kSplitLineHeight * 4)
            make.width.equalTo(48.0 * kWidthRatio)
            make.left.equalTo(self).offset(39.0 * kWidthRatio)
        })
        bottomLineView?.backgroundColor = UIColor.globalThemeDefaultColor()
        
    }
    
}
