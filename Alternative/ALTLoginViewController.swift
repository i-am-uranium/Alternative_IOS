//
//  ALTLoginViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 06/06/16.
//  Copyright © 2016 Mackorov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTLoginViewController: UIViewController,UITextFieldDelegate {
    
    let apiManager = APIManager()
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(reachabilityStatus)
//        print(EndPoints().getRegistrationEndPoint("codewithrabbit@gmail.com", contact_number: "99999999999", password: "codewithrabbit", alternate_number: "alternat", device_id: "device_id"))
        appearance()
    }
    
    func appearance(){
        loginButton.layer.cornerRadius = 5.0
        
    }
    
    func didSendData(status:Int){
        print(status)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let initialViewController = storyboard.instantiateViewControllerWithIdentifier("MAINVIEW")
        self.presentViewController(initialViewController, animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        //        let userName = emailField.text
        //        let password = passwordField.text
        //        let registration_id = ""
        //        let device_id = ""
        //        apiManager.sendRegistrationDetails(HTTPMethod: "GET", url: "http://192.168.0.6:3000/api/v0/login?email_id=jaintulsi43@gmail.com&password=tulsi123&registration_id=evefve&device_id=efvefv", completion: didSendData)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let initialViewController = storyboard.instantiateViewControllerWithIdentifier("MAINVIEW")
        self.presentViewController(initialViewController, animated: true, completion: nil)
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




