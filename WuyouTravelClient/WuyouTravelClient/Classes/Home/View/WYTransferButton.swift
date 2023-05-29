//
//  WYTransferButton.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/18.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYTransferButton: UIButton {

    var bezier: UIBezierPath?
    var shapeLayer: CAShapeLayer?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawDownTrapezoidBtn()
    }
    
    private func drawDownTrapezoidBtn() {
        
        backgroundColor = .clear
        bezier = UIBezierPath.init()
        bezier?.move(to: CGPoint(x: 0.0, y: 0.0))
        bezier?.addLine(to: CGPoint(x: 92.0 * kWidthRatio, y: 0.0))
        bezier?.addLine(to: CGPoint(x: 92.0 * kWidthRatio, y: 33.0 * kHeightRatio))
        bezier?.addLine(to: CGPoint(x: 15.0 * kWidthRatio, y: 33.0 * kHeightRatio))
        
        
        shapeLayer = CAShapeLayer.init()
        shapeLayer?.path = bezier?.cgPath
        shapeLayer?.fillColor = UIColor.globalBackgroundColor().cgColor
        shapeLayer?.lineWidth = kSplitLineHeight
        shapeLayer?.strokeColor = UIColor.globalBackgroundColor().cgColor
        layer.addSublayer(shapeLayer!)
        
        setTitle(String.init("接送机"), for: UIControlState())
        setTitleColor(UIColor.globalBtnTitleDisabledColor(), for: UIControlState())
        titleLabel?.font = UIFont.semiBoldSystemFontOfSize(size: 14.0 * kHeightRatio)
        isUserInteractionEnabled = true
    }

}
