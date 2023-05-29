//
//  WYMyOrderTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/29.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyOrderTableViewCell: UITableViewCell {
    
    var headerView: UIView?
    var typeLabel: UILabel?
    var statusLabel: UILabel?
    var arrowImgView: UIImageView?
    var middleView: UIView?
    var timeView: WYSiteView?
    var starPlaceView: WYSiteView?
    var endPlaceView: WYSiteView?
    var footerView: UIView?
    var inAllLabel: UILabel?
    var figureLabel: UILabel?
    var splitLineView_head: UIView?
    var splitLineView_mid: UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.origin.x += 25.0 * kWidthRatio
            newFrame.size.width -= newFrame.origin.x * 2
            newFrame.origin.y += 20.0 * kHeightRatio
            newFrame.size.height -= 20.0 * kHeightRatio
            super.frame = newFrame
        }
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initMyOrderTableViewCell()
        initShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initMyOrderTableViewCell() {
        
        headerView = UIView.init()
        addSubview(headerView!)
        headerView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(40.0 * kHeightRatio)
        })
        headerView?.backgroundColor = UIColor.white
        
        splitLineView_head = UIView.init()
        headerView?.addSubview(splitLineView_head!)
        splitLineView_head?.snp.makeConstraints({ (make) in
            make.left.equalTo(headerView!).offset(14.0 * kWidthRatio)
            make.right.equalTo(headerView!).offset(-14.0 * kWidthRatio)
            make.bottom.equalTo(headerView!)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView_head?.backgroundColor = UIColor.init(r: 239, g: 239, b: 239)
        
        typeLabel = UILabel.init()
        headerView?.addSubview(typeLabel!)
        typeLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(headerView!).offset(17.0 * kWidthRatio)
            make.centerY.equalTo(headerView!)
            make.height.equalTo(15.0 * kHeightRatio)
        })
        typeLabel?.backgroundColor = UIColor.white
        typeLabel?.text = String.init("XX")
        typeLabel?.textColor = UIColor.globalHeadlineColor()
        typeLabel?.font = UIFont.globalTitleRegularFont()
        
        
        arrowImgView = UIImageView.init()
        headerView?.addSubview(arrowImgView!)
        arrowImgView?.snp.makeConstraints({ (make) in
            make.right.equalTo(headerView!).offset(-19.0 * kWidthRatio)
            make.centerY.equalTo(headerView!).offset(2.0 * kHeightRatio)
            make.width.equalTo(7.0 * kWidthRatio)
            make.height.equalTo(10.0 * kHeightRatio)
        })
        arrowImgView?.backgroundColor = UIColor.white
        arrowImgView?.image = UIImage.init(named: "mine_order_arrow_7x10_")
        
        
        statusLabel = UILabel.init()
        headerView?.addSubview(statusLabel!)
        statusLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(arrowImgView!.snp.left).offset(-5.0 * kWidthRatio)
            make.centerY.equalTo(arrowImgView!)
            make.height.equalTo(arrowImgView!)
        })
        statusLabel?.backgroundColor = UIColor.white
        statusLabel?.text = String.init("XXX")
        statusLabel?.textColor = UIColor.globalMainBodyColor()
        statusLabel?.font = UIFont.globalFootMenuTextFont()
        statusLabel?.textAlignment = .right
        
        
        middleView = UIView.init()
        addSubview(middleView!)
        middleView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(headerView!.snp.bottom)
            make.height.equalTo(89.0 * kHeightRatio)
        })
        middleView?.backgroundColor = UIColor.white
        
        timeView = WYSiteView.init()
        middleView?.addSubview(timeView!)
        timeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(middleView!)
            make.top.equalTo(middleView!).offset(4.0 * kHeightRatio)
            make.height.equalTo(24.0 * kHeightRatio)
        })
        
        starPlaceView = WYSiteView.init()
        middleView?.addSubview(starPlaceView!)
        starPlaceView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(middleView!)
            make.top.equalTo(timeView!.snp.bottom)
            make.height.equalTo(24.0 * kHeightRatio)
        })
        starPlaceView?.iconView?.snp.updateConstraints { (make) in
            make.left.equalTo(starPlaceView!).offset(16.0 * kWidthRatio)
            make.width.height.equalTo(6.0 * kHeightRatio)
        }
        starPlaceView?.iconView?.image = UIImage.init(named: "home_startplace_icon_6x6_")
        
        
        endPlaceView = WYSiteView.init()
        middleView?.addSubview(endPlaceView!)
        endPlaceView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(middleView!)
            make.top.equalTo(starPlaceView!.snp.bottom)
            make.height.equalTo(24.0 * kHeightRatio)
            make.bottom.equalTo(middleView!).offset(-8.0 * kHeightRatio)
        })
        endPlaceView?.iconView?.snp.updateConstraints { (make) in
            make.left.equalTo(endPlaceView!).offset(16.0 * kWidthRatio)
            make.width.height.equalTo(6.0 * kHeightRatio)
        }
        endPlaceView?.iconView?.image = UIImage.init(named: "home_endplace_icon_6x6_")
        
        
        splitLineView_mid = UIView.init()
        middleView?.addSubview(splitLineView_mid!)
        splitLineView_mid?.snp.makeConstraints({ (make) in
            make.left.equalTo(middleView!).offset(14.0 * kWidthRatio)
            make.right.equalTo(middleView!).offset(-14.0 * kWidthRatio)
            make.bottom.equalTo(middleView!)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView_mid?.backgroundColor = UIColor.init(r: 239, g: 239, b: 239)
        
        
        footerView = UIView.init()
        addSubview(footerView!)
        footerView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(middleView!.snp.bottom)
            make.height.equalTo(36.0 * kHeightRatio)
            make.bottom.equalTo(self)
        })
        middleView?.backgroundColor = UIColor.white
        
        inAllLabel = UILabel.init()
        footerView?.addSubview(inAllLabel!)
        inAllLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(footerView!).offset(20.0 * kWidthRatio)
            make.centerY.equalTo(footerView!)
            make.height.equalTo(10.0 * kHeightRatio)
        })
        inAllLabel?.backgroundColor = UIColor.white
        inAllLabel?.text = String.init("共计")
        inAllLabel?.textColor = UIColor.globalSupTextColor()
        inAllLabel?.font = UIFont.globalFootMenuTextFont()
        
        
        figureLabel = UILabel.init()
        footerView?.addSubview(figureLabel!)
        figureLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(footerView!).offset(-19.0 * kWidthRatio)
            make.centerY.equalTo(footerView!)
            make.height.equalTo(14.0 * kHeightRatio)
        })
        figureLabel?.backgroundColor = UIColor.white
        figureLabel?.text = String.init("XX元")
        figureLabel?.textColor = UIColor.init(r: 239, g: 78, b: 78)
        figureLabel?.font = UIFont.globalTitleBoldFont()
        figureLabel?.textAlignment = .right

    }
    
    private func initShadow() {
        layer.shadowColor = UIColor.init(r: 249, g: 248, b: 248).cgColor
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 2.25
        layer.shadowOffset = CGSize(width: 4.5, height: 4.5)
    }
}
