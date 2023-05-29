//
//  WYAnimatedAnnotationView.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/17.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit

class WYAnimatedAnnotationView: BMKAnnotationView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var annotationImages: [UIImage]!
    var annotationImageView: UIImageView!
    
    override init(annotation: BMKAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.bounds = CGRect(x: 0, y: 0, width: 32, height: 32)
        self.backgroundColor = UIColor.clear
        
        annotationImageView = UIImageView(frame: bounds)
        annotationImageView.contentMode = UIViewContentMode.center
        
        self.addSubview(annotationImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImages(_ images: [UIImage]) {
        annotationImages = images
        updateImageView()
    }
    
    func updateImageView() {
        if annotationImageView.isAnimating {
            annotationImageView.stopAnimating()
        }
        annotationImageView.animationImages = annotationImages
        annotationImageView.animationDuration = 0.5 * TimeInterval(self.annotationImages.count)
        annotationImageView.animationRepeatCount = 0
        annotationImageView.startAnimating()
    }

}
