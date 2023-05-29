# SwiftProject
Swift Project.

项目使用 Swift 构建

## 项目截图

![screenshot_1](https://github.com/caosuyang/SwiftProject/blob/main/screenshot/screenshot_1.png)
![screenshot_2](https://github.com/caosuyang/SwiftProject/blob/main/screenshot/screenshot_2.png)
![screenshot_3](https://github.com/caosuyang/SwiftProject/blob/main/screenshot/screenshot_3.png)
![screenshot_4](https://github.com/caosuyang/SwiftProject/blob/main/screenshot/screenshot_4.png)
![screenshot_5](https://github.com/caosuyang/SwiftProject/blob/main/screenshot/screenshot_5.png)
![screenshot_6](https://github.com/caosuyang/SwiftProject/blob/main/screenshot/screenshot_6.png)
## 项目结构

- WuyouTravelClient 主工程
    - Classes
        - Login 登录和注册
        - Home 首页
        - Transfer 接送
        - Charter 图表
        - Mine 我的
        - Notice 消息通知
        - Main 主要
            - Extension 扩展
            - Lib 第三方
            - Tool 工具类
        - Other 头文件
            - Const 常量
            - Header 头文件
    
## profile

- pod 'ReactiveCocoa', '~> 7.0.0-alpha.2' 响应式框架
- pod 'Material', '~> 2.12.6' material风格框架
- pod 'SnapKit', '~> 4.0.0' 布局框架
- pod 'Kingfisher', '~> 4.2.0' 图片请求
- pod 'Alamofire', '~> 4.5.1' 网络请求
- pod 'SwiftyJSON', '~> 4.0.0-alpha.1' json转model
- pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift4' Spring动画
- pod 'IBAnimatable', '~> 5.0.0' ib动画
- pod 'Cache', '~> 4.0.4' 缓存
- pod 'MJRefresh', '~> 3.1.12' 下拉刷新
- pod 'SVProgressHUD', '~> 2.2.2' 提示框
- pod 'ReachabilitySwift', '~> 4.1.0' 网络监听
- pod 'KeychainAccess', '~> 3.1.0' 钥匙串存储
- pod 'PromiseKit', '~> 4.4.3' promise异步
- pod 'NVActivityIndicatorView', '~> 4.0.0' 加载指示器
- pod 'Hue', '~> 3.0.0' 十六进制颜色框架
- pod 'SwiftDate', '~> 4.4.1' 日期框架
- pod 'BaiduMapKit', '~> 3.4.2' 百度地图
- pod 'UMengAnalytics-NO-IDFA', '~> 4.2.5' 友盟统计分析

## 核心模块

- Charter 图表
- Notice 消息通知
- Tool 工具类

## 项目架构

- MVVM + RxSwift：使用 ViewModel 解耦 ViewController 逻辑部分，通信部分使用 RxSwift 响应式框架，双向绑定通信机制。
