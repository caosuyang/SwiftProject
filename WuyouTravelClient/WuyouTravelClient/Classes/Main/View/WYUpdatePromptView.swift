//
//  WYUpdatePromptView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/4.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYUpdatePromptView: UIView {

    var contentView: UIView?
    var loadImgView: UIImageView?
    var titleLabel: UILabel?
    var bodayLabel: UILabel?
    var ignoreBtn: UIButton?
    var upgradeBtn: UIButton?
    var splitLineView_horizontal: UIView?
    var splitLineView_vertical: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUpdatePromptView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initUpdatePromptView() {
        backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
        isUserInteractionEnabled = true
        isHidden = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickChooseTimeBgView(tap:)))
        addGestureRecognizer(tapGesture)
        
        contentView = UIView.init()
        addSubview(contentView!)
//        contentView?.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(kCornerRadius))
        contentView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(-211.0 * kHeightRatio)
            make.width.equalTo(285.0 * kWidthRatio)
            make.height.equalTo(211.0 * kHeightRatio)
        })
        contentView?.backgroundColor = UIColor.white
        contentView?.alpha = 0.0
        
        loadImgView = UIImageView.init()
        contentView?.addSubview(loadImgView!)
        loadImgView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(contentView!)
            make.centerY.equalTo(contentView!.snp.top)
            make.width.height.equalTo(80.0 * kHeightRatio)
        })
        loadImgView?.image = UIImage.init(named: "mine_update_img_80x80_")
        loadImgView?.layer.shadowColor = UIColor.globalThemeDefaultColor().cgColor
        loadImgView?.layer.shadowOpacity = 0.24
        loadImgView?.layer.shadowRadius = 10.75
        loadImgView?.layer.shadowOffset = CGSize(width: 4.5, height: 4.5)
        
        titleLabel = UILabel.init()
        contentView?.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(contentView!)
            make.top.equalTo(loadImgView!.snp.bottom).offset(26.0 * kHeightRatio)
            make.height.equalTo(15.0 * kHeightRatio)
        })
        titleLabel?.backgroundColor = UIColor.white
        titleLabel?.text = String.init("更新提示")
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor.globalHeadlineColor()
        titleLabel?.font = UIFont.globalTitleBoldFont()
        
        bodayLabel = UILabel.init()
        contentView?.addSubview(bodayLabel!)
        bodayLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView!).offset(25.0 * kWidthRatio)
            make.right.equalTo(contentView!).offset(-25.0 * kWidthRatio)
            make.top.equalTo(titleLabel!.snp.bottom).offset(23.0 * kHeightRatio)
        })
        bodayLabel?.backgroundColor = UIColor.white
        bodayLabel?.text = String.init("1.修补了某某BUG，完善用户体验 \n2.新加充值功能，个人帐户优化")
        bodayLabel?.numberOfLines = kNumberOfLines
        bodayLabel?.textColor = UIColor.black
        bodayLabel?.font = UIFont.globalMainTextFont()
        
        ignoreBtn = UIButton.init()
        contentView?.addSubview(ignoreBtn!)
        ignoreBtn?.clipsToBounds = true
//        ignoreBtn?.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(kCornerRadius))
        ignoreBtn?.snp.makeConstraints({ (make) in
            make.left.bottom.equalTo(contentView!)
            make.height.equalTo(47.0 * kHeightRatio)
            make.width.equalTo(contentView!).dividedBy(2)
        })
        ignoreBtn?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .normal)
        ignoreBtn?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnHighlightedColor()), for: .highlighted)
        ignoreBtn?.setTitle(String.init("忽略"), for: UIControlState())
        ignoreBtn?.setTitleColor(UIColor.globalMainBodyColor(), for: UIControlState())
        ignoreBtn?.titleLabel?.textAlignment = .center
        ignoreBtn?.titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 14.0 * kHeightRatio)
        ignoreBtn?.addTarget(self, action: #selector(clickIgnoreBtnEvent(btn:)), for: .touchUpInside)
        
        upgradeBtn = UIButton.init()
        contentView?.addSubview(upgradeBtn!)
        upgradeBtn?.clipsToBounds = true
//        upgradeBtn?.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(kCornerRadius))
        upgradeBtn?.snp.makeConstraints({ (make) in
            make.right.bottom.equalTo(contentView!)
            make.height.equalTo(ignoreBtn!)
            make.width.equalTo(contentView!).dividedBy(2)
        })
        upgradeBtn?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .normal)
        upgradeBtn?.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.globalBtnHighlightedColor()), for: .highlighted)
        upgradeBtn?.setTitle(String.init("升级"), for: UIControlState())
        upgradeBtn?.setTitleColor(UIColor.globalThemeDefaultColor(), for: .normal)
        upgradeBtn?.setTitleColor(UIColor.globalThemeHighlightedColor(), for: .highlighted)
        upgradeBtn?.titleLabel?.textAlignment = .center
        upgradeBtn?.titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 14.0 * kHeightRatio)
        upgradeBtn?.addTarget(self, action: #selector(clickUpgradeBtnEvent(btn:)), for: .touchUpInside)
        
        splitLineView_horizontal = UIView.init()
        contentView?.addSubview(splitLineView_horizontal!)
        splitLineView_horizontal?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(contentView!)
            make.bottom.equalTo(ignoreBtn!.snp.top)
            make.height.equalTo(kSplitLineHeight)
        })
        splitLineView_horizontal?.backgroundColor = UIColor.globalSplitLineColor()
        
        splitLineView_vertical = UIView.init()
        ignoreBtn?.addSubview(splitLineView_vertical!)
        splitLineView_vertical?.snp.makeConstraints({ (make) in
            make.top.right.bottom.equalTo(ignoreBtn!)
            make.width.equalTo(kSplitLineHeight)
        })
        splitLineView_vertical?.backgroundColor = UIColor.globalSplitLineColor()
    }
    
    @objc private func clickIgnoreBtnEvent(btn: UIButton) {
        print("clickIgnoreBtnEvent")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.contentView?.snp.updateConstraints({ (make) in
                make.top.equalTo(self).offset(-211.0 * kHeightRatio)
                self.contentView?.alpha = 0.0
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }
    
    @objc private func clickUpgradeBtnEvent(btn: UIButton) {
        print("clickUpgradeBtnEvent")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.contentView?.snp.updateConstraints({ (make) in
                make.top.equalTo(self).offset(-211.0 * kHeightRatio)
                self.contentView?.alpha = 0.0
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }
    
    @objc private func clickChooseTimeBgView(tap: UITapGestureRecognizer) {
        print("clickChooseTimeBgView")
        UIView.animate(withDuration: kAnimaDuration, delay: kDelayInterval, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 0.0)
            self.contentView?.snp.updateConstraints({ (make) in
                make.top.equalTo(self).offset(-211.0 * kHeightRatio)
                self.contentView?.alpha = 0.0
            })
            self.layoutIfNeeded()
        }) { (true) in
            self.isHidden = true
        }
    }
}
