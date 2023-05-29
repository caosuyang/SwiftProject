//
//  UIFont+Extension.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation

extension UIFont {
    // regular 苹方-简 常规体
    class func regularSystemFontOfSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "PingFangSC-Regular", size: size)
    }
    
    // italic 苹方-简 斜体
    class func italicSystemFontOfSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "PingFangSC-Italic", size: size)
    }
    
    // semiBold 苹方-简 中粗体
    class func semiBoldSystemFontOfSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "PingFangSC-Semibold", size: size)
    }
    
    // medium 苹方-简 中黑体
    class func mediumSystemFontOfSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "PingFangSC-Medium", size: size)
    }
    
    // light 苹方-简 细体
    class func lightSystemFontOfSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "PingFangSC-Light", size: size)
    }
    
    // thin 苹方-简 纤细体
    class func thinSystemFontOfSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "PingFangSC-Thin", size: size)
    }
    
    // ultraLight 苹方-简 极细体
    class func ultraLightSystemFontOfSize(size: CGFloat) -> UIFont? {
        return UIFont(name: "PingFangSC-Ultralight", size: size)
    }
    
    // 顶部导航栏_栏目名称，功能按钮字号
    class func globalNavHeadlineFont() -> UIFont? {
        return UIFont.regularSystemFontOfSize(size: 18.0 * kHeightRatio)
    }
    
    // 标题_加粗, 按钮, 滚动条
    class func globalTitleBoldFont() -> UIFont? {
        return UIFont.semiBoldSystemFontOfSize(size: 16.0 * kHeightRatio)
    }
    
    // 标题_常规, 按钮, 滚动条
    class func globalTitleRegularFont() -> UIFont? {
        return UIFont.regularSystemFontOfSize(size: 16.0 * kHeightRatio)
    }
    
    // 主要文字，正文内容，叙述行文字字号
    class func globalMainTextFont() -> UIFont? {
        return UIFont.regularSystemFontOfSize(size: 14.0 * kHeightRatio)
    }
    
    // 辅助文字，标注文字，辅助性提示信息字号
    class func globalSupTextFont() -> UIFont? {
        return UIFont.regularSystemFontOfSize(size: 12.0 * kHeightRatio)
    }
    
    // 次要文字_底部菜单文字
    class func globalFootMenuTextFont() -> UIFont? {
        return UIFont.regularSystemFontOfSize(size: 11.0 * kHeightRatio)
    }
    
    // 提示文字
    class func globalTipTextFont() -> UIFont? {
        return UIFont.regularSystemFontOfSize(size: 9.0 * kHeightRatio)
    }
}
