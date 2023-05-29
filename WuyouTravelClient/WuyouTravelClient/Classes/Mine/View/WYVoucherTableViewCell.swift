//
//  WYVoucherTableViewCell.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/30.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYVoucherTableViewCell: UITableViewCell {
    
    var bgImgView: UIImageView?
    var contentView_left: UIView?
    var contentView_right: UIView?
    var priceFigureLabel: UILabel?
    var priceConditionLabel: UILabel?
    var voucherTypeLabel: UILabel?
    var validDateLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.origin.x += 37.0 * kWidthRatio
            newFrame.size.width -= newFrame.origin.x * 2
            newFrame.origin.y += 15.0 * kHeightRatio
            newFrame.size.height -= 15.0 * kHeightRatio
            super.frame = newFrame
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initVoucherTableViewCell()
        initShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initVoucherTableViewCell() {
        backgroundColor = UIColor.globalBackgroundColor()
        
        bgImgView = UIImageView.init()
        addSubview(bgImgView!)
        bgImgView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self)
        })
        bgImgView?.backgroundColor = UIColor.globalBackgroundColor()
        bgImgView?.image = UIImage.init(named: "voucher_valid_img_302x104_")
        
        
        contentView_left = UIView.init()
        bgImgView?.addSubview(contentView_left!)
        contentView_left?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(bgImgView!)
            make.width.equalTo(100.0 * kWidthRatio)
        })
        contentView_left?.backgroundColor = UIColor.clear
        
        priceFigureLabel = UILabel.init()
        contentView_left?.addSubview(priceFigureLabel!)
        priceFigureLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(contentView_left!)
            make.top.equalTo(contentView_left!).offset(37.0 * kHeightRatio)
            make.height.equalTo(19.0 * kHeightRatio)
        })
        priceFigureLabel?.text = String.init("¥ XXX")
        priceFigureLabel?.textAlignment = .center
        priceFigureLabel?.textColor = UIColor.globalBtnTitleDefaultColor()
        priceFigureLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 25.0 * kHeightRatio)
        
        priceConditionLabel = UILabel.init()
        contentView_left?.addSubview(priceConditionLabel!)
        priceConditionLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(contentView_left!)
            make.top.equalTo(contentView_left!.snp.bottom).offset(14.0 * kHeightRatio)
            make.height.equalTo(11.0 * kHeightRatio)
            make.bottom.equalTo(contentView_left!).offset(-25.0 * kHeightRatio)
        })
        priceConditionLabel?.text = String.init("满XXX元可用")
        priceConditionLabel?.textAlignment = .center
        priceConditionLabel?.textColor = UIColor.globalBtnTitleDefaultColor()
        priceConditionLabel?.font = UIFont.globalFootMenuTextFont()

        
        
        contentView_right = UIView.init()
        bgImgView?.addSubview(contentView_right!)
        contentView_right?.snp.makeConstraints({ (make) in
            make.right.top.bottom.equalTo(bgImgView!)
            make.left.equalTo(contentView_left!.snp.right)
        })
        contentView_right?.backgroundColor = UIColor.clear
        
        
        voucherTypeLabel = UILabel.init()
        contentView_right?.addSubview(voucherTypeLabel!)
        voucherTypeLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(contentView_right!).offset(26.0 * kWidthRatio)
            make.top.equalTo(contentView_right!).offset(32.0 * kHeightRatio)
            make.height.equalTo(15.0 * kHeightRatio)
        })
        voucherTypeLabel?.text = String.init("专车优惠券")
        voucherTypeLabel?.textColor = UIColor.globalHeadlineColor()
        voucherTypeLabel?.font = UIFont.globalTitleBoldFont()
        
        validDateLabel = UILabel.init()
        contentView_right?.addSubview(validDateLabel!)
        validDateLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(voucherTypeLabel!)
            make.top.equalTo(voucherTypeLabel!.snp.bottom).offset(13.0 * kHeightRatio)
            make.height.equalTo(10.0 * kHeightRatio)
            make.bottom.equalTo(contentView_right!).offset(-34.0 * kHeightRatio)
            make.right.equalTo(contentView_right!).offset(-26.0 * kWidthRatio)
        })
        validDateLabel?.text = String.init("XXXX.XX.XX-XXXX.XX.XX有效")
        validDateLabel?.textColor = UIColor.globalMainBodyColor()
        validDateLabel?.font = UIFont.globalFootMenuTextFont()
        
    }

    private func initShadow() {
        layer.shadowColor = UIColor.init(r: 249, g: 248, b: 248).cgColor
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 2.25
        layer.shadowOffset = CGSize(width: 4.5, height: 4.5)
    }
}
