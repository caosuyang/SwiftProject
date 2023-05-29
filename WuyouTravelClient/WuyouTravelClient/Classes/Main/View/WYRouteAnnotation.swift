//
//  WYRouteAnnotation.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/17.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYRouteAnnotation: BMKPointAnnotation {

    var type: Int! ///<0:起点 1：终点 2：公交 3：地铁 4:驾乘 5:途经点
    var degree: Int!
    
    override init() {
        super.init()
    }
    
    init(type: Int, degree: Int) {
        self.type = type
        self.degree = degree
    }
}
