//
//  String+Extension.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation

extension String {
    subscript (range: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            return String(self[Range(startIndex..<endIndex)])
        }
        
        set {
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
            let strRange = Range(startIndex..<endIndex)
            self.replaceSubrange(strRange, with: newValue)
        }
    }
}

extension NSString {
    // MARK: - 计算文本高度
    func getTextHeight(width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
        return (self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], context: nil).size.height)
    }
    
    func getTextWidth(height: CGFloat) -> CGFloat {
        let size = CGSize(width: CGFloat(MAXFLOAT), height: height)
        return (self.boundingRect(with: size, options: .usesFontLeading, attributes: [NSAttributedStringKey.fontNSAttributedStringKey.font: UIFont.globalTitleBoldFont() ?? UIFont.boldSystemFont(ofSize: 16)], context: nil).size.width)
    }
}
