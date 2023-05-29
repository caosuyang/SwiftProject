//
//  WYTimeView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/25.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYTimeView: UIView {

    var bottomView: UIView?
    var toolBarView: UIView?
    var cancelBtn: UIButton?
    var defineBtn: UIButton?
    var pickerView: UIPickerView?
    var dateFormatter: DateFormatter?
    var dateArray: NSMutableArray?
    var timeArray: NSMutableArray?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initBottomView()
        initToobarView()
        initTimePickerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initBottomView() {
        backgroundColor = UIColor(r: 0, g: 0, b: 0, alpha: kAlpha)
        isHidden = true
        bottomView = UIView.init()
        addSubview(bottomView!)
        bottomView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self).offset(240.0 * kHeightRatio)
            make.height.equalTo(240.0 * kHeightRatio)
        })
        bottomView?.backgroundColor = UIColor.white
    }
    
    private func initToobarView() {
        toolBarView = UIView.init()
        bottomView?.addSubview(toolBarView!)
        toolBarView?.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(bottomView!)
            make.height.equalTo(43.0 * kHeightRatio)
        })
        toolBarView?.backgroundColor = UIColor.white
        
        cancelBtn = UIButton.init()
        toolBarView?.addSubview(cancelBtn!)
        cancelBtn?.snp.makeConstraints({ (make) in
            make.left.equalTo(toolBarView!).offset(kMargin * kWidthRatio)
            make.centerY.equalTo(toolBarView!)
            make.height.equalTo(15.0  * kHeightRatio)
            make.width.equalTo(37.0 * kWidthRatio)
        })
        cancelBtn?.backgroundColor = UIColor.white
        cancelBtn?.setTitle(String.init("取消"), for: UIControlState())
        cancelBtn?.setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        cancelBtn?.titleLabel?.font = UIFont.globalMainTextFont()
        cancelBtn?.titleLabel?.textAlignment = .center
        
        defineBtn = UIButton.init()
        toolBarView?.addSubview(defineBtn!)
        defineBtn?.snp.makeConstraints({ (make) in
            make.right.equalTo(toolBarView!).offset(-kMargin * kWidthRatio)
            make.centerY.equalTo(toolBarView!)
            make.height.equalTo(15.0  * kHeightRatio)
            make.width.equalTo(37.0 * kWidthRatio)
        })
        defineBtn?.backgroundColor = UIColor.white
        defineBtn?.setTitle(String.init("确定"), for: UIControlState())
        defineBtn?.setTitleColor(UIColor.globalThemeDefaultColor(), for: UIControlState())
        defineBtn?.titleLabel?.font = UIFont.globalMainTextFont()
        defineBtn?.titleLabel?.textAlignment = .center
        
    }
    
    private func initTimePickerView() {
        pickerView = UIPickerView.init()
        bottomView?.addSubview(pickerView!)
        pickerView?.snp.makeConstraints({ (make) in
            make.left.bottom.right.equalTo(bottomView!)
            make.top.equalTo(toolBarView!.snp.bottom)
        })
        pickerView?.backgroundColor = UIColor.white
        pickerView?.showsSelectionIndicator = true
        
        // date
        dateFormatter = DateFormatter.init()
        dateFormatter?.dateFormat = String.init("MM月dd日")
        let today = String.init(dateFormatter!.string(from: Date.init())).appending(String.init(" 今天"))
        let tomorrow = String.init(dateFormatter!.string(from: Date.init(timeIntervalSinceNow: kDayInterval))).appending(String.init(" 明天"))
        let bermorgen = String.init(dateFormatter!.string(from: Date.init(timeIntervalSinceNow: kDayInterval * 2))).appending(String.init(" 后天"))
        print(today, tomorrow, bermorgen)
        dateArray = NSMutableArray.init()
        dateArray?.addObjects(from: [today, tomorrow, bermorgen])
        print(dateArray!)
        
        // time
        
    }

}
