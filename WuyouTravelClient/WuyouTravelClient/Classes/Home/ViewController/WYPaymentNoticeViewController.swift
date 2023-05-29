//
//  WYPaymentNoticeViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/3.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPaymentNoticeViewController: UIViewController {
    
    var paymentNoticeView: WYPaymentNoticeView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initPaymentNoticeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension WYPaymentNoticeViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("付款")
    }
    
    fileprivate func initPaymentNoticeView() {
        paymentNoticeView = WYPaymentNoticeView.init()
        view.addSubview(paymentNoticeView!)
        paymentNoticeView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        paymentNoticeView?.knowBtn?.addTarget(self, action: #selector(clickKnowBtnEvent), for: .touchUpInside)
    }
    
}

extension WYPaymentNoticeViewController {
    @objc fileprivate func clickKnowBtnEvent() {
        print("clickKnowBtnEvent")
        navigationController?.popToRootViewController(animated: true)
    }
}
