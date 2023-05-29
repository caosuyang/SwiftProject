//
//  WYFeedbackViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import SVProgressHUD

class WYFeedbackViewController: UIViewController {
    
    var feedbackView: WYFeedbackView?

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        feedbackView?.feedbackTextView?.delegate = nil
    }

}


extension WYFeedbackViewController {
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("意见反馈")
    }

    fileprivate func initFeedbackView() {
        feedbackView = WYFeedbackView.init()
        view.addSubview(feedbackView!)
        feedbackView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
        feedbackView?.submitBtn?.addTarget(self, action: #selector(clickSubmitBtnEvent), for: .touchUpInside)
    }
    
    @objc fileprivate func clickSubmitBtnEvent() {
        print("clickSubmitBtnEvent")
        SVProgressHUD.showSuccess(withStatus: String.init("提交成功"))
        navigationController?.popViewController(animated: true)
    }
}
