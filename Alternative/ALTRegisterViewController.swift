//
//  ALTRegisterViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 06/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTRegisterViewController: ALTBaseViewController,UITextFieldDelegate {
    
    
    let apiManager = APIManager()
    let endpoints = EndPoints()
    
    var contact_number:String!{
        get{
            return NSUserDefaults.standardUserDefaults().objectForKey("contact_number") as! String
        }set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "contact_number")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var email_id:String!{
        get{
            return NSUserDefaults.standardUserDefaults().objectForKey("email_id") as! String
        }set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "email_id")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var full_name: String!{
        get{
            return NSUserDefaults.standardUserDefaults().objectForKey("full_name") as! String
        }set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "full_name")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var message:String!{
        get{
            return NSUserDefaults.standardUserDefaults().objectForKey("message") as! String
        }set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "message")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
//    
//    var user_id :Int!{
//        get{
//            return NSUserDefaults.standardUserDefaults().integerForKey("contact_number")
//        }set{
//            NSUserDefaults.standardUserDefaults().setInteger(newValue, forKey: "contact_number")
//            NSUserDefaults.standardUserDefaults().synchronize()
//        }
//    }
    
    
    //MARK:-Properties
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var recieveOTPRightButton: UIButton!
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var contactNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var receiveOTPButton: UIButton!
    
    //Mark:-View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterKeyboardNotifications()
    }
    
    func appearance(){
        recieveOTPRightButton.alpha = 0.4
        recieveOTPRightButton.enabled = false
        receiveOTPButton.layer.cornerRadius = 5.0
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == emailField{
            contactNumberField.becomeFirstResponder()
            return false
        }else if textField == contactNumberField{
            passwordField.becomeFirstResponder()
            return false
        }else if textField == passwordField{
            confirmPassword.becomeFirstResponder()
            return false
        }else if textField == confirmPassword{
            confirmPassword.resignFirstResponder()
            return false
        }
        return false
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Mark:-Keyboard and Scrolling
    
    func findFirstResponder()->UITextField{
        if emailField.isFirstResponder(){
            return emailField
        }else if contactNumberField.isFirstResponder(){
            return contactNumberField
        }else if contactNumberField.isFirstResponder(){
            return contactNumberField
        }else if passwordField.isFirstResponder(){
            return passwordField
        }else if confirmPassword.isFirstResponder(){
            return confirmPassword
        }
        return emailField
    }
    
    
    
    func registerKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ALTRegisterViewController.keyboardDidShow(_:)), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ALTRegisterViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    func unregisterKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo!
        let keyboardSize = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.CGRectValue.size
        let contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        scroller.contentInset = contentInsets
        scroller.scrollIndicatorInsets = contentInsets
        
        var viewRect = view.frame
        viewRect.size.height -= keyboardSize.height
        if CGRectContainsPoint(viewRect, self.findFirstResponder().frame.origin) {
            let scrollPoint = CGPointMake(0, self.findFirstResponder().frame.origin.y - keyboardSize.height)
            scroller.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        scroller.contentInset = UIEdgeInsetsZero
        scroller.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    
    
    func isTextFieldsAreEmpty()->Bool{
        return (emailField.text?.isBlank)! || (contactNumberField.text?.isBlank)! || (passwordField.text?.isBlank)! || (confirmPassword.text?.isBlank)!
    }
    
    @IBAction func recieveOTP(sender: AnyObject) {
        if reachabilityStatus == WIFI || reachabilityStatus == WWAN{
            if !isTextFieldsAreEmpty(){
                let email = emailField.text
                let contact = contactNumberField.text
                let password = passwordField.text
                let confirPassword = confirmPassword.text
                if password == confirPassword {
                    let url = self.endpoints.getRegistrationEndPoint(email!, contact_number: contact!, password: password!, alternate_number: "9898989898", device_id: "deviceId")
                    print(url)
                    apiManager.sendRegistrationDetails(HTTPMethod: "GET", url: url, completion: didRegister)
                    self.activityIndicator.startAnimating()
                }else{
                    alertView("Password does not matched")
                }
            }else{
                alertView("One or more Fields are empty")
            }
        }else{
            alertView(NOACCESS)
        }
    }
    
    func didRegister(status:Int,data:NSData){
        print(status)
        if status == OK{
            

            do{
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? NSDictionary{
                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                    dispatch_async(dispatch_get_global_queue(priority, 0)){
                        dispatch_async(dispatch_get_main_queue()){
                            print(jsonData)
                            let contact_number = jsonData.objectForKey("contact_number") as! String
                            let email_id = jsonData.objectForKey("email_id") as! String
                            let full_name = jsonData.objectForKey("full_name") as! String
                            let message = jsonData.objectForKey("message") as! String
                            NSUserDefaults.standardUserDefaults().setObject(contact_number, forKey: "contact_number")
                            NSUserDefaults.standardUserDefaults().setObject(email_id, forKey: "email_id")
                            NSUserDefaults.standardUserDefaults().setObject(full_name, forKey: "full_name")
                            NSUserDefaults.standardUserDefaults().setObject(message, forKey: "message")
                            
                        }
                    }
                }
            }catch{
            }
            
            activityIndicator.stopAnimating()
            let vc = ALTOTPViewController()
            self.presentViewController(vc, animated: true, completion: nil)
        }else{
            alertView("Something went wrong try again")
        }
        
    }
}
