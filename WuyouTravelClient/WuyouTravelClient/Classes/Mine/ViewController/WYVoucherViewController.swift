//
//  WYVoucherViewController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYVoucherViewController: UIViewController, UIScrollViewDelegate {
    
    var voucherTopView: WYVoucherTopView?
    var contentScrollView: UIScrollView?
    var voucherChannels: NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initBackgroundColor()
        initNavigationItem()
        initChannels()
        initChildViewController()
        initVoucherTopView()
        initContentScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - init control

extension WYVoucherViewController {
    
    fileprivate func initBackgroundColor() {
        view.backgroundColor = UIColor.globalBackgroundColor()
    }
    
    fileprivate func initNavigationItem() {
        navigationItem.title = String.init("代金券")
    }
    
    fileprivate func initChannels() {
        if voucherChannels == nil {
            voucherChannels = NSMutableArray.init()
            if voucherChannels?.count == 0 {
                voucherChannels?.addObjects(from: ["可使用", "已使用", "已过期"])
            }
        }
    }
    
    fileprivate func initChildViewController() {
        for index in 0..<voucherChannels!.count {
            let vc = WYVoucherTableViewController.init()
            vc.voucherType = index
            self.addChildViewController(vc)
        }
        print(self.childViewControllers)
    }
    
    fileprivate func initVoucherTopView() {
        voucherTopView = WYVoucherTopView.init()
        view.addSubview(voucherTopView!)
        voucherTopView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(kFirCellHeight * kHeightRatio)
        })
        voucherTopView?.availableBtn?.addTarget(self, action: #selector(clickAvailableBtnEvent(btn:)), for: .touchUpInside)
        
        voucherTopView?.usedBtn?.addTarget(self, action: #selector(clickUsedBtnEvent(btn:)), for: .touchUpInside)
        
        voucherTopView?.expiredBtn?.addTarget(self, action: #selector(clickExpiredBtnEvent(btn:)), for: .touchUpInside)
    }
    
    fileprivate func initContentScrollView() {
    
        contentScrollView = UIScrollView.init(frame: view.bounds)
        contentScrollView?.backgroundColor = UIColor.globalBackgroundColor()
        contentScrollView?.delegate = self
        contentScrollView?.isPagingEnabled = true
        contentScrollView?.showsVerticalScrollIndicator = false
        contentScrollView?.showsHorizontalScrollIndicator = false
        contentScrollView?.bounces = false
        contentScrollView?.contentSize = CGSize(width: CGFloat(voucherChannels!.count) * contentScrollView!.width, height: 0.0)
        view.insertSubview(contentScrollView!, at: 0)
        print(contentScrollView!.width, contentScrollView!.height)
        scrollViewDidEndScrollingAnimation(contentScrollView!)
    }
}

extension WYVoucherViewController {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
        scrollViewDidEndScrollingAnimation(scrollView)
        let currentIndex: Int = Int(scrollView.contentOffset.x / screenWidth)
        if currentIndex == 0 {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
                self.voucherTopView?.bottomLineView?.snp.updateConstraints({ (make) in
                    make.left.equalTo(self.voucherTopView!).offset(39.0 * kWidthRatio)
                })
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        } else if currentIndex == 1 {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.voucherTopView?.bottomLineView?.snp.updateConstraints({ (make) in
                    make.left.equalTo(self.voucherTopView!).offset(self.voucherTopView!.availableBtn!.width + 39.0 * kWidthRatio)
                })
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        } else if currentIndex == 2 {
            UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
                self.voucherTopView?.bottomLineView?.snp.updateConstraints({ (make) in
                    make.left.equalTo(self.voucherTopView!).offset(screenWidth - 39.0 * kWidthRatio - self.voucherTopView!.bottomLineView!.width)
                })
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        }
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation")
        if scrollView == contentScrollView {
            let currentIndex: Int = Int(scrollView.contentOffset.x / screenWidth)
            let vc = childViewControllers[currentIndex]
            vc.view.frame.origin = CGPoint.init(x: scrollView.contentOffset.x, y: 0.0)
            contentScrollView?.addSubview(vc.view)
        }
    }
    
    @objc fileprivate func clickAvailableBtnEvent(btn: UIButton) {
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.voucherTopView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.voucherTopView!).offset(39.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        print(btn.tag)
        var offSet = contentScrollView!.contentOffset
        offSet.x = CGFloat(btn.tag) * contentScrollView!.width
        contentScrollView?.setContentOffset(offSet, animated: true)
    }
    
    @objc fileprivate func clickUsedBtnEvent(btn: UIButton) {
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.voucherTopView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.voucherTopView!).offset(self.voucherTopView!.availableBtn!.width + 39.0 * kWidthRatio)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        var offSet = contentScrollView!.contentOffset
        offSet.x = CGFloat(btn.tag) * contentScrollView!.width
        contentScrollView?.setContentOffset(offSet, animated: true)
    }
    
    @objc fileprivate func clickExpiredBtnEvent(btn: UIButton) {
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.voucherTopView?.bottomLineView?.snp.updateConstraints({ (make) in
                make.left.equalTo(self.voucherTopView!).offset(screenWidth - 39.0 * kWidthRatio - self.voucherTopView!.bottomLineView!.width)
            })
            self.view.layoutIfNeeded()
        }, completion: nil)
        var offSet = contentScrollView!.contentOffset
        offSet.x = CGFloat(btn.tag) * contentScrollView!.width
        contentScrollView?.setContentOffset(offSet, animated: true)
    }
    
}
