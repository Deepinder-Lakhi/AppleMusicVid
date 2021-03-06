//
//  AppDelegate.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 24/05/16.
//  Copyright © 2016 Diamonds Mobile Tech Pvt Ltd. All rights reserved.
//

import UIKit

var reachability = Reachability?()

var reachabilityStatus = WIFI


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //Decalring variables
    var window: UIWindow?
    var internetCheck: Reachability?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reachabilityChanged), name: ReachabilityChangedNotification, object: nil)
        internetCheck = try! Reachability.reachabilityForInternetConnection()
        try! internetCheck?.startNotifier()
        
        return true
    }
    
    func reachabilityChanged(notification: NSNotification) {
        reachability = notification.object as? Reachability
        statusChangedWithReachability(reachability!)
    }
    
    func statusChangedWithReachability(ReachabilityStatus: Reachability) {
        let networkStatus:Reachability.NetworkStatus = ReachabilityStatus.currentReachabilityStatus
        print(networkStatus)
    }
    
    func applicationWillTerminate(application: UIApplication) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: nil)
    }

}

