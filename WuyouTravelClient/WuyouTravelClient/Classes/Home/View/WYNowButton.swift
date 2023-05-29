//
//  WYNowButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYNowButton: UIButton {
    var bezier: UIBezierPath?
    var shapeLayer: CAShapeLayer?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawTrapezoidBtn()
    }
    
    private func drawTrapezoidBtn() {
        
        backgroundColor = .clear
        bezier = UIBezierPath.init()
        bezier?.move(to: CGPoint(x: 0.0, y: 0.5 * kHeightRatio))
        bezier?.addLine(to: CGPoint(x: 1.0 * kWidthRatio, y: 0.0))
        bezier?.addLine(to: CGPoint(x: 82.0 * kWidthRatio, y: 0.0))
        bezier?.addLine(to: CGPoint(x: 97.0 * kWidthRatio, y: 33.0 * kHeightRatio))
        bezier?.addLine(to: CGPoint(x: 0.0, y: 33.0 * kHeightRatio))
        
        
        shapeLayer = CAShapeLayer.init()
        shapeLayer?.path = bezier?.cgPath
        shapeLayer?.fillColor = UIColor.white.cgColor
        shapeLayer?.lineWidth = kSplitLineHeight
        shapeLayer?.strokeColor = UIColor.white.cgColor
        layer.addSublayer(shapeLayer!)
        
        setTitle(String.init("现在"), for: UIControlState())
        setTitleColor(UIColor.globalHeadlineColor(), for: UIControlState())
        titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 14.0 * kHeightRatio)
        titleEdgeInsets = UIEdgeInsetsMake(0.0, -15.0 * kWidthRatio, 0.0, 0.0)
    }

}
