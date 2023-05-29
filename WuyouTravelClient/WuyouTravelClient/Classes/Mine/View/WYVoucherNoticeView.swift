//
//  WYVoucherNoticeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/4.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYVoucherNoticeView: UIView {


    var noticeImgView: UIImageView?
    var noticeTipLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initVouvherNoticeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initVouvherNoticeView() {
        backgroundColor = UIColor.globalBackgroundColor()
        
        noticeImgView = UIImageView.init()
        addSubview(noticeImgView!)
        noticeImgView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(108.0 * kHeightRatio)
            make.width.equalTo(80.0 * kWidthRatio)
            make.height.equalTo(75.0 * kHeightRatio)
        })
        noticeImgView?.backgroundColor = UIColor.globalBackgroundColor()
        noticeImgView?.image = UIImage.init(named: "voucher_no_coupons_img_80x75_")
        
        noticeTipLabel = UILabel.init()
        addSubview(noticeTipLabel!)
        noticeTipLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(noticeImgView!)
            make.top.equalTo(noticeImgView!.snp.bottom).offset(17.0 * kHeightRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        noticeTipLabel?.backgroundColor = UIColor.globalBackgroundColor()
        noticeTipLabel?.text = String.init("暂无可用的代金券")
        noticeTipLabel?.textAlignment = .center
        noticeTipLabel?.textColor = UIColor.globalHeadlineColor()
        noticeTipLabel?.font = UIFont.globalMainTextFont()
    }
}
