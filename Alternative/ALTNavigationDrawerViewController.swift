//
//  ALTNavigationDrawerViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 09/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTNavigationDrawerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    let singleCell = [("Home","calendar"),("Your Orders","comments"),("Chat History","map"),("Saved Address","menu-1"),("FAQ","news"),("Share","tag"),("Contact Us","wishlist"),("Logout","wishlist")]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return singleCell.count
    }
    
    
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ALTNavTableViewCell
        cell.navImage.image = UIImage(contentsOfFile: singleCell[indexPath.row].1)
        cell.navlabel.text = singleCell[indexPath.row].0
        return cell
    }
    
    
}