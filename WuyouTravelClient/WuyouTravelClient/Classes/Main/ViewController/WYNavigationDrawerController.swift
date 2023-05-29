//
//  WYNavigationDrawerController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/10.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material

class WYNavigationDrawerController: NavigationDrawerController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    open override func prepare() {
        super.prepare()
        
        delegate = self
        isLeftPanGestureEnabled = false
        setLeftViewWidth(width: 254.0 * kWidthRatio, isHidden: true, animated: true)
        depthPreset = .none
    }
}

// MARK: - NavigationDrawerControllerDelegate

extension WYNavigationDrawerController: NavigationDrawerControllerDelegate {
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, statusBar isHidden: Bool) {
        print("navigationDrawerController statusBar is hidden: ", isHidden ? "Yes" : "No")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didOpen position: NavigationDrawerPosition) {
        print("navigationDrawerController didOpen")
        isLeftPanGestureEnabled = true
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didClose position: NavigationDrawerPosition) {
        print("navigationDrawerController didClose")
        isLeftPanGestureEnabled = false
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, willOpen position: NavigationDrawerPosition) {
        print("navigationDrawerController willOpen")
        isLeftPanGestureEnabled = false
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, willClose position: NavigationDrawerPosition) {
        print("navigationDrawerController willClose")
        isLeftPanGestureEnabled = true
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didTapAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didTapAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didEndPanAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didEndPanAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didBeginPanAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didBeginPanAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didChangePanAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didChangePanAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
}
