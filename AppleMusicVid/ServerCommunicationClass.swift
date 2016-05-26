//
//  ServerCommunicationClass.swift
//  Education
//
//  Created by OSX on 07/04/16.
//  Copyright © 2016 OSX. All rights reserved.
//

import UIKit
import SystemConfiguration


protocol ServerCommunictionDelegate
{
    func serverResponseArrived(Response:AnyObject)
}

class ServerCommunicationClass: NSObject
{
    var delegate:ServerCommunictionDelegate! = nil
    
    
    //MARK:- Web services Method
    //MARK:-
    
    
    func postRequestWithImage(parameterString : String , imageData : NSData , viewController : UIViewController)
    {
        let isConnectedInternet = Reachability.isConnectedToNetwork()
        
        if isConnectedInternet
        {
            startIndicator(viewController.view)
            
            var urlString = NSString(string:"\(baseUrl)\(parameterString)")
            print(urlString)
            
            urlString = urlString .stringByReplacingOccurrencesOfString(" ", withString: "%20")
            
            let url:NSURL = NSURL(string: urlString as String)!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            
            let boundary = NSString(format: "---------------------------14737809831466499882746641449")
            let contentType = NSString(format: "multipart/form-data; boundary=%@",boundary)
            request.addValue(contentType as String, forHTTPHeaderField: "Content-Type")
            
            let body = NSMutableData()
            
            body.appendData(NSString(format: "\r\n--%@\r\n", boundary).dataUsingEncoding(NSUTF8StringEncoding)!)
            
            body.appendData(NSString(format:"Content-Disposition: form-data; name=\"photo\"; filename=\".png\"\\.png\n").dataUsingEncoding(NSUTF8StringEncoding)!)
            
            body.appendData(NSString(format: "Content-Type: application/octet-stream\r\n\r\n").dataUsingEncoding(NSUTF8StringEncoding)!)
            
            body.appendData(imageData)
            
            body.appendData(NSString(format: "\r\n--%@\r\n", boundary).dataUsingEncoding(NSUTF8StringEncoding)!)
            
            request.HTTPBody = body
            
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                
                NSOperationQueue.mainQueue().addOperationWithBlock
                    {
                        self.stopIndicator(viewController.view)
                        
                        if data == nil
                        {
                            self.alertViewOpen("Server is not responding", viewController: viewController)
                        }
                        else
                        {
                            let result = NSString(data: data!, encoding:NSASCIIStringEncoding)!
                            print("Body: \(result)")
                            
                            let jsonResult: AnyObject = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)
                            
                            self.delegate.serverResponseArrived(jsonResult)
                            
                        }
                }
                
            })
            
            task.resume()
        }
        else
        {
            alertViewOpen("Please Check Internet Connection", viewController: viewController)
        }
    }
    
    
    func postRequest(parameterString : String , viewController : UIViewController)
    {
        
        let isConnectedInternet = Reachability.isConnectedToNetwork()
        
        if isConnectedInternet
        {
            startIndicator(viewController.view)
            
            var urlString = NSString(string:"\(baseUrl)\(parameterString)")
            print(urlString)
            
            urlString = urlString .stringByReplacingOccurrencesOfString(" ", withString: "%20")
            
            let url:NSURL = NSURL(string: urlString as String)!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                
                NSOperationQueue.mainQueue().addOperationWithBlock
                {
                    self.stopIndicator(viewController.view)

                    if data == nil
                    {
                        self.alertViewOpen("Server is not responding", viewController: viewController)
                    }
                    else
                    {
                        let result = NSString(data: data!, encoding:NSASCIIStringEncoding)!
                        print("Body: \(result)")
                        
                        let jsonResult: AnyObject = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)
                        
                        self.delegate.serverResponseArrived(jsonResult)
                        
                    }
                }
            })
            
            task.resume()
        }
        else
        {
          alertViewOpen("Please Check Internet Connection", viewController: viewController)
        }
        
    }
    
    func getRequest(parameterString : String , viewController : UIViewController)
    {
        let isConnectedInternet = Reachability.isConnectedToNetwork()
        
        if isConnectedInternet
        {
            startIndicator(viewController.view)
            
            var urlString = NSString(string:"\(baseUrl)\(parameterString)")
            print(urlString)
            
            urlString = urlString .stringByReplacingOccurrencesOfString(" ", withString: "%20")
            
            let url:NSURL = NSURL(string: urlString as String)!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
            request.timeoutInterval = 25;
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                var errorStr = String()
                NSOperationQueue.mainQueue().addOperationWithBlock
                    {
                        self.stopIndicator(viewController.view)
                        
                        if data == nil
                        {
                            errorStr = NSString(format: "\(error!.localizedDescription)") as String
                            self.alertViewOpen(errorStr as String, viewController: viewController)
                        }
                        else
                        {
                            let result = NSString(data: data!, encoding:NSASCIIStringEncoding)!
                            print("Body: \(result)")
                            
                            let jsonResult: AnyObject = try! NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)
                            
                            self.delegate.serverResponseArrived(jsonResult)
                            
                        }
                }
                
            })
            
            task.resume()
        }
        else
        {
            alertViewOpen("Please Check Internet Connection", viewController: viewController)
        }
    }
    
    
    //MARK:- Alert Method
    //MARK:-
    
    func alertViewOpen(title:String ,viewController : UIViewController) // alertview
    {
        let alertController = UIAlertController(title: "Alert!", message: title, preferredStyle: .Alert)
        
        let button = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{(alert: UIAlertAction!) in
            
        })
        
        alertController.addAction(button)
        viewController.presentViewController(alertController, animated: true, completion:{})
    }
    
    //MARK:- Activity Indicator
    //MARK:-
    
    func startIndicator(view:UIView)
    {
        let loadingNotification = MBProgressHUD.showHUDAddedTo(view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.Indeterminate
        loadingNotification.labelText = "Loading..."
    }
    
    
    func stopIndicator(view:UIView)
    {
        MBProgressHUD.hideAllHUDsForView(view, animated: true)
        
    }
    
    //MARK:- Reachability (Internet Connection check)
    //MARK:-
    
    internal class Reachability
    {
        class func isConnectedToNetwork() -> Bool
        {
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            let defaultRouteReachability = withUnsafePointer(&zeroAddress)
            {
                SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
            }
            
            var flags = SCNetworkReachabilityFlags()
            if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags)
            {
                return false
            }
            
            let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
            let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
            return (isReachable && !needsConnection)
        }
    }
}
