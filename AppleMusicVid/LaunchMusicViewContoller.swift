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
        static let segueIdenitfier = "showDetailVC"
    }
    
    override func viewDidLoad()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reachabilityStatusChanged), name: "reachabilityChanged", object: nil)
        reachabilityStatusChanged()
    }
    
    func reachabilityStatusChanged() {
        switch reachabilityStatus {
        case NOACCESS:
            self.view.internetNotFoundView(0, borderWidth: 0, borderColor:UIColor.lightGrayColor(), bgColor: UIColor.lightGrayColor(), isView: "NoInternet")
        default:
            if videos.count == 0 {
                runApi()
            }
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
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
        
    //MARk:- Server response delegate
    //MARK:-
    
    func serverResponseArrived(Response: AnyObject)
    {
        self.jsonResult = Response as! NSDictionary
        self.musicVideoArray = (self.jsonResult.objectForKey("feed")!.objectForKey("entry")) as! NSMutableArray
        print(musicVideoArray);
        self.musicListTableView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier!)
        if segue.identifier == storyboard.segueIdenitfier {
            if let indexpath = musicListTableView.indexPathForSelectedRow {
                let video = videos[indexpath.row]
                let dvc = segue.destinationViewController as! VideoPreViewController
                dvc.videos = video
            }
        }
    }

}