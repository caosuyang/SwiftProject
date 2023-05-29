//
//  WYBaseConst.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation
import AdSupport

// 代金券类型
enum VoucherType: Int {
    
    case Available = 0 // 可使用
    
    case Used = 1 // 已使用
    
    case Expired = 2 // 已过期
}

// 用车方式
enum UseCarType: Int {
    
    case Now = 0 // 现在
    
    case Reservation = 1 // 预约
    
    case Transfer = 2 // 接送机
    
    case Charter = 3 // 包车
}

// 出行流程
enum TravelFlowType: Int {
    
    case Waiting = 0 // 等待中
    
    case Received = 1 // 已接单
    
    case Traveling = 2 // 行程中
    
    case Completed = 3 // 已完成

}

// 屏幕宽高
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

// 版本号
let versionCode = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String

// 系统版本号
let systemVersion = UIDevice.current.systemVersion

// idfv
let idfv = UIDevice.current.identifierForVendor?.uuidString

// idfa
let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString

// cell id
let kCellId = "cell"

// 状态栏高度
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

// 导航栏高度
let kNavBarHeight: CGFloat = 44.0

// 标签栏高度
let kTabBarHeight: CGFloat = 44.0

// 一级选项栏高度
let kFirCellHeight: CGFloat = 50.0

// 二级选项栏高度
let kSecCellHeight: CGFloat = 60.0

// 三级选项栏高度
let kThiCellHeight: CGFloat = 54.0

// 输入栏高度
let kInputFieldHeight: CGFloat = 45.0

// 按钮宽高
let kItemBtnWH: CGFloat = 30.0

// 页边距
let kMargin: CGFloat = 12.0

// 选项栏间距
let kFieldSpacing: CGFloat = 10.0

// 竖直间距
let kVerticalSpacing: CGFloat = 15.0

// 横向间距
let kHorizontalSpacing: CGFloat = 13.0

// 底部按钮高度
let kFootBtnHeight: CGFloat = 45.0

// 圆角
let kCornerRadius: CGFloat = 3.0

// 边框粗细
let kBorderWidth: CGFloat = 1.0

// 分割线高度
let kSplitLineHeight: CGFloat = 0.5

// 进度条高度
let kProgressHeight: CGFloat = 2.0

// 动画时长
let kAnimaDuration: Double = 0.25

// 倒计时长
let kCountdownDuration: Double = 3.0

// 等待时长
let kDelayInterval: Double = 0.0

// 弹性
let kSpringWithDamping: CGFloat = 0.6

// 初速度
let kSpringVelocity: CGFloat = 0.0

// 投影不透明度
let kShadowOpacity: Float = 0.1

// 投影半径
let kShadowRadius: CGFloat = 4.5

// 投影偏移距离
let kShadowOffset: CGSize = CGSize(width: 5.0, height: 5.0)

// 一天间隔
let kDayInterval: TimeInterval = 24 * 60 * 60

// 透明度
let kAlpha: CGFloat = 0.3

// 行数
let kNumberOfLines: Int = 0

// 时间长度
let kTimeDuration: CFTimeInterval = 1.0

// 重复次数
let kRepeatCount: Float = 1.0

// 线宽
let kLineWidth: CGFloat = 0.2

// 圆角宽度
let kRoundedRectWidth: CGFloat = 2.0

// 最小显示时长
let kMinimumDisplayTime: Int = 1

// 显示时间临界值
let kDisplayTimeThreshold: Int = 0

// 设备机型：true or false
let isIPhoneSE = screenHeight == 568.0 ? true : false
let isIPhone6 = screenHeight == 667.0 ? true : false
let isIPhone6P = screenHeight == 736.0 ? true : false

// 宽度比
let kWidthRatio: CGFloat = screenWidth / 375.0

// 高度比
let kHeightRatio: CGFloat = screenHeight / 667.0

// 讯飞语音appid
let iflyAppId = "58579edb"

// 蚂蚁金服appscheme
let aliAppScheme = "wuyoutravelclient"

// 微信支付appscheme
let wxAppScheme = "wx406d53b4549be699"

// 个推
let kAppId = "kvzmq4UCnK6bFwoAllYN44"
let kAppKey = "JA1R6uDToq5wFUCm1KzOa3"
let kAppSecret = "i8NywyrLzQ7YWwQvUZE347"

// 百度地图appkey
let baiduMapAppKey = "zyQk3xRYbaRgjcqGHht1Fou9GkTj7ROa"

// 友盟统计分析

