//
//  ALTMainViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 09/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTMainViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuItemButton: UIBarButtonItem!
    @IBOutlet weak var anythingElse: UIButton!
    
    let cellContents = [("food","Food Ordering"),("homeservices","Home Services"),("laundry","Dry Cleaning"),("cabs","Cab Booking"),("runner","Grocery Delivery"),("recharge","Richarge & Bills"),("gift","Gifts"),("cakeflowers","Cake & Flowers"),("movie","Movie TIckets")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alternative"
        
        anythingElse.layer.cornerRadius = 10.0
        anythingElse.layer.borderWidth = 2.0
        anythingElse.layer.borderColor = UIColor(red: 144/255, green: 38/255, blue: 25/255, alpha: 1.0).CGColor
        setStatusBarBackgroundColor(UIColor(red: 235/255, green: 161/255, blue: 14/255, alpha: 1.0))
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "homebackground")!)
        collectionView.backgroundColor = UIColor.clearColor()
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 280
            menuItemButton.target = revealViewController()
            menuItemButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    func setStatusBarBackgroundColor(color: UIColor) {
        
        guard  let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = color
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellContents.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ALTMainCollectionViewCell
        cell.cellImageView.image = UIImage(named: cellContents[indexPath.row].0)
        cell.cellLabel.text = cellContents[indexPath.row].1
        return cell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("CHAT_UI") as! ALTChatViewController
        vc.titleText = cellContents[indexPath.row].1
        navigationController?.pushViewController(vc, animated: true)
    }
}
