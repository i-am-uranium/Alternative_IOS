//
//  ApiManager.swift
//  Alternative
//
//  Created by Ravi Ranjan on 13/06/16.
//  Copyright © 2016 Mackerov Technogies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

class APIManager{
    
    //MARK:-Register
    
    func sendRegistrationDetails(HTTPMethod httpMethod:String,url:String,completion:(response:Int,data:NSData)->Void){
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = httpMethod
        request.timeoutInterval = 600
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        let task = session.dataTaskWithRequest(request, completionHandler:{
            data, response, error -> Void in
            if error != nil{
                dispatch_async(dispatch_get_main_queue()){
                    if let httpResponse = response as? NSHTTPURLResponse{
                        let status = httpResponse.statusCode
                        completion(response: status,data: data!)
                        print("Failed")
                        print(data!)
                    }
                }
            }else{
                let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                dispatch_async(dispatch_get_global_queue(priority, 0)){
                    dispatch_async(dispatch_get_main_queue()){
                        if let httpResponse = response as? NSHTTPURLResponse{
                            let status = httpResponse.statusCode
                            completion(response:status,data: data!)
                            print("success registration")
                        }
                        
//                        do{
//                            if let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSDictionary{
//                                let priority = DISPATCH_QUEUE_PRIORITY_HIGH
//                                dispatch_async(dispatch_get_global_queue(priority, 0)){
//                                    dispatch_async(dispatch_get_main_queue()){
//                                        print(jsonData)
//                                        if let httpResponse = response as? NSHTTPURLResponse{
//                                            let status = httpResponse.statusCode
//                                            completion(response: status)
//                                        }
//                                    }
//                                }
//                            }
//                        }catch{
//                            dispatch_async(dispatch_get_main_queue() ){
//                                if let httpResponse = response as? NSHTTPURLResponse{
//                                    let status = httpResponse.statusCode
//                                    completion(response:status)
//                                }
//                            }
//                        }
                    }
                }
            }
            }
        )
        task.resume()
    }
}
