//
//  ALTMainViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 09/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTMainViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    //Makr:-Types
    var NAV_WIDTH:CGFloat = 280
    let cellContents = [("food","Food Ordering"),("homeservices","Home Services"),("laundry","Dry Cleaning"),("cabs","Cab Booking"),("runner","Grocery Delivery"),("recharge","Richarge & Bills"),("gift","Gifts"),("cakeflowers","Cake & Flowers"),("movie","Movie TIckets")]
    
    //Mark:-Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuItemButton: UIBarButtonItem!
    @IBOutlet weak var anythingElse: UIButton!
    
    //Mark:-View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance()
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = NAV_WIDTH
            menuItemButton.target = revealViewController()
            menuItemButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func appearance(){
        self.title = "Alternative"
        anythingElse.layer.cornerRadius = 10.0
        anythingElse.layer.borderWidth = 2.0
        anythingElse.layer.borderColor = DARK_RED_COLOR.CGColor
        setStatusBarBackgroundColor(STATUS_BAR_COLOR)
        collectionView.backgroundColor = CLEAR_COLOR
        
        
        let modelName = UIDevice.currentDevice().modelName
        print(modelName)
        
        if modelName == "iPhone 4"{
        }else if modelName == "iPhone 4s"{
        }else if modelName == "iPhone 5"{
        }else if modelName == "iPhone 5c"{
        }else if modelName == "iPhone 5s"{
        }else if modelName == "iPhone 6"{
        }else if modelName == "iPhone 6 Plus"{
        }else if modelName == "iPhone 6s"{
        }else if modelName == "iPhone SE"{
        }else if modelName == "iPad 2"{
        }else if modelName == "iPad 3"{
        }else if modelName == "iPad 4"{
        }else if modelName == "iPad Air"{
        }else if modelName == "iPad Air 2"{
        }
    }
    
    
    func setStatusBarBackgroundColor(color: UIColor) {
        guard  let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = color
    }
    
    
    
    //Makr:-CollectionView
    
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
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let numberOfItemsPerRow = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow))
        return CGSize(width: size, height: size)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("CHAT_UI") as! ALTChatViewController
        vc.titleText = cellContents[indexPath.row].1
        navigationController?.pushViewController(vc, animated: true)
    }
}
