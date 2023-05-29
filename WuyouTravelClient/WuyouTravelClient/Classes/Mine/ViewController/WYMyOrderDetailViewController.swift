//
//  WYMyOrderDetailViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyOrderDetailViewController: UIViewController {
    
    var myOrderDetailView: WYMyOrderDetailView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initMyOrderDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - init control

extension WYMyOrderDetailViewController {
    
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("订单详情")
    }
    
    fileprivate func initMyOrderDetailView() {
        myOrderDetailView = WYMyOrderDetailView.init()
        view.addSubview(myOrderDetailView!)
        myOrderDetailView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        // 行程信息
        myOrderDetailView?.travelInfoView?.typeLabel?.text = String.init("接送机")
        myOrderDetailView?.travelInfoView?.timeView?.siteLabel?.text = String.init("8月1日 14:00")
        myOrderDetailView?.travelInfoView?.startSiteView?.siteLabel?.text = String.init("上海浦东新区东方路世纪大道地铁站")
        myOrderDetailView?.travelInfoView?.endSiteView?.siteLabel?.text = String.init("上海市闵行区申贵路1500号")
        
        // 车费信息
        myOrderDetailView?.fareDetailView?.totalPriceView?.figureLabel?.text = String.init("108.6")
        myOrderDetailView?.fareDetailView?.starFareTypeView?.figureLabel?.text = String.init("18")
        myOrderDetailView?.fareDetailView?.mileageFareTypeView?.figureLabel?.text = String.init("110.6")
        myOrderDetailView?.fareDetailView?.voucherFareTypeView?.figureLabel?.text = String.init("20")
        
        // 支付方式
        myOrderDetailView?.payStyleView?.figureLabel?.text = String.init("余额支付")
    }
}
