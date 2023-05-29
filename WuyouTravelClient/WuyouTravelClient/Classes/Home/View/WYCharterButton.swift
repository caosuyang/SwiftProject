//
//  WYCharterButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYCharterButton: UIButton {

    var bezier: UIBezierPath?
    var shapeLayer: CAShapeLayer?
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawCharterTrapezoidBtn()
    }
    
    private func drawCharterTrapezoidBtn() {
        
        backgroundColor = .clear
        bezier = UIBezierPath.init()
        bezier?.move(to: CGPoint(x: 0.0, y: 0.0))
        bezier?.addLine(to: CGPoint(x: 74.0 * kWidthRatio, y: 0.0))
        bezier?.addLine(to: CGPoint(x: 74.5 * kWidthRatio, y: 0.5 * kHeightRatio))
        bezier?.addLine(to: CGPoint(x: 93.0 * kWidthRatio, y: 33.0 * kHeightRatio))
        bezier?.addLine(to: CGPoint(x: 0.0, y: 33.0 * kHeightRatio))
        
        
        shapeLayer = CAShapeLayer.init()
        shapeLayer?.path = bezier?.cgPath
        shapeLayer?.fillColor = UIColor.globalBackgroundColor().cgColor
        shapeLayer?.lineWidth = kSplitLineHeight
        shapeLayer?.strokeColor = UIColor.globalBackgroundColor().cgColor
        layer.addSublayer(shapeLayer!)
        
        setTitle(String.init("包车"), for: UIControlState())
        setTitleColor(UIColor.globalBtnTitleDisabledColor(), for: UIControlState())
        titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 14.0 * kHeightRatio)
        isUserInteractionEnabled = true
    }

}
