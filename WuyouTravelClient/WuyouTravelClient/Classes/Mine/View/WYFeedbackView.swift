//
//  WYFeedbackView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/3.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYFeedbackView: UIView, UITextViewDelegate {

    var feedbackTextView: UITextView?
    var placeHolderLabel: UILabel?
    var countLabel: UILabel?
    var submitBtn: WYCallCarButton?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFeedbackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFeedbackView() {
        backgroundColor = UIColor.globalBackgroundColor()
        
        feedbackTextView = UITextView.init()
        addSubview(feedbackTextView!)
        feedbackTextView?.layer.borderWidth = kSplitLineHeight
        feedbackTextView?.layer.borderColor = UIColor.globalBorderNormalColor().cgColor
        feedbackTextView?.layer.cornerRadius = kCornerRadius
        feedbackTextView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(kMargin * kWidthRatio)
            make.top.equalTo(self).offset(19.0 * kHeightRatio)
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
            make.height.equalTo(160.0 * kHeightRatio)
        })
        feedbackTextView?.backgroundColor = UIColor.white
        feedbackTextView?.textColor = UIColor.globalHeadlineColor()
        feedbackTextView?.font = UIFont.globalFootMenuTextFont()
        feedbackTextView?.textAlignment = .left
        feedbackTextView?.textContainerInset = UIEdgeInsetsMake(kFieldSpacing * kHeightRatio, 8.0 * kWidthRatio, kFieldSpacing * kHeightRatio, 8.0 * kWidthRatio)
        feedbackTextView?.delegate = self
        
        placeHolderLabel = UILabel.init()
        feedbackTextView?.addSubview(placeHolderLabel!)
        placeHolderLabel?.snp.makeConstraints { (make) in
            make.left.equalTo(feedbackTextView!).offset(13.0 * kWidthRatio)
            make.top.equalTo(feedbackTextView!).offset(kMargin * kHeightRatio)
            make.height.equalTo(11.0 * kHeightRatio)
        }
        placeHolderLabel?.text = String.init("请您留下宝贵的意见，我们将努力改进")
        placeHolderLabel?.isHidden = false
        placeHolderLabel?.textAlignment = .left
        placeHolderLabel?.font = UIFont.globalFootMenuTextFont()
        placeHolderLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        
        
//        countLabel = UILabel.init()
//        feedbackTextView?.addSubview(countLabel!)
//        countLabel?.snp.makeConstraints { (make) in
//            make.right.equalTo(feedbackTextView!).offset(-15.0 * kWidthRatio)
//            make.bottom.equalTo(feedbackTextView!).offset(-kMargin * kHeightRatio)
//            make.height.equalTo(11.0 * kHeightRatio)
//        }
//        countLabel?.text = String.init("0/120")
//        countLabel?.isHidden = false
//        countLabel?.textAlignment = .right
//        countLabel?.font = UIFont.globalFootMenuTextFont()
//        countLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        
        countLabel = UILabel.init()
        addSubview(countLabel!)
        countLabel?.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-27.0 * kWidthRatio)
            make.top.equalTo(self).offset(156.0 * kHeightRatio)
            make.height.equalTo(11.0 * kHeightRatio)
        }
        countLabel?.text = String.init("0/120")
        countLabel?.isHidden = false
        countLabel?.textAlignment = .right
        countLabel?.font = UIFont.globalFootMenuTextFont()
        countLabel?.textColor = UIColor.globalBtnTitleDisabledColor()
        
        submitBtn = WYCallCarButton.init()
        addSubview(submitBtn!)
        submitBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(26.0 * kWidthRatio)
            make.top.equalTo(feedbackTextView!.snp.bottom).offset(30.0 * kHeightRatio)
            make.right.equalTo(self).offset(-26.0 * kHeightRatio)
            make.height.equalTo(kFootBtnHeight * kHeightRatio)
        })
        submitBtn?.setTitle(String.init("提交"), for: UIControlState())
    }
    
    
    // MARK: - UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.characters.count == 0 {
            placeHolderLabel?.isHidden = false
        } else {
            placeHolderLabel?.isHidden = true
        }
    }
    

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("shouldChangeTextIn")
        let string = (textView.text! as NSString).replacingCharacters(in: range, with: text)
        if string.length > 120 {
            return false
        }
        countLabel?.text = String.init(string.length).appending(String.init("/120"))
        return true
    }
}
