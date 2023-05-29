//
//  UIColor+Extension.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation


extension UIColor {
    
    // MARK: - 便利初始化方法
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    // bg
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 248, b: 248)
    }
    
    // rgba
    func rgbaColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    // 主题默认
    class func globalThemeDefaultColor() -> UIColor {
        return UIColor(r: 47, g: 123, b: 246)
    }
    
    // 主题高亮
    class func globalThemeHighlightedColor() -> UIColor {
        return UIColor(r: 42, g: 110, b: 221)
    }
    
    // 主题禁用
    class func globalThemeDisabledColor() -> UIColor {
        return UIColor(r: 204, g: 204, b: 204)
    }
    
    // 白色按钮点击高亮
    class func globalBtnHighlightedColor() -> UIColor {
        return UIColor(r: 248, g: 248, b: 248)
    }
    
    // 按钮文字默认
    class func globalBtnTitleDefaultColor() -> UIColor {
        return UIColor(r: 255, g: 255, b: 255)
    }
    
    // 按钮文字高亮
    class func globalBtnTitleHighlightedColor() -> UIColor {
        return UIColor(r: 224, g: 224, b: 224)
    }
    
    // 按钮文字禁用
    class func globalBtnTitleDisabledColor() -> UIColor {
        return UIColor(r: 153, g: 153, b: 153)
    }
    
    // 输入栏占位文字
    class func globalPlaceholderColor() -> UIColor {
        return UIColor(r: 204, g: 204, b: 204)
    }
    
    // 分割线
    class func globalSplitLineColor() -> UIColor {
        return UIColor(r: 222, g: 223, b: 224)
    }
    
    // 边界线 Normal
    class func globalBorderNormalColor() -> UIColor {
        return UIColor(r: 219, g: 219, b: 219)
    }
    
    // 边界线 Selected
    class func globalBorderSelectedColor() -> UIColor {
        return UIColor(r: 239, g: 78, b: 78)
    }
    
    // 投影
    class func globalShadowColor() -> UIColor {
        return UIColor(r: 14, g: 5, b: 10)
    }
    
    // 标题文字
    class func globalHeadlineColor() -> UIColor {
        return UIColor(r: 34, g: 34, b: 34)
    }
    
    // 正文文字，常规信息文字
    class func globalMainBodyColor() -> UIColor {
        return UIColor(r: 102, g: 102, b: 102)
    }
    
    // 辅助文字，提示性信息
    class func globalSupTextColor() -> UIColor {
        return UIColor(r: 179, g: 179, b: 179)
    }
    
    // 提示性文字
    class func globalInfoTextColor() -> UIColor {
        return UIColor(r: 140, g: 140, b: 140)
    }
    
    // random
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    // MARK: - Get rgb
    func getRGB() -> (CGFloat, CGFloat, CGFloat) {
        guard let cmps = cgColor.components else {
            fatalError("rgb color")
        }
        return (cmps[0] * 255, cmps[1] * 255, cmps[2] * 255)
    }
    
    class func getRGBDelta(_ firstColor: UIColor, _ secondColor: UIColor) -> (CGFloat, CGFloat, CGFloat) {
        let firstRGB = firstColor.getRGB()
        let secondRGB = secondColor.getRGB()
        return (firstRGB.0 - secondRGB.0, firstRGB.1 - secondRGB.1, firstRGB.2 - secondRGB.2)
    }
}

