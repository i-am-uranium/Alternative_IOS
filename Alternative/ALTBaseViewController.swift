//
//  ALTBaseViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 14/06/16.
//  Copyright © 2016 Mackerov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    func alertView(message:String) {
        let alertView = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
        alertView.view.tintColor = DARK_RED_COLOR
    }

}
