//
//  CALayer+Extension.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/7.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import Foundation

// MARK: - CABasicAnimation

extension CALayer {

    // position
    func addLayerAnimationPosition(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(cgPoint: layer.position)
        animation.toValue = NSValue(cgPoint: CGPoint(x: layer.position.x, y: layer.position.y + 6.0))
        animation.duration = kAnimaDuration
        animation.repeatCount = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        layer.add(animation, forKey: "addLayerAnimationPosition")
    }
    
    // opacity
    func addLayerAnimationOpacity(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = kAnimaDuration
        layer.add(animation, forKey: "addLayerAnimationOpacity")
    }
    
    // bounds
    func addLayerAnimationBounds(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "bounds")
        animation.toValue = NSValue(cgRect: CGRect(x: 130, y: 200, width: 140, height: 140))
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationBounds")
    }
    
    // bounds.size
    func addLayerAnimationBoundsSize(layer: CALayer, radius: CGFloat) {
        let animation = CABasicAnimation(keyPath: "bounds.size")
        animation.fromValue = NSValue(cgSize: layer.bounds.size)
        animation.toValue = NSValue(cgSize: CGSize(width: layer.bounds.size.width + radius, height: bounds.size.height))
        animation.duration = kAnimaDuration
        animation.repeatCount = 2
        layer.add(animation, forKey: "addLayerAnimationBoundsSize")
    }
    
    
    // backgroundColor
    func addLayerAnimationBackgroundColor(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.toValue = UIColor.blue.cgColor
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationMargin")
    }
    
    
    // cornerRadius
    func addLayerAnimationCornerRadius(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.toValue = 30
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationCornerRadius")
    }
    
    // borderWidth
    func addLayerAnimationBorderWidth(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.toValue = 10
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationBorderWidth")
    }
    
    // contents
    func addLayerAnimationContents(layer: CALayer, imgName: String) {
        let animation = CABasicAnimation(keyPath: "contents")
        let toImage = UIImage.init(named: imgName)?.cgImage
        animation.toValue = toImage
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationBounds")
    }
    
    // transform.scale
    func addLayerAnimationTransformScale(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 0.9
        animation.duration = kAnimaDuration
        animation.repeatCount = 2
        animation.autoreverses = true
        layer.add(animation, forKey: "addLayerAnimationScale")
    }
    
    // transform.rotation.x
    func addLayerAnimationTranformRotationX(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.toValue = Double.pi
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationTranformRotationX")
    }
    
    // transform.rotation.y
    func addLayerAnimationTranformRotationY(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.toValue = Double.pi
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationTranformRotationY")
    }
    
    // transform.rotation.z
    func addLayerAnimationTranformRotationZ(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.toValue = Double.pi * 2
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationTranformRotationZ")
    }
    
    // transform.translation.x
    func addLayerAnimationTranformTranslationX(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.toValue = 20
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationTranformTranslationX")
    }
    
    // transform.translation.y
    func addLayerAnimationTranformTranslationY(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.toValue = 20
        animation.duration = kAnimaDuration
        animation.repeatCount = 1
        layer.add(animation, forKey: "addLayerAnimationTranformTranslationY")
    }
}
