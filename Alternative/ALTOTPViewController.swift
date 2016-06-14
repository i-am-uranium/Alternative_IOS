//
//  ALTOTPViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 14/06/16.
//  Copyright © 2016 Mackerov Technogies Pvt Ltd. All rights reserved.
//

import UIKit

class ALTOTPViewController: ALTBaseViewController,UITextFieldDelegate {


    @IBOutlet weak var otpField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NSUserDefaults.standardUserDefaults().objectForKey("contact_number"))
    }

    convenience  init() {
        self.init(nibName: "ALTOTPViewController", bundle: nil)
        //initializing the view Controller form specified NIB file
    }

    func textFieldShouldReturn(textField:UITextField)->Bool{
        
        if textField == otpField{
            print("send otp clicked")
            return false
        }
        return false
    }
    
    @IBAction func sendOtp(sender: AnyObject) {
        if !(otpField.text?.isBlank)!{
            let otp = otpField.text
            let email = NSUserDefaults.standardUserDefaults().objectForKey("email_id") as! String
            print(email)
            
            let otpURL = EndPoints().getOtpUrl(otp!, email: email)
            APIManager().sendRegistrationDetails(HTTPMethod: "GET", url: otpURL, completion: didSuccessful)
        }else{
            alertView("OTP Field is empty")
        }
        
    }
    func didSuccessful(status:Int,data:NSData){
        print(status)
        print(data)
        if status == OK{
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "logedInBefore")
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let initialViewController = storyboard.instantiateViewControllerWithIdentifier("MAINVIEW")
            self.presentViewController(initialViewController, animated: true, completion: nil)
        }else{
            alertView("Either the OTP enterd by you wrong or something went wrong")
        }
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
