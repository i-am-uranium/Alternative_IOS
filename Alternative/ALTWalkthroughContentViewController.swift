//
//  ALTWalkthroughContentViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 05/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTWalkthroughContentViewController: UIViewController {

    //Mark:-Types
    var index = 0
    var imageFile = ""
    var content = ""
    
    //Mark:-Properties
    @IBOutlet weak var walkThroughImages: UIImageView!
    @IBOutlet weak var walkThroughLines: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        switch index {
//        case 0...1: forwardButton.setTitle("NEXT", forState: UIControlState.Normal)
//        case 2: forwardButton.setTitle("DONE", forState: UIControlState.Normal)
//        default: break
//        }
        if case 0...1 = index {
            forwardButton.setTitle("NEXT", forState: UIControlState.Normal)
        } else if case 2 = index {
            forwardButton.setTitle("Got it!", forState: UIControlState.Normal)
        }
        pageControl.currentPage = index
        walkThroughImages.image = UIImage(imageLiteral: imageFile)
        walkThroughLines.text = content
        walkThroughLines.textColor = UIColor(red: 224/255, green: 119/255, blue: 64/255, alpha: 1.0)
        walkThroughLines.font = UIFont(name: "Helvetica Neue", size: 20.0)
        walkThroughLines.textAlignment = .Center

    }


    @IBAction func nextButtonTapped(sender: UIButton) {
        switch index {
        case 0...1:
            let pageViewController = parentViewController as!
            ALTWalkthroughPageViewController
            pageViewController.forward(index)
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let mainView: UIViewController = storyboard.instantiateViewControllerWithIdentifier("LOGINVIEW")
            mainView.modalTransitionStyle = .FlipHorizontal
            self.presentViewController(mainView, animated: true, completion: nil)
            print("Done Button is clicked")
        default: break
        }
    }
}
enum UIModalTransitionStyle : Int {
    case CoverVertical = 0
    case FlipHorizontal
    case CrossDissolve
    case PartialCurl
}

