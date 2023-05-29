//
//  UIImage+Extension.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation

extension UIImage {
    
    // MARK: - GetImageWithColor
    class func getImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
