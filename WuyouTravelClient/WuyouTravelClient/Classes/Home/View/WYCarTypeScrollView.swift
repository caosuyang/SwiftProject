//
//  WYCarTypeScrollView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/21.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYCarTypeScrollView: UIScrollView {
    
    var officialBtn: WYCarTypeButton?
    var businessBtn: WYCarTypeButton?
    var luxuryBtn: WYCarTypeButton?
    var bottomLineView: UIView?
    var splitLineView_bottom: UIView?
    var splitLineView_top: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCarTypeScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCarTypeScrollView() {
        backgroundColor = UIColor.white
        isScrollEnabled = false
        
        officialBtn = WYCarTypeButton.init()
        addSubview(officialBtn!)
        officialBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(35.0 * kWidthRatio)
            make.top.bottom.equalTo(self)
            make.width.equalTo(58.0 * kWidthRatio)
            make.height.equalTo(self)
        })
        officialBtn?.imgView?.image = UIImage.init(named: "car_official_img_sel_40x12_")
        officialBtn?.textLabel?.text = String.init("公务轿车")
        officialBtn?.textLabel?.textColor = UIColor.globalThemeDefaultColor()
        
        businessBtn = WYCarTypeButton.init()
        addSubview(businessBtn!)
        businessBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(officialBtn!.snp.right).offset(54.0 * kWidthRatio)
            make.top.bottom.equalTo(self)
            make.width.height.equalTo(officialBtn!)
        })
        businessBtn?.imgView?.image = UIImage.init(named: "car_business_img_nor_40x13_")
        businessBtn?.textLabel?.text = String.init("商务七座")
        businessBtn?.textLabel?.textColor = UIColor(r: 173, g: 173, b: 173)
        
        luxuryBtn = WYCarTypeButton.init()
        addSubview(luxuryBtn!)
        luxuryBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(businessBtn!.snp.right).offset(54.0 * kWidthRatio)
            make.top.bottom.equalTo(self)
            make.width.height.equalTo(businessBtn!)
            make.right.equalTo(self).offset(-35.0 * kWidthRatio)
        })
        luxuryBtn?.imgView?.image = UIImage.init(named: "car_luxury_img_nor_40x13_")
        luxuryBtn?.textLabel?.text = String.init("豪华轿车")
        luxuryBtn?.textLabel?.textColor = UIColor(r: 173, g: 173, b: 173)
        
        splitLineView_top = UIView.init()
        addSubview(splitLineView_top!)
        splitLineView_top?.snp.makeConstraints({ (make) in
            make.left.right.top.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView_top?.backgroundColor = UIColor.globalBtnHighlightedColor()
        splitLineView_top?.alpha = 0.0
        
        splitLineView_bottom = UIView.init()
        addSubview(splitLineView_bottom!)
        splitLineView_bottom?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView_bottom?.backgroundColor = UIColor.globalBtnHighlightedColor()
        
        
        bottomLineView = UIView.init()
        splitLineView_bottom?.addSubview(bottomLineView!)
        bottomLineView?.snp.makeConstraints({ (make) in
            make.left.equalTo(splitLineView_bottom!).offset(42.0 * kWidthRatio)
            make.bottom.equalTo(splitLineView_bottom!)
            make.height.equalTo(splitLineView_bottom!)
            make.width.equalTo(officialBtn!)
        })
        bottomLineView?.backgroundColor = UIColor.globalThemeDefaultColor()

    }


}
