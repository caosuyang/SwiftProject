//
//  WYPaymentViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/28.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYPaymentViewController: UIViewController {
    
    var paymentView: WYPaymetView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initPaymentView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - init control

extension WYPaymentViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("付款")
    }
    
    fileprivate func initPaymentView() {
        paymentView = WYPaymetView.init()
        view.addSubview(paymentView!)
        paymentView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        paymentView?.fareDetailView?.totalPriceView?.figureLabel?.text = String.init("108.6")
        paymentView?.fareDetailView?.starFareTypeView?.figureLabel?.text = String.init("18元")
        paymentView?.fareDetailView?.mileageFareTypeView?.figureLabel?.text = String.init("110.6元")
        paymentView?.fareDetailView?.voucherFareTypeView?.figureLabel?.text = String.init("20元")
        paymentView?.payStyleView?.balancePayView?.chooseBtn?.addTarget(self, action: #selector(selectBalancePayBtn(btn:)), for: .touchUpInside)
        paymentView?.payStyleView?.wxPayView?.chooseBtn?.addTarget(self, action: #selector(selectWxPayBtn(btn:)), for: .touchUpInside)
        paymentView?.payStyleView?.aliPayView?.chooseBtn?.addTarget(self, action: #selector(selectAliPayBtn(btn:)), for: .touchUpInside)
        paymentView?.definePayBtn?.addTarget(self, action: #selector(clickDefinePayBtnEvent), for: .touchUpInside)
    }
    
    @objc fileprivate func clickDefinePayBtnEvent() {
        print("clickDefinePayBtnEvent")
        
        let noticeVC = WYPaymentNoticeViewController.init()
        navigationController?.pushViewController(noticeVC, animated: true)

    }
    
    @objc fileprivate func selectBalancePayBtn(btn: UIButton) {
        print("selectBalancePayBtn")
        btn.isSelected = true
        paymentView?.payStyleView?.wxPayView?.chooseBtn?.isSelected = false
        paymentView?.payStyleView?.aliPayView?.chooseBtn?.isSelected = false
    }
    
    @objc fileprivate func selectWxPayBtn(btn: UIButton) {
        print("selectWxPayBtn")
        btn.isSelected = true
        paymentView?.payStyleView?.balancePayView?.chooseBtn?.isSelected = false
        paymentView?.payStyleView?.aliPayView?.chooseBtn?.isSelected = false

    }
    
    @objc fileprivate func selectAliPayBtn(btn: UIButton) {
        print("selectAliPayBtn")
        btn.isSelected = true
        paymentView?.payStyleView?.wxPayView?.chooseBtn?.isSelected = false
        paymentView?.payStyleView?.balancePayView?.chooseBtn?.isSelected = false
    }
    
    
}
