//
//  WYMySettingTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMySettingTableViewCell: UITableViewCell {

    var titleLabel: UILabel?
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
        
        splitLineView = UIView.init()
        addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView?.backgroundColor = UIColor.globalSplitLineColor()
    }


}
