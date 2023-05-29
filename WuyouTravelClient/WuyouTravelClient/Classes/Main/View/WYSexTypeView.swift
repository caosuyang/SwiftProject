//
//  WYSexTypeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/4.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYSexTypeView: UIView {

    var bottomContentView: UIView?
    var manButton: UIButton?
    var womanButton: UIButton?
    var cancelButton: UIButton?
    var splitLineView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSexTypeView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSexTypeView() {
        backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
        isUserInteractionEnabled = true
        isHidden = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickChooseTimeBgView(tap:)))
        addGestureRecognizer(tapGesture)
        
        bottomContentView = UIView.init()
        addSubview(bottomContentView!)
        bottomContentView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self).offset(160.0 * kHeightRatio)
            make.height.equalTo(160.0 * kHeightRatio)
        })
        bottomContentView?.backgroundColor = UIColor.init(r: 235, g: 235, b: 235)
        
        
        manButton = UIButton.init()
        bottomContentView?.addSubview(manButton!)
        manButton?.snp.makeConstraints({ (make) in
            make.left.right.top.equalTo(bottomContentView!)
            make.height.equalTo(50.0 * kHeightRatio)
        })
        manButton?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .normal)
        manButton?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnHighlightedColor()), for: .highlighted)
        manButton?.setTitle(String.init("男"), for: UIControlState())
        manButton?.titleLabel?.textAlignment = .center
        manButton?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        manButton?.titleLabel?.font = UIFont.globalMainTextFont()
        manButton?.addTarget(self, action: #selector(clickManBtnEvent(btn:)), for: .touchUpInside)
        
        splitLineView = UIView.init()
        bottomContentView?.addSubview(splitLineView!)
        splitLineView?.snp.makeConstraints({ (make) in
            make.left.equalTo(manButton!).offset(kMargin * kWidthRatio)
            make.right.equalTo(manButton!).offset(-kMargin * kWidthRatio)
            make.bottom.equalTo(manButton!)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView?.backgroundColor = UIColor.globalSplitLineColor()
        
        womanButton = UIButton.init()
        bottomContentView?.addSubview(womanButton!)
        womanButton?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(bottomContentView!)
            make.top.equalTo(manButton!.snp.bottom)
            make.height.equalTo(50.0 * kHeightRatio)
        })
        womanButton?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .normal)
        womanButton?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnHighlightedColor()), for: .highlighted)
        womanButton?.setTitle(String.init("女"), for: UIControlState())
        womanButton?.titleLabel?.textAlignment = .center
        womanButton?.setTitleColor(UIColor.globalThemeDefaultColor(), for: UIControlState())
        womanButton?.titleLabel?.font = UIFont.globalMainTextFont()
        womanButton?.addTarget(self, action: #selector(clickWomanBtnEvent(btn:)), for: .touchUpInside)
        
        cancelButton = UIButton.init()
        bottomContentView?.addSubview(cancelButton!)
        cancelButton?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(bottomContentView!)
            make.height.equalTo(50.0 * kHeightRatio)
        })
        cancelButton?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .normal)
        cancelButton?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnHighlightedColor()), for: .highlighted)
        cancelButton?.setTitle(String.init("取消"), for: UIControlState())
        cancelButton?.titleLabel?.textAlignment = .center
        cancelButton?.setTitleColor(UIColor.globalMainBodyColor(), for: UIControlState())
        cancelButton?.titleLabel?.font = UIFont.globalTitleRegularFont()
        cancelButton?.addTarget(self, action: #selector(clickCancelBtnEvent(btn:)), for: .touchUpInside)
        
    }
    
    @objc private func clickChooseTimeBgView(tap: UITapGestureRecognizer) {
        print("clickChooseTimeBgView")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self).offset(160.0 * kHeightRatio)
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }
    
    @objc private func clickCancelBtnEvent(btn: UIButton) {
        print("clickCancelBtnEvent")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self).offset(160.0 * kHeightRatio)
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }
    
    @objc private func clickManBtnEvent(btn: UIButton) {
        print("clickManBtnEvent")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self).offset(160.0 * kHeightRatio)
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }
    
    @objc private func clickWomanBtnEvent(btn: UIButton) {
        print("clickWomanBtnEvent")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self).offset(160.0 * kHeightRatio)
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }

}
