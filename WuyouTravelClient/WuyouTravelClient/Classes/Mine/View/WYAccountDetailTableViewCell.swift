//
//  WYAccountDetailTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYAccountDetailTableViewCell: UITableViewCell {
    
    var typeLabel: UILabel?
    var dateLabel: UILabel?
    var figureLabel: UILabel?
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
        initAccountDetailTableViewCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initAccountDetailTableViewCell() {
        typeLabel = UILabel.init()
        addSubview(typeLabel!)
        typeLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(17.0 * kWidthRatio)
            make.top.equalTo(self).offset(14.0 * kHeightRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        typeLabel?.backgroundColor = UIColor.white
        typeLabel?.text = String.init("XX")
        typeLabel?.textColor = UIColor.globalHeadlineColor()
        typeLabel?.font = UIFont.globalMainTextFont()
        
        dateLabel = UILabel.init()
        addSubview(dateLabel!)
        dateLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(typeLabel!)
            make.top.equalTo(typeLabel!.snp.bottom).offset(7.0 * kHeightRatio)
            make.height.equalTo(9.0 * kHeightRatio)
        })
        dateLabel?.backgroundColor = UIColor.white
        dateLabel?.text = String.init("XXXX-XX-XX XX:XX:XX")
        dateLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        dateLabel?.font = UIFont.globalFootMenuTextFont()
        
        
        figureLabel = UILabel.init()
        addSubview(figureLabel!)
        figureLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-23.0 * kWidthRatio)
            make.top.equalTo(self).offset(21.0 * kHeightRatio)
            make.height.equalTo(14.0 * kHeightRatio)
        })
        figureLabel?.backgroundColor = UIColor.white
        figureLabel?.text = String.init("+0.0")
        figureLabel?.textColor = UIColor.globalBorderSelectedColor()
        figureLabel?.font = UIFont.globalNavHeadlineFont()
        
        splitLineView = UIView.init()
        addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(17.0 * kWidthRatio)
            make.right.equalTo(self).offset(-17.0 * kWidthRatio)
            make.bottom.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView?.backgroundColor = UIColor.globalSplitLineColor()
    }
}
