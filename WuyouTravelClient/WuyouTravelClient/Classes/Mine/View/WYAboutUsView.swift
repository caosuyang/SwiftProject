//
//  WYAboutUsView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/9/3.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYAboutUsView: UIView {

    var logoImgView: UIImageView?
    var versionLabel: UILabel?
    var contentLabel: UILabel?
    var copyrightLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initAboutUsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initAboutUsView() {
        backgroundColor = UIColor.white
        
        logoImgView = UIImageView()
        addSubview(logoImgView!)
        logoImgView?.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(61.0 * kHeightRatio)
            make.width.equalTo(101.0 * kHeightRatio)
            make.height.equalTo(127.0 * kHeightRatio)
        }
        logoImgView?.backgroundColor = UIColor.white
        logoImgView?.image = UIImage.init(named: "mine_about_logo_img_101x127_")
        
        versionLabel = UILabel.init()
        addSubview(versionLabel!)
        versionLabel?.snp.makeConstraints { (make) in
            make.left.equalTo(logoImgView!.snp.right).offset(6.0 * kWidthRatio)
            make.bottom.equalTo(logoImgView!).offset(-28.0 * kHeightRatio)
            make.height.equalTo(9.0 * kHeightRatio)
        }
        versionLabel?.backgroundColor = UIColor.white
//        versionLabel?.text = String.init("V")?.appending(versionCode)
        versionLabel?.text = String.init("V").appending(versionCode)
        versionLabel?.textAlignment = .center
        versionLabel?.textColor = UIColor.globalMainBodyColor()
        versionLabel?.font = UIFont.globalFootMenuTextFont()
        
        contentLabel = UILabel.init()
        addSubview(contentLabel!)
        contentLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(27.0 * kWidthRatio)
            make.right.equalTo(self).offset(-27.0 * kWidthRatio)
            make.top.equalTo(logoImgView!.snp.bottom).offset(48.0 * kHeightRatio)
        })
        contentLabel?.backgroundColor = UIColor.white
        contentLabel?.text = String.init("无忧出行是由无忧推出的高品质专车服务APP。无忧是国内唯一一家专业化服务于各大机构的汽车领域服务商，公司秉承品牌化的专业服务理念，为各机构提供温馨、可靠、优质、高效的服务。")
        contentLabel?.numberOfLines = kNumberOfLines
        contentLabel?.textColor = UIColor.globalMainBodyColor()
        contentLabel?.font = UIFont.globalMainTextFont()

        
        copyrightLabel = UILabel.init()
        addSubview(copyrightLabel!)
        copyrightLabel?.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-27.0 * kHeightRatio)
            make.height.equalTo(11.0 * kHeightRatio)
        }
        let currentDate = Date()
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        let dateStr = fmt.string(from: currentDate)
        let dates: [String] = dateStr.components(separatedBy: "-")
        let currentYear = dates[0]
        copyrightLabel?.backgroundColor = UIColor.white
//        copyrightLabel?.text = String.init("Copyright")?.appending(currentYear).appending("无忧出行")
        copyrightLabel?.text = String.init("Copyright").appending(currentYear).appending("无忧出行")
        copyrightLabel?.textAlignment = .center
        copyrightLabel?.textColor = UIColor.globalMainBodyColor()
        copyrightLabel?.font = UIFont.globalFootMenuTextFont()
    }
}
