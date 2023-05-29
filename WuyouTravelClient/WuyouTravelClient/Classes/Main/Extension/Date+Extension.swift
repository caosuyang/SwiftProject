//
//  Date+Extension.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation

extension Date {
    // MARK: - 判断某个时间是否是今年
    func isThisYear() -> Bool {
        let calender = Calendar.current
        // 获得某个时间的年份
        let yearComps = calender.component(Calendar.Component.year, from: self)
        let nowComps = calender.component(Calendar.Component.year, from: Date())
        return yearComps == nowComps
    }
    
    // MARK: - 判断是否是昨天
    func isYesterday() -> Bool {
        var now = Date()
        // 格式：2017-07-13 15:03:00
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        // 取得时间字符串
        let dateStr = fmt.string(from: self)
        // 取得现在时间
        let nowStr = fmt.string(from: now)
        // 取得的时间
        let date = fmt.date(from: dateStr)
        // 现在时间
        now = fmt.date(from: nowStr)!
        let calender = Calendar.current
        let comps = calender.dateComponents([.year, .month, .day], from: date!, to: now)
        return comps.year == 0 && comps.month == 0 && comps.day == 1
    }
    
    // MARK: - 判断是否是今天
    func isToday() -> Bool {
        let now = Date()
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        let dateStr = fmt.string(from: self)
        let nowStr = fmt.string(from: now)
        return dateStr == nowStr
    }
    
    func getThisYear() -> String {
        let currentDate = Date()
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        let dateStr = fmt.string(from: currentDate)
        let dates: [String] = dateStr.components(separatedBy: "-")
        let currentYear = dates[0]
        return currentYear
    }
}
