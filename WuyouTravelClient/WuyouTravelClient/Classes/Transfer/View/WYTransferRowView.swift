//
//  WYTransferRowView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/29.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYTransferRowView: UIView {

    var iconView: UIImageView?
    var textLabel: UILabel?
    var splitLineView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initTransferRowView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initTransferRowView() {
        iconView = UIImageView.init()
        addSubview(iconView!)
        iconView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(35.0 * kWidthRatio)
            make.centerY.equalTo(self).offset(7.0 * kHeightRatio)
            make.width.height.equalTo(16.0 * kHeightRatio)
        })
        iconView?.backgroundColor = UIColor.white
        iconView?.image = UIImage.init(named: "transfer_flight_no_icon_16x16_")
        
        textLabel = UILabel.init()
        addSubview(textLabel!)
        textLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(65.0 * kWidthRatio)
            make.centerY.equalTo(iconView!)
            make.height.equalTo(13.0 * kHeightRatio)
            make.right.equalTo(self).offset(-66.0 * kWidthRatio)
        })
        textLabel?.backgroundColor = UIColor.white
        textLabel?.text = String.init("XXXXXXXXXXXXXX")
        textLabel?.textColor = UIColor.globalThemeDefaultColor()
        textLabel?.font = UIFont.globalMainTextFont()
        
        splitLineView = UIView.init()
        addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(65.0 * kWidthRatio)
            make.right.equalTo(self).offset(-66.0 * kWidthRatio)
            make.bottom.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView?.backgroundColor = UIColor.init(r: 239, g: 239, b: 239)
    }

}
