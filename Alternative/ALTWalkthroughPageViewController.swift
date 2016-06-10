//
//  ALTWalkthroughPageViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 05/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTWalkthroughPageViewController: UIPageViewController,UIPageViewControllerDataSource {

    //Mark:-Types
    var imagesAndContents = [("first","Just click on the desired service and you are on your way!"),
                             ("second","A simple chat can solve your most troublesome issues!"),
                             ("third","We service any request and are also available on call!")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        // Create the first walkthrough screen
        if let startingViewController = viewControllerAtIndex(0) {
            setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) ->
        UIViewController? {
            var index = (viewController as! ALTWalkthroughContentViewController).index
            index += 1
            return viewControllerAtIndex(index)
    }
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) ->
        UIViewController? {
            var index = (viewController as! ALTWalkthroughContentViewController).index
            index -= 1
            return viewControllerAtIndex(index)
    }

    

    func viewControllerAtIndex(index: Int) -> ALTWalkthroughContentViewController? {
        if index == NSNotFound || index < 0 || index >= imagesAndContents.count {
            return nil
        }
        // Create a new view controller and pass suitable data.
        if let pageContentViewController =
            storyboard?.instantiateViewControllerWithIdentifier("WALKTHROUGHCONTENTVIEWCONTROLLER")
                as? ALTWalkthroughContentViewController {
            pageContentViewController.imageFile = imagesAndContents[index].0
            pageContentViewController.content = imagesAndContents[index].1
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }
    
    
    
    func forward(index:Int) {
        if let nextViewController = viewControllerAtIndex(index + 1) {
            setViewControllers([nextViewController], direction: .Forward, animated:
                true, completion: nil)
        }
    }
    
//    func presentationCountForPageViewController(pageViewController:
//        UIPageViewController) -> Int {
//        return imagesAndContents.count
//    }
//    func presentationIndexForPageViewController(pageViewController:
//        UIPageViewController) -> Int {
//        if let pageContentViewController =
//            storyboard?.instantiateViewControllerWithIdentifier("WALKTHROUGHCONTENTVIEWCONTROLLER")
//                as? ALTWalkthroughContentViewController {
//            return pageContentViewController.index
//        }
//        return 0
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
