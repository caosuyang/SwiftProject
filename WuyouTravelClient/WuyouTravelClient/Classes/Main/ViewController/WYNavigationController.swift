//
//  WYNavigationController.swift
//  WuyouTravelClient
//
//  Created by Admin on 2017/8/10.
//  Copyright © 2017年 wuyouyunche. All rights reserved.
//

import UIKit
import Material

class WYNavigationController: NavigationController {

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
        guard let bar = navigationBar as? NavigationBar else {
            return
        }
        bar.depthPreset = .none
        bar.backgroundColor = UIColor.globalThemeDefaultColor()
        bar.dividerColor = UIColor(r: 230, g: 230, b: 230)
        bar.backButtonImage = UIImage(named: "nav_back_btn_nor_22x22_")
    }
    
}





