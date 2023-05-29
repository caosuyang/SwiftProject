//
//  WYNoticeDetailViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/23.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYNoticeDetailViewController: UIViewController {
    
    var noticeDetailView: WYNoticeDetailView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initNoticeDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


// MARK: - init control

extension WYNoticeDetailViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("消息")
    }
    
    fileprivate func initNoticeDetailView() {
        noticeDetailView = WYNoticeDetailView.init()
        view.addSubview(noticeDetailView!)
        noticeDetailView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        noticeDetailView?.titleLabel?.text = String.init("无忧出行168元新人大礼包")
        noticeDetailView?.publishTimeLabel?.text = String.init("发布时间：2017-08-16")
        noticeDetailView?.contentImgView?.image = UIImage.init(named: "gift_img_311x110_")
        noticeDetailView?.contentLabel?.text = String.init("为了回馈广大用户的支持，无忧出行特推出“新人享新礼活动”；凡在2017年9月1日到10月1日注册登录的用户，均可获得168元代金券，可用于无忧出行APP内的各类服务。")
    }
    
}
