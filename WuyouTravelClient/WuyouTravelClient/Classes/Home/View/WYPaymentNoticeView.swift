//
//  WYPaymentNoticeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/3.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPaymentNoticeView: UIView {

    var noticeImgView: UIImageView?
    var noticeTipLabel: UILabel?
    var knowBtn: WYCancelOrderButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initPaymentNoticeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPaymentNoticeView() {
        backgroundColor = UIColor.white
        
        noticeImgView = UIImageView.init()
        addSubview(noticeImgView!)
        noticeImgView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(106.0 * kHeightRatio)
            make.width.equalTo(80.0 * kWidthRatio)
            make.height.equalTo(71.0 * kHeightRatio)
        })
        noticeImgView?.backgroundColor = UIColor.white
        noticeImgView?.image = UIImage.init(named: "payment_finished_img_80x71_")
        
        noticeTipLabel = UILabel.init()
        addSubview(noticeTipLabel!)
        noticeTipLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(noticeImgView!)
            make.top.equalTo(noticeImgView!.snp.bottom).offset(17.0 * kHeightRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        noticeTipLabel?.backgroundColor = UIColor.white
        noticeTipLabel?.text = String.init("已完成支付")
        noticeTipLabel?.textAlignment = .center
        noticeTipLabel?.textColor = UIColor.globalHeadlineColor()
        noticeTipLabel?.font = UIFont.globalMainTextFont()
        
        knowBtn = WYCancelOrderButton.init()
        addSubview(knowBtn!)
        knowBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(27.0 * kWidthRatio)
            make.bottom.equalTo(self).offset(-31.0 * kHeightRatio)
            make.right.equalTo(self).offset(-27.0 * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        knowBtn?.layer.borderColor = UIColor.globalThemeDefaultColor().cgColor
        knowBtn?.setTitleColor(UIColor.globalThemeDefaultColor(), for: .normal)
        knowBtn?.setTitle(String.init("我知道了"), for: .normal)
    }


}
