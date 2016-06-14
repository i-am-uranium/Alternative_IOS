//
//  ALTLoginViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 06/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTLoginViewController: ALTBaseViewController,UITextFieldDelegate {
    
    let apiManager = APIManager()
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance()
    }
    
    func appearance(){
        loginButton.layer.cornerRadius = 5.0
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        let userName = emailField.text
        let password = passwordField.text
        //        let registration_id = ""
        //        let device_id = ""
        
        if !(userName?.isBlank)! || !(password?.isBlank)!{
            apiManager.sendRegistrationDetails(HTTPMethod: "GET", url: EndPoints().getLoginApi(userName!, password: password!), completion: didSendData)
            activityIndicator.startAnimating()
        }
    }
    
    func didSendData(status:Int,data:NSData){
        print(status)
        if status == OK{
            do{
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                let contact_number = jsonData.objectForKey("contact_number") as! String
                let email_id = jsonData.objectForKey("email_id") as! String
                let full_name = jsonData.objectForKey("full_name") as! String
                let message = jsonData.objectForKey("message") as! String
                NSUserDefaults.standardUserDefaults().setObject(contact_number, forKey: "contact_number")
                NSUserDefaults.standardUserDefaults().setObject(email_id, forKey: "email_id")
                NSUserDefaults.standardUserDefaults().setObject(full_name, forKey: "full_name")
                NSUserDefaults.standardUserDefaults().setObject(message, forKey: "message")
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "logedInBefore")
                let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let initialViewController = storyboard.instantiateViewControllerWithIdentifier("MAINVIEW")
                activityIndicator.stopAnimating()
                self.presentViewController(initialViewController, animated: true, completion: nil)
                print(jsonData)
            }catch{
                activityIndicator.stopAnimating()
                alertView("Something went Wrong")
            }
        }else{
            activityIndicator.stopAnimating()
            alertView("Something went Wrong")
        }
    }
    
    
    func textFieldShouldReturn(textField:UITextField)->Bool{
        if textField == emailField {
            self.passwordField.becomeFirstResponder()
            return false
        }else if textField == passwordField{
            passwordField.resignFirstResponder()
            return false
            //login button clicked will be handle here
        }
        return false
    }
    
    
}




