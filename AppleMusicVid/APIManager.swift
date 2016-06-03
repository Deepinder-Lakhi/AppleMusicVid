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
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            dispatch_async(dispatch_get_main_queue())
            {
                if error != nil
                {
                    completion(result: (error!.localizedDescription))
                } else
                {
                    response
//                    completion(result: response as String)
//                    print(data)
                    let result = NSString(data: data!, encoding:NSASCIIStringEncoding)!
                    print("Body: \(result)")
                    
                    let jsonResult: AnyObject = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)
                    completion (result:jsonResult as! String);

                }
            }
        }
        task.resume()
    }
}