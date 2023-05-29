//
//  WYMyInfoTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyInfoTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var avatarImgView: UIImageView?
    var subTitleLabel: UILabel?
    var sexLabel: UILabel?
    var arrowImgView: UIImageView?
    var splitLineView: UIView?
    

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
        initMyInfoTableViewCel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initMyInfoTableViewCel() {
        titleLabel = UILabel.init()
        addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(15.0 * kHeightRatio)
        })
        titleLabel?.backgroundColor = UIColor.white
        titleLabel?.text = String.init("XXX")
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.font = UIFont.globalTitleRegularFont()
        
        arrowImgView = UIImageView.init()
        addSubview(arrowImgView!)
        arrowImgView?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-31.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.equalTo(7.0 * kWidthRatio)
            make.height.equalTo(10.0 * kHeightRatio)
        })
        arrowImgView?.backgroundColor = UIColor.white
        arrowImgView?.image = UIImage.init(named: "mine_order_arrow_7x10_")
        
        avatarImgView = UIImageView.init()
        addSubview(avatarImgView!)
        avatarImgView?.snp.makeConstraints({ (make) in
            make.right.equalTo(arrowImgView!.snp.left).offset(-21.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.height.equalTo(50.0 * kHeightRatio)
        })
        avatarImgView?.backgroundColor = UIColor.white
        avatarImgView?.image = UIImage.init(named: "mine_center_avatar_icon_50x50_")
        
        sexLabel = UILabel.init()
        addSubview(sexLabel!)
        sexLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(arrowImgView!.snp.left).offset(-7.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        sexLabel?.backgroundColor = UIColor.white
        sexLabel?.text = String.init("X")
        sexLabel?.textColor = UIColor.globalMainBodyColor()
        sexLabel?.font = UIFont.globalMainTextFont()
        
        subTitleLabel = UILabel.init()
        addSubview(subTitleLabel!)
        subTitleLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-31.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        subTitleLabel?.backgroundColor = UIColor.white
        subTitleLabel?.text = String.init("XXXX")
        subTitleLabel?.textColor = UIColor.globalMainBodyColor()
        subTitleLabel?.font = UIFont.globalMainTextFont()
        
        splitLineView = UIView.init()
        addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView?.backgroundColor = UIColor.globalSplitLineColor()
    }
}
