//
//  WYMineSideTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/15.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMineSideTableViewCell: UITableViewCell {
    
    var sideIconView: UIImageView!
    var sideTextLabel: UILabel!
    
    

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
        initMineSideCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initMineSideCell() {
        sideIconView = UIImageView.init()
        addSubview(sideIconView)
        sideIconView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(41.0 * kWidthRatio)
            make.centerY.equalTo(self)
            make.width.equalTo(15.0 * kWidthRatio)
            make.height.equalTo(17.0 * kHeightRatio)
        }
        sideIconView.backgroundColor = UIColor.white
        sideIconView.image = UIImage.init(named: "mine_order_icon_15x17_")
        
        sideTextLabel = UILabel.init()
        addSubview(sideTextLabel)
        sideTextLabel.snp.makeConstraints { (make) in
            make.left.equalTo(sideIconView.snp.right).offset(19.0 * kWidthRatio)
            make.centerY.equalTo(sideIconView)
            make.height.equalTo(16.0 * kHeightRatio)
        }
        sideTextLabel.backgroundColor = UIColor.white
        sideTextLabel.text = String.init("XXXX")
        sideTextLabel.textColor = UIColor.globalHeadlineColor()
        sideTextLabel.font = UIFont.globalTitleRegularFont()
        
    }
}
