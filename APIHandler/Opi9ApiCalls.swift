//
//  Opi9ApiCalls.swift
//  Opi9
//
//  Created by kvanadev5 on 27/10/16.
//  Copyright © 2016 kvanadev5. All rights reserved.
//

import UIKit

class Opi9ApiCalls: NSObject {
    static let sharedInstance = Opi9ApiCalls()
    let baseurl = "https://quiet-reef-36650.herokuapp.com"

    
  /*
     func signUpUser(firstName:String,lastName:String,email:String,password:String,phoneNumber:NSNumber,userTyperegister:Bool,gender:String) {

        let postEndPoint = NSURL(string:"\(baseurl)/users/signup.json");
        let request = NSMutableURLRequest(url:postEndPoint as! URL);
        let session = URLSession.shared
        request.httpMethod = "POST"
        let err: NSError
        
        var params = ["firstname": firstName, "lastname":lastName, "email":email, "password":password, "phone":phoneNumber,"usertypereg":userTyperegister, "gender":gender] as Dictionary
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = JSONSerialization.jsonObject(with: params,options: JSONSerialization.ReadingOptions())

        
    var task = session.dataTask(with: request as URLRequest) { (data, response, err) in
        if (err != nil){
            
        }else{
            
        }
        }
    
    }
    */
    
    
    
    


}
