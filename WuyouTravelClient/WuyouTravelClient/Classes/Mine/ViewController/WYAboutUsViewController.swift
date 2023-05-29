//
//  WYAboutUsViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYAboutUsViewController: UIViewController {
    
    var aboutUsView: WYAboutUsView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initAboutUsView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension WYAboutUsViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("关于我们")
    }
    
    fileprivate func initAboutUsView() {
        aboutUsView = WYAboutUsView.init()
        view.addSubview(aboutUsView!)
        aboutUsView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
    }
}
