//
//  ALTRegisterViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 06/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTRegisterViewController: UIViewController,UITextFieldDelegate {
    
    //MARK:-Properties
    
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
        if reachability == WIFI || reachability == WWAN{
            if !isTextFieldsAreEmpty(){
                let email = emailField.text
                let contact = contactNumberField.text
                let password = passwordField.text
                let confirPassword = contactNumberField.text
                
            }else{
                //TODO:-Present an alert view some fields are empty
            }
        }else{
            //TODO:-Present an alert view internt not avialable
        }
        
        
        
    }
    
    
    

}
