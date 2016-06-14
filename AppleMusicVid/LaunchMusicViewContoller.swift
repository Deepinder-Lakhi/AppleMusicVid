//
//  LaunchMusicViewContoller.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 24/05/16.
//  Copyright © 2016 Diamonds Mobile Tech Pvt Ltd. All rights reserved.

import Foundation

class LaunchMusicViewContoller: BaseViewController, ServerCommDelegate, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var musicListTableView: UITableView!;
    var musicVideoArray = NSMutableArray()
    var optionalString = NSString()
    let prefs = NSUserDefaults.standardUserDefaults()
    var videos = [Videos]()
    
    private struct storyboard {
        static let cellReuseIdentifier = "Video Cell"
    }
    
    override func viewDidLoad()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reachabilityStatusChanged), name: "reachabilityChanged", object: nil)
        reachabilityStatusChanged()
    }
    
    func reachabilityStatusChanged() {
        switch reachabilityStatus {
        case NOACCESS:
            print("No internet")
        default:
            runApi()
        }
    }
    
    //It is called only when object is about to be dealloc
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "reachabilityChanged", object: nil)
    }
    
    //MARK:- call api here
    func runApi() {
        let api = APIManager()
        optionalString = prefs.objectForKey("userRegion") as! String
        var urlString = NSString(string:"\(baseUrlStr)\(optionalString)\(trailingUrlStr)")
        urlString = urlString .stringByReplacingOccurrencesOfString(" ", withString: "%20")
        api.loadData(urlString as String,completion: didLoadData)
    }
    
    func didLoadData(videos: [Videos])
    {
        self.videos = videos
//        for item in videos {
//            print("name = \(item.vImageUrl)")
//        }
        musicListTableView.delegate = self
        musicListTableView.dataSource = self
        musicListTableView.reloadData()
    }
    
    //MARk:- TableView delegate
    //MARK:-
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = self.videos.count
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(storyboard.cellReuseIdentifier, forIndexPath: indexPath) as! CustomMusicCell
        cell.video = self.videos[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //MARk:- Server responce delegate
    //MARK:-
    
    func serverResponseArrived(Response: AnyObject)
    {
        self.jsonResult = Response as! NSDictionary
        self.musicVideoArray = (self.jsonResult.objectForKey("feed")!.objectForKey("entry")) as! NSMutableArray
        print(musicVideoArray);
        self.musicListTableView.reloadData()
    }
}

