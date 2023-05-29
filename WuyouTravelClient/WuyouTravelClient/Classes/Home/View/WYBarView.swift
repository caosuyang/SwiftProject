//
//  WYBarView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYBarView: UIView {

    var barBgImgView: UIImageView?
    var nowButton: WYNowButton?
    var bookButton: WYBookButton?
    var transferButton: WYTransferButton?
    var charterButton: WYCharterButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initBarBgImgView()
        initModBtns()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initBarBgImgView() {
        backgroundColor = .clear
        barBgImgView = UIImageView.init()
        addSubview(barBgImgView!)
        barBgImgView?.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        barBgImgView?.backgroundColor = .clear
        barBgImgView?.image = UIImage.init(named: "home_trapeze_toolbar_351x33_")
        barBgImgView?.isUserInteractionEnabled = true
    }
    
    private func initModBtns() {
        // 现在
        nowButton = WYNowButton.init()
        barBgImgView?.addSubview(nowButton!)
        nowButton?.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(barBgImgView!)
            make.width.equalTo(97.0 * kWidthRatio)
        }
        nowButton?.isUserInteractionEnabled = false
        
        
        // 预约
        bookButton = WYBookButton.init()
        barBgImgView?.addSubview(bookButton!)
        bookButton?.snp.makeConstraints { (make) in
            make.left.equalTo(barBgImgView!).offset(79.0 * kWidthRatio)
            make.top.bottom.equalTo(barBgImgView!)
            make.width.equalTo(103.0 * kWidthRatio)
        }
        bookButton?.isUserInteractionEnabled = true
        
        
        // 接送机
        transferButton = WYTransferButton.init()
        barBgImgView?.addSubview(transferButton!)
        transferButton?.snp.makeConstraints { (make) in
            make.left.equalTo(barBgImgView!).offset(167.0 * kWidthRatio)
            make.top.bottom.equalTo(barBgImgView!)
            make.width.equalTo(91.0 * kWidthRatio)
        }
        
        
        // 包车
        charterButton = WYCharterButton.init()
        barBgImgView?.addSubview(charterButton!)
        charterButton?.snp.makeConstraints { (make) in
            make.left.equalTo(transferButton!.snp.right)
            make.top.bottom.equalTo(barBgImgView!)
            make.width.equalTo(93.0 * kWidthRatio)
        }
        

    }
}
