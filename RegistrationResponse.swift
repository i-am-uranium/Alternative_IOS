//
//  RegistrationResponse.swift
//  Alternative
//
//  Created by Ravi Ranjan on 14/06/16.
//  Copyright © 2016 Mackerov Technogies Pvt Ltd. All rights reserved.
//

import Foundation

class RegistrationResponse{
    var contact_number = ""
    var email_id = ""
    var full_name = ""
    var message = ""
    var user_id = ""
    
    
    init(){
        
    }
    init(contact_number:String,email_id:String,full_name:String,message:String,user_id:String){
        self.contact_number = contact_number
        self.email_id = email_id
        self.full_name = full_name
        self.message = message
        self.user_id = user_id
    }
    
    
}