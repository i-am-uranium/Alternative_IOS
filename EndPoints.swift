//
//  EndPoints.swift
//  Alternative
//
//  Created by Ravi Ranjan on 13/06/16.
//  Copyright © 2016 Mackerov Technogies Pvt Ltd. All rights reserved.
//

import Foundation
class EndPoints{
    
    let EMAIL_ID = ""
    let PASSWORD = ""
    let REGISTRATION_ID = ""
    let DEVICE_ID = ""
    let LOGIN_ENDPOINT = "http://192.168.0.6:3000/api/v0/login?"
    
    let REGISTER_ENDPOINT = "http://52.41.68.149/api/v0/registration?full_name=User Name&email_id=jaintulsi43@gmail.com&contact_number=9963081175&passoword=tulsi123&password_confirmation=tulsi123&alternate_number=blank&registration_id=veve&device_id=ece"
    
    
    func getRegistrationEndPoint(email_id:String,contact_number:String,password:String,alternate_number:String,device_id:String)->String{
        return "http://52.41.68.149/api/v0/registration?full_name=User Name&email_id="+email_id+"&"+"contact_number="+contact_number+"&"+"passoword="+password+"&"+"password_confirmation="+password+"&"+"alternate_number="+" "+"&"+"registration_id="+device_id
    }
    
}