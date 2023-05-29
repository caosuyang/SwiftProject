//
//  WYRechargeNoticeViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/3.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYRechargeNoticeViewController: UIViewController {
    
    var rechargeNoticeView: WYRechargeNoticeView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initFeedbackView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension WYRechargeNoticeViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("充值")
    }
    
    fileprivate func initFeedbackView() {
        rechargeNoticeView = WYRechargeNoticeView.init()
        view.addSubview(rechargeNoticeView!)
        rechargeNoticeView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        rechargeNoticeView?.returnBackBtn?.addTarget(self, action: #selector(clickReturnBackBtnEvent), for: .touchUpInside)
    }
    
}

extension WYRechargeNoticeViewController {
    @objc fileprivate func clickReturnBackBtnEvent() {
        print("clickReturnBackBtnEvent")
        navigationController?.popViewController(animated: true)
    }
}
