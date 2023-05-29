//
//  WYRechargeNoticeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/3.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYRechargeNoticeView: UIView {
    
    var noticeImgView: UIImageView?
    var noticeTipLabel: UILabel?
    var returnBackBtn: WYCancelOrderButton?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initAboutUsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initAboutUsView() {
        backgroundColor = UIColor.white
        
        noticeImgView = UIImageView.init()
        addSubview(noticeImgView!)
        noticeImgView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(106.0 * kHeightRatio)
            make.width.equalTo(80.0 * kWidthRatio)
            make.height.equalTo(75.0 * kHeightRatio)
        })
        noticeImgView?.backgroundColor = UIColor.white
        noticeImgView?.image = UIImage.init(named: "rechagre_success_img_80x75_")
        
        noticeTipLabel = UILabel.init()
        addSubview(noticeTipLabel!)
        noticeTipLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(noticeImgView!)
            make.top.equalTo(noticeImgView!.snp.bottom).offset(15.0 * kHeightRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        noticeTipLabel?.backgroundColor = UIColor.white
        noticeTipLabel?.text = String.init("充值成功")
        noticeTipLabel?.textAlignment = .center
        noticeTipLabel?.textColor = UIColor.globalHeadlineColor()
        noticeTipLabel?.font = UIFont.globalMainTextFont()

        returnBackBtn = WYCancelOrderButton.init()
        addSubview(returnBackBtn!)
        returnBackBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(27.0 * kWidthRatio)
            make.bottom.equalTo(self).offset(-31.0 * kHeightRatio)
            make.right.equalTo(self).offset(-27.0 * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        returnBackBtn?.layer.borderColor = UIColor.globalThemeDefaultColor().cgColor
        returnBackBtn?.setTitleColor(UIColor.globalThemeDefaultColor(), for: .normal)
        returnBackBtn?.setTitle(String.init("返回我的账户"), for: .normal)
    }
}
