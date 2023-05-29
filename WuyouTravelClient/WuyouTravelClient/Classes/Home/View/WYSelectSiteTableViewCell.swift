//
//  WYSelectSiteTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYSelectSiteTableViewCell: UITableViewCell {
    
    var mainTitleLabel: UILabel?
    var subTitleLabel: UILabel?
    var splitLineView: UIView?
    var splitLineView2: UIView?
    var siteModel: WYSelectSiteModel? {
        didSet {
            mainTitleLabel?.text = siteModel?.mainName
            subTitleLabel?.text = siteModel?.detailAddress
        }
    }

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
        initSelectSiteTableViewCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSelectSiteTableViewCell() {
        backgroundColor = .white
        mainTitleLabel = UILabel.init()
        addSubview(mainTitleLabel!)
        mainTitleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(22.0 * kWidthRatio)
            make.top.equalTo(self).offset(11.0 * kHeightRatio)
            make.right.equalTo(-22.0 * kWidthRatio)
            make.height.equalTo(13.0 * kHeightRatio)
        })
        mainTitleLabel?.backgroundColor = .white
        mainTitleLabel?.text = String.init("XXXX")
        mainTitleLabel?.textColor = UIColor.black
        mainTitleLabel?.font = UIFont.mediumSystemFontOfSize(size: 14.0 * kHeightRatio)
        mainTitleLabel?.textAlignment = .left
        
        subTitleLabel = UILabel.init()
        addSubview(subTitleLabel!)
        subTitleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(mainTitleLabel!)
            make.top.equalTo(mainTitleLabel!.snp.bottom).offset(6.0 * kHeightRatio)
            make.right.equalTo(mainTitleLabel!)
            make.height.equalTo(12.0 * kHeightRatio)
            make.bottom.equalTo(self).offset(-10.0 * kHeightRatio)
        })
        subTitleLabel?.backgroundColor = .white
        subTitleLabel?.text = String.init("XXXXXXXXXXXXXXXXXXXX")
        subTitleLabel?.textColor = UIColor.globalMainBodyColor()
        subTitleLabel?.font = UIFont.mediumSystemFontOfSize(size: 12.0 * kHeightRatio)
        subTitleLabel?.textAlignment = .left

        splitLineView = UIView.init()
        addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(kBorderWidth)
        })
        splitLineView?.backgroundColor = UIColor.globalSplitLineColor()
        
        splitLineView2 = UIView.init()
        addSubview(splitLineView2!)
        splitLineView2?.snp.makeConstraints({ (make) in
            make.top.left.bottom.equalTo(self)
            make.width.equalTo(kBorderWidth)
        })
        splitLineView2?.backgroundColor = UIColor.globalSplitLineColor()
    }


}
