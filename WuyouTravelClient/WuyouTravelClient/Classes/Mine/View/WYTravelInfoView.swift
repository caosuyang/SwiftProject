//
//  WYTravelInfoView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYTravelInfoView: UIView {

    var payHeadView: WYFareHeadView?
    var typeView: UIView?
    var typeLabel: UILabel?
    var contentView: UIView?
    var timeView: WYSiteView?
    var startSiteView: WYSiteView?
    var endSiteView: WYSiteView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initTravelInfoView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initTravelInfoView() {
        backgroundColor = .white
        
        payHeadView = WYFareHeadView.init()
        addSubview(payHeadView!)
        payHeadView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(41.0 * kHeightRatio)
        })
        
        
        typeView = UIView.init()
        addSubview(typeView!)
        typeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(payHeadView!.snp.bottom)
            make.height.equalTo(31.0 * kHeightRatio)
        })
        typeView?.backgroundColor = UIColor.white
        
        typeLabel = UILabel.init()
        typeView?.addSubview(typeLabel!)
        typeLabel?.snp.makeConstraints({ (make) in
            make.center.equalTo(typeView!)
            make.height.equalTo(15.0 * kHeightRatio)
        })
        typeLabel?.backgroundColor = UIColor.white
        typeLabel?.text = String.init("XXX")
        typeLabel?.textColor = UIColor.globalHeadlineColor()
        typeLabel?.font = UIFont.globalTitleRegularFont()
        typeLabel?.textAlignment = .center
        
        contentView = UIView.init()
        addSubview(contentView!)
        contentView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(typeView!.snp.bottom)
            make.height.equalTo(127.0 * kHeightRatio)
        })
        contentView?.backgroundColor = UIColor.white
        
        timeView = WYSiteView.init()
        contentView?.addSubview(timeView!)
        timeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(contentView!).offset(13.0 * kHeightRatio)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        timeView?.iconView?.snp.updateConstraints { (make) in
            make.left.equalTo(timeView!).offset(59.0 * kWidthRatio)
        }
        timeView?.siteLabel?.snp.updateConstraints { (make) in
            make.left.equalTo(timeView!).offset(79.0 * kWidthRatio)
            make.right.equalTo(timeView!).offset(-50.0 * kWidthRatio)
        }
        
        startSiteView = WYSiteView.init()
        contentView?.addSubview(startSiteView!)
        startSiteView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(timeView!.snp.bottom)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        startSiteView?.iconView?.image = UIImage.init(named: "home_startplace_icon_6x6_")
        startSiteView?.iconView?.snp.updateConstraints { (make) in
            make.left.equalTo(startSiteView!).offset(61.0 * kWidthRatio)
            make.width.height.equalTo(6.0 * kHeightRatio)
        }
        startSiteView?.siteLabel?.snp.updateConstraints { (make) in
            make.left.equalTo(startSiteView!).offset(77.0 * kWidthRatio)
            make.right.equalTo(startSiteView!).offset(-50.0 * kWidthRatio)
        }
        
        endSiteView = WYSiteView.init()
        contentView?.addSubview(endSiteView!)
        endSiteView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.top.equalTo(startSiteView!.snp.bottom)
            make.height.equalTo(28.0 * kHeightRatio)
            make.bottom.equalTo(contentView!).offset(-31.0 * kHeightRatio)
        })
        endSiteView?.iconView?.image = UIImage.init(named: "home_endplace_icon_6x6_")
        endSiteView?.iconView?.snp.updateConstraints { (make) in
            make.left.equalTo(endSiteView!).offset(61.0 * kWidthRatio)
            make.width.height.equalTo(6.0 * kHeightRatio)
        }
        endSiteView?.siteLabel?.snp.updateConstraints { (make) in
            make.left.equalTo(endSiteView!).offset(77.0 * kWidthRatio)
            make.right.equalTo(endSiteView!).offset(-50.0 * kWidthRatio)
        }
        
    }

}
