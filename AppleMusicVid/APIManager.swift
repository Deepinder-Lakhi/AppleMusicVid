//
//  APIManager.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 02/06/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: (result: String) -> Void)
    {
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let url = NSURL(string: urlString)!
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            if error != nil{
                //Handling error here
                dispatch_async(dispatch_get_main_queue()){
                    completion(result: error!.localizedDescription)
                }
            } else {
                //Handling json serialization
                
                do {
                    /*.AllowFragments - top level of object it not a array or dictioanry.
                     Any type string or value
                     NSJSonSerialization requires the Do / Try / Catch
                     Convert NSData into JSON object cast it to the dictionary*/
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary {
                        
                        print(json)
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_sync(dispatch_get_global_queue(priority, 0)){
                            dispatch_sync(dispatch_get_main_queue()){
                                completion(result: "NSUrlSession Successfull")
                            }
                        }
                    }
                } catch {
                        
                        //Handling error here
                        dispatch_async(dispatch_get_main_queue()){
                            completion(result: "Error in NSUrlSession")
                        }
                    }
                }
            }
        task.resume()
        }
}