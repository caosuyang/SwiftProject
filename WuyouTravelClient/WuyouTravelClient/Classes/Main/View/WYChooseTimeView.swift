//
//  WYChooseTimeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/4.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYChooseTimeView: UIView {
    var bottomContentView: UIView?
    var timePicker: UIDatePicker?
    var topToolView: UIView?
    var cancelButton: UIButton?
    var defineButton: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initChooseTimeView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initChooseTimeView() {
        backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
        isUserInteractionEnabled = true
        isHidden = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickChooseTimeBgView(tap:)))
        addGestureRecognizer(tapGesture)
        
        bottomContentView = UIView.init()
        addSubview(bottomContentView!)
        bottomContentView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(240.0 * kHeightRatio)
            make.height.equalTo(240.0 * kHeightRatio)
        })
        bottomContentView?.backgroundColor = UIColor.init(r: 235, g: 235, b: 235)
        
        topToolView = UIView.init()
        bottomContentView?.addSubview(topToolView!)
        topToolView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(bottomContentView!)
            make.height.equalTo(43.0 * kHeightRatio)
        })
        topToolView?.backgroundColor = UIColor.white
        
        cancelButton = UIButton.init()
        topToolView?.addSubview(cancelButton!)
        cancelButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(topToolView!).offset(kMargin * kWidthRatio)
            make.centerY.equalTo(topToolView!)
            make.height.equalTo(15.0  * kHeightRatio)
            make.width.equalTo(37.0 * kWidthRatio)
        })
        cancelButton?.backgroundColor = UIColor.white
        cancelButton?.setTitle(String.init("取消"), for: UIControlState())
        cancelButton?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        cancelButton?.titleLabel?.font = UIFont.globalMainTextFont()
        cancelButton?.titleLabel?.textAlignment = .center
        cancelButton?.addTarget(self, action: #selector(clickCancelBtnEvent(btn:)), for: .touchUpInside)
        
        defineButton = UIButton.init()
        topToolView?.addSubview(defineButton!)
        defineButton?.snp.makeConstraints({ (make) in
            make.right.equalTo(topToolView!).offset(-kMargin * kWidthRatio)
            make.centerY.equalTo(topToolView!)
            make.height.equalTo(15.0  * kHeightRatio)
            make.width.equalTo(37.0 * kWidthRatio)
        })
        defineButton?.backgroundColor = UIColor.white
        defineButton?.setTitle(String.init("确定"), for: UIControlState())
        defineButton?.setTitleColor(UIColor.globalThemeDefaultColor(), for: UIControlState())
        defineButton?.titleLabel?.font = UIFont.globalMainTextFont()
        defineButton?.titleLabel?.textAlignment = .center
        
        timePicker = UIDatePicker.init()
        bottomContentView?.addSubview(timePicker!)
        timePicker?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(bottomContentView!)
            make.top.equalTo(topToolView!.snp.bottom)
        })
        timePicker?.backgroundColor = UIColor.white
    }

    @objc private func clickChooseTimeBgView(tap: UITapGestureRecognizer) {
        print("clickChooseTimeBgView")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.bottomContentView?.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self).offset(240.0 * kHeightRatio)
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
                make.bottom.equalTo(self).offset(240.0 * kHeightRatio)
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }
}
