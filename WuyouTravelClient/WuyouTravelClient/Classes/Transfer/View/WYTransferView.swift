
//
//  WYTransferView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/29.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYTransferView: UIView {

    var contentView: UIView?
    var fliNoView: WYTransferRowView?
    var boardTimeView: WYTransferRowView?
    var locationSiteView: WYTransferRowView?
    var getOffSiteView: WYTransferRowView?
    var servicePriceView: WYAffirmInfoView?
    var askCarBtn: WYCallCarButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initTransferView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initTransferView() {
        backgroundColor = UIColor.globalBackgroundColor()
        
        contentView = UIView.init()
        addSubview(contentView!)
        contentView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(245.0 * kHeightRatio)
        })
        contentView?.backgroundColor = UIColor.white
        
        fliNoView = WYTransferRowView.init()
        contentView?.addSubview(fliNoView!)
        fliNoView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(contentView!).offset(8.0 * kHeightRatio)
            make.height.equalTo(52.0 * kHeightRatio)
        })
        fliNoView?.textLabel?.text = String.init("请输入航班号 延误免费等待")
        
        boardTimeView = WYTransferRowView.init()
        contentView?.addSubview(boardTimeView!)
        boardTimeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(fliNoView!.snp.bottom)
            make.height.equalTo(52.0 * kHeightRatio)
        })
        boardTimeView?.textLabel?.text = String.init("请选择上车时间")
        boardTimeView?.textLabel?.textColor = UIColor.globalPlaceholderColor()
        boardTimeView?.iconView?.snp.updateConstraints({ (make) in
            make.left.equalTo(boardTimeView!).offset(38.0 * kWidthRatio)
            make.width.height.equalTo(11.0 * kHeightRatio)
        })
        boardTimeView?.iconView?.image = UIImage.init(named: "transfer_sel_time_icon_11x11_")
        
        
        locationSiteView = WYTransferRowView.init()
        contentView?.addSubview(locationSiteView!)
        locationSiteView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(boardTimeView!.snp.bottom)
            make.height.equalTo(52.0 * kHeightRatio)
        })
        locationSiteView?.textLabel?.text = String.init("正在获取上车地点...")
        locationSiteView?.textLabel?.textColor = UIColor.globalHeadlineColor()
        locationSiteView?.iconView?.snp.updateConstraints({ (make) in
            make.left.equalTo(locationSiteView!).offset(40.0 * kWidthRatio)
            make.width.height.equalTo(6.0 * kHeightRatio)
        })
        locationSiteView?.iconView?.image = UIImage.init(named: "home_startplace_icon_6x6_")
        
        getOffSiteView = WYTransferRowView.init()
        contentView?.addSubview(getOffSiteView!)
        getOffSiteView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(locationSiteView!.snp.bottom)
            make.height.equalTo(52.0 * kHeightRatio)
            make.bottom.equalTo(contentView!).offset(-30.0 * kHeightRatio)
        })
        getOffSiteView?.textLabel?.text = String.init("您在哪下车")
        getOffSiteView?.textLabel?.textColor = UIColor.globalPlaceholderColor()
        getOffSiteView?.iconView?.snp.updateConstraints({ (make) in
            make.left.equalTo(getOffSiteView!).offset(40.0 * kWidthRatio)
            make.width.height.equalTo(6.0 * kHeightRatio)
        })
        getOffSiteView?.iconView?.image = UIImage.init(named: "home_endplace_icon_6x6_")
        
        servicePriceView = WYAffirmInfoView.init()
        addSubview(servicePriceView!)
        servicePriceView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(contentView!.snp.bottom).offset(10.0 * kHeightRatio)
            make.height.equalTo(160.0 * kHeightRatio)
        })
        servicePriceView?.carTypeScrollView?.snp.updateConstraints({ (make) in
            make.height.equalTo(80.0 * kHeightRatio)
        })
        servicePriceView?.carTypeScrollView?.officialBtn?.snp.updateConstraints({ (make) in
            make.left.equalTo(servicePriceView!.carTypeScrollView!).offset(43.0 * kWidthRatio)
        })
        servicePriceView?.carTypeScrollView?.businessBtn?.snp.updateConstraints({ (make) in
            make.left.equalTo(servicePriceView!.carTypeScrollView!.officialBtn!.snp.right).offset(58.0 * kWidthRatio)
        })
        servicePriceView?.carTypeScrollView?.luxuryBtn?.snp.updateConstraints({ (make) in
            make.left.equalTo(servicePriceView!.carTypeScrollView!.businessBtn!.snp.right).offset(58.0 * kWidthRatio)
            make.right.equalTo(servicePriceView!.carTypeScrollView!).offset(-43.0 * kWidthRatio)
        })
        servicePriceView?.carTypeScrollView?.officialBtn?.imgView?.snp.updateConstraints({ (make) in
            make.top.equalTo(servicePriceView!.carTypeScrollView!.officialBtn!).offset(33.0 * kHeightRatio)
        })
        servicePriceView?.carTypeScrollView?.businessBtn?.imgView?.snp.updateConstraints({ (make) in
            make.top.equalTo(servicePriceView!.carTypeScrollView!.businessBtn!).offset(32.0 * kHeightRatio)
        })
        servicePriceView?.carTypeScrollView?.luxuryBtn?.imgView?.snp.updateConstraints({ (make) in
            make.top.equalTo(servicePriceView!.carTypeScrollView!.luxuryBtn!).offset(33.0 * kHeightRatio)
        })
        servicePriceView?.servicePriceView?.serveCostView?.iconView?.snp.updateConstraints({ (make) in
            make.left.equalTo(servicePriceView!.servicePriceView!.serveCostView!).offset(55.0 * kWidthRatio)
            make.centerY.equalTo(servicePriceView!.servicePriceView!.serveCostView!)
        })
        
        
        askCarBtn = WYCallCarButton.init()
        addSubview(askCarBtn!)
        askCarBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(27.0 * kWidthRatio)
            make.bottom.equalTo(self).offset(-29.0 * kHeightRatio)
            make.right.equalTo(self).offset(-27.0 * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        askCarBtn?.setTitle(String.init("叫车"), for: UIControlState())
    }

}
