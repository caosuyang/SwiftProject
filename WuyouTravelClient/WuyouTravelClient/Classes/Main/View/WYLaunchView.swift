//
//  WYLaunchView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/16.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYLaunchView: UIView {

    var launchImgView: UIImageView!
    var launchFooterView: UIView!
    var launchLogoView: UIImageView!
    var launchTimeBtn: UIButton!
    var launchImgUrl: String!
    var countTimer: Timer!
    var seconds: Int = 3

    override init(frame: CGRect) {
        super.init(frame: frame)
        initLaunchImgView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func removeFromSuperview() {
        UIView.animate(withDuration: kAnimaDuration, animations: { 
            self.alpha = 0.0
        }) { (bool) in
            super.removeFromSuperview()
        }
    }
    
    private func initLaunchImgView() {
        backgroundColor = UIColor.white
        
        launchImgView = UIImageView.init()
        addSubview(launchImgView)
        launchImgView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(546.0 * kHeightRatio)
        }
        launchImgView.backgroundColor = UIColor.white
        launchImgView.image = UIImage.init(named: "launch_advert_img_375x562_")
        launchImgView.isUserInteractionEnabled = true
        
        launchTimeBtn = UIButton.init()
//        launchTimeBtn.cornerRadiusPreset = cornerRadiusPreset(rawValue: Int(25.0 * kHeightRatio / 2))
        launchImgView.addSubview(launchTimeBtn)
        launchTimeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(launchImgView).offset(-10.0 * kWidthRatio)
            make.top.equalTo(launchImgView).offset(24.0 * kHeightRatio)
            make.width.equalTo(76.0 * kWidthRatio)
            make.height.equalTo(25.0 * kHeightRatio)
        }
        launchTimeBtn.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.43)
        launchTimeBtn.setTitle(String.init("跳过3S"), for: UIControlState())
        launchTimeBtn.titleLabel?.textAlignment = .center
        launchTimeBtn.titleLabel?.textColor = UIColor.white
        launchTimeBtn.titleLabel?.font = UIFont.globalMainTextFont()
        launchTimeBtn.addTarget(self, action: #selector(handleLaunchTimeBtnEvent), for: .touchUpInside)
        
        countTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(handleCountdownMethod), userInfo: nil, repeats: true)
        
        launchFooterView = UIView.init()
        addSubview(launchFooterView)
        launchFooterView.snp.makeConstraints { (make) in
            make.right.bottom.left.equalTo(self)
            make.top.equalTo(launchImgView.snp.bottom)
        }
        launchFooterView.backgroundColor = UIColor.white
        
        launchLogoView = UIImageView.init()
        launchFooterView.addSubview(launchLogoView)
        launchLogoView.snp.makeConstraints { (make) in
            make.center.equalTo(launchFooterView)
            make.width.equalTo(158.0 * kWidthRatio)
            make.height.equalTo(50.0 * kHeightRatio)
        }
        launchLogoView.backgroundColor = UIColor.white
        launchLogoView.image = UIImage.init(named: "launch_logo_img_158x50_")
    }
    
    @objc func handleCountdownMethod() {
        print("handleCountdownMethod: " + String(seconds))
        seconds = seconds - 1
        if seconds > 0 {
//            launchTimeBtn.setTitle(String.init("跳过")?.appending(String(seconds)).appending("S"), for: UIControlState())
            launchTimeBtn.setTitle(String.init("跳过").appending(String.init(seconds).appending("S")), for: UIControlState())
        } else {
            countTimer.invalidate()
            countTimer = nil
            removeFromSuperview()
        }
    }
    
    @objc func handleLaunchTimeBtnEvent() {
        print("handleLaunchTimeBtnEvent")
        countTimer.invalidate()
        countTimer = nil
        removeFromSuperview()
    }
    
}
