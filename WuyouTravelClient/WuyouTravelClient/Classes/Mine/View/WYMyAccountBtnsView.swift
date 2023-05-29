//
//  WYMyAccountBtnsView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYMyAccountBtnsView: UIView {

    var accountBtn_50: WYMyAccountBtn?
    var accountBtn_100: WYMyAccountBtn?
    var accountBtn_200: WYMyAccountBtn?
    var accountBtn_500: WYMyAccountBtn?
    var accountBtn_1000: WYMyAccountBtn?
    var accountBtn_more: WYMyAccountInputButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMyAccountBtnsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initMyAccountBtnsView() {
        backgroundColor = UIColor.white
        
        accountBtn_50 = WYMyAccountBtn.init()
        addSubview(accountBtn_50!)
        accountBtn_50?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.top.equalTo(self).offset(kVerticalSpacing * kHeightRatio)
            make.width.equalTo(108.0 * kWidthRatio)
            make.height.equalTo(45.0 * kHeightRatio)
        })
        accountBtn_50?.backgroundColor = UIColor.white
        accountBtn_50?.setTitle(String.init("50元"), for: UIControlState())
        accountBtn_50?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
        
        accountBtn_100 = WYMyAccountBtn.init()
        addSubview(accountBtn_100!)
        accountBtn_100?.snp.makeConstraints({ (make) in
            make.left.equalTo(accountBtn_50!.snp.right).offset(kHorizontalSpacing * kWidthRatio)
            make.top.equalTo(accountBtn_50!)
            make.size.equalTo(accountBtn_50!)
        })
        accountBtn_100?.backgroundColor = UIColor.white
        accountBtn_100?.setTitle(String.init("100元"), for: UIControlState())
        accountBtn_100?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        
        accountBtn_200 = WYMyAccountBtn.init()
        addSubview(accountBtn_200!)
        accountBtn_200?.snp.makeConstraints({ (make) in
            make.left.equalTo(accountBtn_100!.snp.right).offset(kHorizontalSpacing * kWidthRatio)
            make.top.equalTo(accountBtn_100!)
            make.size.equalTo(accountBtn_50!)
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
        })
        accountBtn_200?.backgroundColor = UIColor.white
        accountBtn_200?.setTitle(String.init("200元"), for: UIControlState())
        accountBtn_200?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        
        accountBtn_500 = WYMyAccountBtn.init()
        addSubview(accountBtn_500!)
        accountBtn_500?.snp.makeConstraints({ (make) in
            make.left.equalTo(accountBtn_50!)
            make.top.equalTo(accountBtn_50!.snp.bottom).offset(kVerticalSpacing * kHeightRatio)
            make.size.equalTo(accountBtn_50!)
            make.bottom.equalTo(self).offset(-kVerticalSpacing * kHeightRatio)
        })
        accountBtn_500?.backgroundColor = UIColor.white
        accountBtn_500?.setTitle(String.init("500元"), for: UIControlState())
        accountBtn_500?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor

        accountBtn_1000 = WYMyAccountBtn.init()
        addSubview(accountBtn_1000!)
        accountBtn_1000?.snp.makeConstraints({ (make) in
            make.left.equalTo(accountBtn_500!.snp.right).offset(kHorizontalSpacing * kWidthRatio)
            make.top.bottom.equalTo(accountBtn_500!)
            make.size.equalTo(accountBtn_50!)
        })
        accountBtn_1000?.backgroundColor = UIColor.white
        accountBtn_1000?.setTitle(String.init("1000元"), for: UIControlState())
        accountBtn_1000?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        
        accountBtn_more = WYMyAccountInputButton.init()
        addSubview(accountBtn_more!)
        accountBtn_more?.snp.makeConstraints({ (make) in
            make.left.equalTo(accountBtn_1000!.snp.right).offset(kHorizontalSpacing * kWidthRatio)
            make.top.bottom.equalTo(accountBtn_1000!)
            make.size.equalTo(accountBtn_50!)
        })
        accountBtn_more?.backgroundColor = UIColor.white
        accountBtn_more?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        
        accountBtn_50?.addTarget(self, action: #selector(click50AccountBtnEvent), for: .touchUpInside)
        accountBtn_100?.addTarget(self, action: #selector(click100AccountBtnEvent), for: .touchUpInside)
        accountBtn_200?.addTarget(self, action: #selector(click200AccountBtnEvent), for: .touchUpInside)
        accountBtn_500?.addTarget(self, action: #selector(click500AccountBtnEvent), for: .touchUpInside)
        accountBtn_1000?.addTarget(self, action: #selector(click1000AccountBtnEvent), for: .touchUpInside)
        accountBtn_more?.addTarget(self, action: #selector(clickMoreAccountBtnEvent), for: .touchUpInside)
    }
    
    @objc fileprivate func click50AccountBtnEvent() {
        print("click50AccountBtnEvent")
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.accountBtn_50?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
            self.accountBtn_100?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_200?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_500?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_1000?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_more?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        }) { (true) in
            self.accountBtn_more?.textField?.resignFirstResponder()
        }
        
    }
    
    @objc fileprivate func click100AccountBtnEvent() {
        print("click100AccountBtnEvent")
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: { 
            self.accountBtn_50?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_100?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
            self.accountBtn_200?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_500?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_1000?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_more?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        }) { (true) in
            self.accountBtn_more?.textField?.resignFirstResponder()
        }
        
    }
    
    @objc fileprivate func click200AccountBtnEvent() {
        print("click200AccountBtnEvent")
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.accountBtn_50?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_100?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_200?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
            self.accountBtn_500?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_1000?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_more?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        }) { (true) in
            self.accountBtn_more?.textField?.resignFirstResponder()
        }
    }
    
    @objc fileprivate func click500AccountBtnEvent() {
        print("click500AccountBtnEvent")
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.accountBtn_50?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_100?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_200?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_500?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
            self.accountBtn_1000?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_more?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        }) { (true) in
            self.accountBtn_more?.textField?.resignFirstResponder()
        }
    }
    
    @objc fileprivate func click1000AccountBtnEvent() {
        print("click1000AccountBtnEvent")
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            
            self.accountBtn_50?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_100?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_200?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_500?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_1000?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
            self.accountBtn_more?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        }) { (true) in
            self.accountBtn_more?.textField?.resignFirstResponder()
        }
    }
    
    @objc fileprivate func clickMoreAccountBtnEvent() {
        print("clickMoreAccountBtnEvent")
        
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.accountBtn_50?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_100?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_200?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_500?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_1000?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
            self.accountBtn_more?.layer.borderColor = UIColor.globalBorderSelectedColor().cgColor
        }) { (true) in
            self.accountBtn_more?.textField?.becomeFirstResponder()
        }
    }

}
