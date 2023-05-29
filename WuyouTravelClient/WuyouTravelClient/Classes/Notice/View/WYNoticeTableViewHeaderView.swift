//
//  WYNoticeTableViewHeaderView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/29.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYNoticeTableViewHeaderView: UITableViewHeaderFooterView {
    
    var dateView: WYNoticeTimeView?

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initNoticeTableViewHeaderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initNoticeTableViewHeaderView() {
        backgroundColor = UIColor.globalBackgroundColor()
        
        
        dateView = WYNoticeTimeView.init()
        addSubview(dateView!)
        dateView?.snp.makeConstraints({ (make) in
            make.center.equalTo(self)
            make.height.equalTo(20.0 * kHeightRatio)
        })
    }
}
