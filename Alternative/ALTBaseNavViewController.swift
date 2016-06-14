//
//  ALTBaseNavViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 15/06/16.
//  Copyright © 2016 Mackerov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTBaseNavViewController: UINavigationController {
    
    override func viewDidLoad() {
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont(name: "Snell Roundhand", size: 22)!]
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
