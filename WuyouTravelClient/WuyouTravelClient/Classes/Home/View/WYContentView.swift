//
//  WYContentView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYContentView: UIView {

    var contentBgImgView: UIImageView?
    var endSiteView: WYSitesView?
    var starSiteView: WYSitesView?
    var makeAppointView: WYMakeAppointView?
    var carTypeScrollView: WYCarTypeScrollView?
    var servicePriceView: WYServicePriceView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentBgImgView()
        initSitesView()
        initMakeAppointView()
        initAffirmInfoView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initContentBgImgView() {
        backgroundColor = .clear
        contentBgImgView = UIImageView.init()
        addSubview(contentBgImgView!)
        contentBgImgView?.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        contentBgImgView?.backgroundColor = .clear
        contentBgImgView?.image = UIImage.init(named: "home_mod_content_351x100_")
        contentBgImgView?.isUserInteractionEnabled = true
    }
    
    private func initSitesView() {
        endSiteView = WYSitesView.init()
        contentBgImgView?.addSubview(endSiteView!)
        endSiteView?.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(contentBgImgView!)
            make.height.equalTo(kFirCellHeight * kHeightRatio)
        }
        endSiteView?.iconView?.image = UIImage.init(named: "home_endplace_icon_6x6_")
        endSiteView?.siteLabel?.text = String.init("请选择目的地")
        
        starSiteView = WYSitesView.init()
        contentBgImgView?.addSubview(starSiteView!)
        starSiteView?.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentBgImgView!)
            make.bottom.equalTo(endSiteView!.snp.top)
            make.height.equalTo(kFirCellHeight * kHeightRatio)
        }
        starSiteView?.splitView?.alpha = 0.0
        starSiteView?.iconView?.image = UIImage.init(named: "home_startplace_icon_6x6_")
        starSiteView?.siteLabel?.text = String.init("正在获取上车地点...")
        starSiteView?.siteLabel?.textColor = UIColor.globalHeadlineColor()

    }
    
    private func initMakeAppointView() {
        makeAppointView = WYMakeAppointView.init()
        contentBgImgView?.addSubview(makeAppointView!)
        makeAppointView?.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentBgImgView!)
            make.top.equalTo(contentBgImgView!)
            make.bottom.equalTo(starSiteView!.snp.top)
        }
        makeAppointView?.iconView?.snp.updateConstraints({ (make) in
            make.height.equalTo(0.0 * kHeightRatio)
        })
        makeAppointView?.tipLabel?.snp.updateConstraints({ (make) in
            make.height.equalTo(0.0 * kHeightRatio)
        })
        makeAppointView?.iconView?.alpha = 0.0
        makeAppointView?.tipLabel?.alpha = 0.0
    }
    
    private func initAffirmInfoView() {
        servicePriceView = WYServicePriceView.init()
        contentBgImgView?.addSubview(servicePriceView!)
        servicePriceView?.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(contentBgImgView!)
            make.height.equalTo(kFirCellHeight * kHeightRatio)
        }
        servicePriceView?.isHidden = true
        
        carTypeScrollView = WYCarTypeScrollView.init()
        contentBgImgView?.addSubview(carTypeScrollView!)
        carTypeScrollView?.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentBgImgView!)
            make.bottom.equalTo(endSiteView!.snp.top)
            make.height.equalTo(kFirCellHeight * kHeightRatio)
        }
        carTypeScrollView?.isHidden = true
    }

}
