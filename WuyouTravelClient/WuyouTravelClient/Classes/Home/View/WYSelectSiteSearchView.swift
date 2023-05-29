//
//  WYSelectSiteSearchView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYSelectSiteSearchView: UIView {
    
    var cityLocationView: WYCityLocationView?
    var inputSiteTextField: UITextField?
    var cancelButton: UIButton?
    var splitLineView: UIView?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSelectSiteSearchView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initSelectSiteSearchView() {
        backgroundColor = UIColor.white
        
        cityLocationView = WYCityLocationView.init()
        addSubview(cityLocationView!)
        cityLocationView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self)
            make.top.equalTo(self).offset(kMargin * kHeightRatio)
            make.height.equalTo(28.0 * kHeightRatio)
        })
        
        cancelButton = UIButton.init()
        addSubview(cancelButton!)
        cancelButton?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-kMargin * kWidthRatio)
            make.centerY.equalTo(cityLocationView!)
            make.height.equalTo(cityLocationView!)
            make.width.equalTo(41.0 * kWidthRatio)
        })
        cancelButton?.backgroundColor = UIColor.white
        cancelButton?.setTitle(String.init("取消"), for: UIControlState())
        cancelButton?.setTitleColor(UIColor.globalBtnTitleDisabledColor(), for: .normal)
        cancelButton?.setTitleColor(UIColor.globalSupTextColor(), for: .highlighted)
        cancelButton?.titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 14.0 * kHeightRatio)
        
        inputSiteTextField = UITextField.init()
        addSubview(inputSiteTextField!)
        inputSiteTextField?.snp.makeConstraints({ (make) in
            make.left.equalTo(cityLocationView!.snp.right).offset(6.0 * kWidthRatio)
            make.right.equalTo(cancelButton!.snp.left).offset(-6.0 * kWidthRatio)
            make.centerY.equalTo(cityLocationView!)
            make.height.equalTo(cityLocationView!)
        })
        inputSiteTextField?.backgroundColor = UIColor.white
        inputSiteTextField?.borderStyle = .none
        inputSiteTextField?.clearButtonMode = .whileEditing
        inputSiteTextField?.keyboardType = .default
        inputSiteTextField?.returnKeyType = .search
        inputSiteTextField?.font = UIFont.globalMainTextFont()
        inputSiteTextField?.textColor = UIColor.black
        inputSiteTextField?.attributedPlaceholder = NSAttributedString.init(string:"请输入地址", attributes: [NSAttributedStringKey.font:UIFont.globalMainTextFont() ?? UIFont.systemFont(ofSize: 14.0  * kHeightRatio)])
        inputSiteTextField?.attributedPlaceholder = NSAttributedString.init(string:"请输入地址", attributes: [  NSAttributedStringKey.foregroundColor:UIColor.globalBtnTitleDisabledColor()])
        
        splitLineView = UIView.init()
        addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(kBorderWidth)
        })
        splitLineView?.backgroundColor = UIColor.globalSplitLineColor()
        
    }
    
    

}
