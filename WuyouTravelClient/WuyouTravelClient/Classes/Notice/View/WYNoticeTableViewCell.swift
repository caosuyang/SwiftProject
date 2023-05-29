//
//  WYNoticeTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/23.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYNoticeTableViewCell: UITableViewCell {
    
    var oriconView: UIView?
    var iconView: UIImageView?
    var titleLabel: UILabel?
    var imgView: UIImageView?
    var bodyLabel: UILabel?
    var splitLineView: UIView?
    var footerView: UIView?
    var checkDetailTipLabel: UILabel?
    var arrowImgView: UIImageView?
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initNoticeTableViewCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initNoticeTableViewCell() {
        
        oriconView = UIView.init()
        addSubview(oriconView!)
        oriconView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(208.0 * kHeightRatio)
        })
        oriconView?.backgroundColor = UIColor.white
        
        iconView = UIImageView.init()
        oriconView?.addSubview(iconView!)
        iconView?.snp.makeConstraints({ (make) in
            make.left.equalTo(oriconView!).offset(25.0 * kWidthRatio)
            make.top.equalTo(oriconView!).offset(19.0 * kHeightRatio)
            make.width.height.equalTo(27.0 * kHeightRatio)
        })
        iconView?.backgroundColor = UIColor.white
        iconView?.image = UIImage.init(named: "notice_icon_27x27_")
        
        titleLabel = UILabel.init()
        oriconView?.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(iconView!.snp.right).offset(10.0 * kWidthRatio)
            make.centerY.equalTo(iconView!)
            make.height.equalTo(17.0 * kHeightRatio)
            make.right.equalTo(oriconView!).offset(-39.0 * kWidthRatio)
        })
        titleLabel?.backgroundColor = UIColor.white
        titleLabel?.text = String.init("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 17.0 * kHeightRatio)
        
        imgView = UIImageView.init()
        oriconView?.addSubview(imgView!)
        imgView?.snp.makeConstraints({ (make) in
            make.left.equalTo(iconView!)
            make.top.equalTo(iconView!.snp.bottom).offset(kMargin * kHeightRatio)
            make.right.equalTo(oriconView!).offset(-39.0 * kWidthRatio)
            make.height.equalTo(110.0 * kHeightRatio)
        })
        imgView?.backgroundColor = UIColor.white
        imgView?.image = UIImage.init(named: "notice_img_311x110_")
        
        bodyLabel = UILabel.init()
        oriconView?.addSubview(bodyLabel!)
        bodyLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(imgView!)
            make.top.equalTo(imgView!.snp.bottom).offset(11.0 * kHeightRatio)
            make.right.equalTo(imgView!)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        bodyLabel?.backgroundColor = UIColor.white
        bodyLabel?.text = String.init("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        bodyLabel?.textColor = UIColor.globalMainBodyColor()
        bodyLabel?.font = UIFont.globalMainTextFont()
        
        splitLineView = UIView.init()
        oriconView?.addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(bodyLabel!)
            make.top.equalTo(bodyLabel!.snp.bottom).offset(14.0 * kHeightRatio)
            make.height.equalTo(kSplitLineHeight)
            make.bottom.equalTo(oriconView!)
        })
        splitLineView?.backgroundColor = UIColor.init(r: 219, g: 219, b: 219)
        
        
        footerView = UIView.init()
        addSubview(footerView!)
        footerView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(oriconView!.snp.bottom)
            make.height.equalTo(42.0 * kHeightRatio)
        })
        footerView?.backgroundColor = UIColor.white

        checkDetailTipLabel = UILabel.init()
        footerView?.addSubview(checkDetailTipLabel!)
        checkDetailTipLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(footerView!).offset(-4.0 * kHeightRatio)
            make.left.equalTo(footerView!).offset(25.0 * kWidthRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        checkDetailTipLabel?.backgroundColor = UIColor.white
        checkDetailTipLabel?.text = String.init("查看详情")
        checkDetailTipLabel?.textColor = UIColor.globalHeadlineColor()
        checkDetailTipLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 14.0 * kHeightRatio)
        
        arrowImgView = UIImageView.init()
        footerView?.addSubview(arrowImgView!)
        arrowImgView?.snp.makeConstraints({ (make) in
            make.right.equalTo(footerView!).offset(-39.0 * kWidthRatio)
            make.centerY.equalTo(checkDetailTipLabel!)
            make.width.equalTo(7.0 * kWidthRatio)
            make.height.equalTo(10.0 * kHeightRatio)
        })
        arrowImgView?.backgroundColor = UIColor.white
        arrowImgView?.image = UIImage.init(named: "mine_order_arrow_7x10_")
        
    }
}
