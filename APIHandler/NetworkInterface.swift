//
//  NetworkInterface.swift
//  HumOS
//
//  Created by Nandu Ahmed on 8/30/16.
//  Copyright © 2016 Sikka Software. All rights reserved.
//

import Foundation



typealias Opi9RequestCompletionType = (Bool, NSDictionary?, URLResponse?, Error?) -> (Void)

class NetworkInterface: NSObject {
    
    static func fetchJSON(_ requestType:Opi9RequestType , headers:NSDictionary? , requestCompletionHander:@escaping Opi9RequestCompletionType)  {
        
        self.sendAsyncRequest(Opi9NetworkRequests.getRequestofType(requestType, headers: headers)) { (success, json, response, error) -> (Void) in
            if (success == true && response != nil) {
                
                let httpResponse:HTTPURLResponse = response as! HTTPURLResponse
                let httpStatusCode = httpResponse.statusCode
                
                switch httpStatusCode {
                    
                case 200:
                    let succcess = (json != nil)
                    if (succcess) {
                        requestCompletionHander(succcess, json, response, nil)
                    } else {
                        requestCompletionHander(false, nil, response , DataErrors.invalidJSONData)
                    }
                    break
                    
                case 204:
                    requestCompletionHander(false, nil, response, Opi9NetworkError.httpStatus204)
                    break
                case 404:
                    requestCompletionHander(false,nil,response,Opi9NetworkError.httpStatus404)
                    break
                case 410:
                    requestCompletionHander(false, nil, response, Opi9NetworkError.httpStatus410)
                    break
                default:
                    requestCompletionHander(false,nil,response,Opi9NetworkError.httpStatusUnknownError)
                    break
                }
            }
            else {
                requestCompletionHander(false,nil,response,error)
            }
            
        }
    }
    

    
    
    static fileprivate func sendAsyncRequest(_ request:URLRequest, completionHandler:@escaping Opi9RequestCompletionType) {
        let queue:OperationQueue = OperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) in
            do {
                if (response != nil && data != nil) {
                    if let json = try JSONSerialization.jsonObject(with: data!, options:[]) as? AnyObject {
                        print("Response from DISPATCH ASYNC URL \(response?.url) \(json)")
                        if (json is NSArray) {
                            let arrayOfJson = ["array":json]
                            completionHandler(true,arrayOfJson as NSDictionary?, (response as! HTTPURLResponse), nil)
                        } else {
                            completionHandler(true,json as? NSDictionary ,(response  as! HTTPURLResponse), nil)
                        }
                    } else {
                        completionHandler(false, nil, (response as! HTTPURLResponse), DataErrors.invalidJSONData)
                    }
                } else {
                    if let data = data, let json = try JSONSerialization.jsonObject(with: data, options:[]) as? AnyObject {
                        print(json)
                    }
                    completionHandler(false, nil, response , DataErrors.noData)
                }
            }catch let error as NSError {
                print(error.localizedDescription)
                completionHandler(false, nil,response,DataErrors.dataParseError)
            }
            
        }
    }
}
