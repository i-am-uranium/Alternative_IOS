//
//  ALTMainViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 09/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTMainViewController: UIViewController {

    @IBOutlet weak var menuItemButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menuItemButton.target = revealViewController()
            menuItemButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
//            revealViewController().rightViewRevealWidth = 150
//            extraButton.target = revealViewController()
//            extraButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
