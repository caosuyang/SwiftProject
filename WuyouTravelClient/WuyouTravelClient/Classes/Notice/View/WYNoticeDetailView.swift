//
//  WYNoticeDetailView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/23.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYNoticeDetailView: UIView {

    var titleLabel: UILabel?
    var publishTimeLabel: UILabel?
    var contentImgView: UIImageView?
    var contentLabel: UILabel?
    var bottomTipLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNoticeDetailView()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func initNoticeDetailView() {
        backgroundColor = UIColor.white
        
        titleLabel = UILabel.init()
        addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(25.0 * kWidthRatio)
            make.top.equalTo(self).offset(19.0 * kHeightRatio)
            make.right.equalTo(self).offset(-39.0 * kWidthRatio)
        })
        titleLabel?.backgroundColor = UIColor.white
        titleLabel?.text = String.init("XXXXXXXXXXXXXXXXXXXXXXXXX")
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 19.0 * kHeightRatio)
        titleLabel?.numberOfLines = 0
        
        publishTimeLabel = UILabel.init()
        addSubview(publishTimeLabel!)
        publishTimeLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(titleLabel!)
            make.top.equalTo(titleLabel!.snp.bottom).offset(14.0 * kHeightRatio)
            make.height.equalTo(11.0 * kHeightRatio)
            make.right.equalTo(titleLabel!)
        })
        publishTimeLabel?.backgroundColor = UIColor.white
        publishTimeLabel?.text = String.init("发布时间：XXXX-XX-XX")
        publishTimeLabel?.textColor = UIColor.init(r: 51, g: 51, b: 51)
        publishTimeLabel?.font = UIFont.globalFootMenuTextFont()
        
        contentImgView = UIImageView.init()
        addSubview(contentImgView!)
        contentImgView?.snp.makeConstraints({ (make) in
            make.left.equalTo(publishTimeLabel!)
            make.top.equalTo(publishTimeLabel!.snp.bottom).offset(18.0 * kHeightRatio)
            make.right.equalTo(self).offset(-39.0 * kWidthRatio)
            make.height.equalTo(110.0 * kHeightRatio)
        })
        contentImgView?.backgroundColor = UIColor.white
        contentImgView?.image = UIImage.init(named: "gift_img_311x110_")
        
        contentLabel = UILabel.init()
        addSubview(contentLabel!)
        contentLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentImgView!)
            make.top.equalTo(contentImgView!.snp.bottom).offset(21.0 * kHeightRatio)
            make.right.equalTo(contentImgView!)
        })
        contentLabel?.backgroundColor = UIColor.white
        contentLabel?.text = String.init("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        contentLabel?.textColor = UIColor.init(r: 51, g: 51, b: 51)
        contentLabel?.font = UIFont.globalMainTextFont()
        contentLabel?.numberOfLines = 0
        
        bottomTipLabel = UILabel.init()
        addSubview(bottomTipLabel!)
        bottomTipLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-23.0 * kHeightRatio)
            make.height.equalTo(10.0 * kHeightRatio)
        })
        bottomTipLabel?.backgroundColor = UIColor.white
        bottomTipLabel?.text = String.init("本活动最终解释权归无忧出行所有")
        bottomTipLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        bottomTipLabel?.textAlignment = .center
        bottomTipLabel?.font = UIFont.globalFootMenuTextFont()
    }
}
