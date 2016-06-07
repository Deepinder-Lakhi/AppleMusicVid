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
    
    var videos = [Videos]()
    
    override func viewDidLoad()
    {
//        super.viewDidLoad()
//        sereverCommunication.delegate = self
//        sereverCommunication.getRequest("" as String, viewController: self)
        //call api
        let api = APIManager()
        api.loadData("https://itunes.apple.com/search?term=jack+johnson",completion: didLoadData)

    }
    
    func didLoadData(videos: [Videos])
    {
        self.videos = videos
        for item in videos {
            print("name = \(item.vName)")
        }
        mytest()
    }
    
    func mytest()
    {
        for item in videos {
            print("My name = \(item.vName)")
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Video Cell", forIndexPath: indexPath) as! CustomMusicCell

        let object = self.videos[indexPath.row]
        print(object.vName)

        cell.titleLbl?.text = object.vName;
        
//        let artistNameStr:String? = self.musicVideoArray.valueForKey("rights").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
        
//        let PublisherNameStr:String? = self.musicVideoArray.valueForKey("rights").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
//        
//        print (musicVideoArray)
//        
//        let imageName = self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
//        
//        let imageUrl = NSURL(string:imageName!)!
//        cell.musicImgView.sd_setImageWithURL(imageUrl, placeholderImage: UIImage(named: "default"))
//
//        
//        cell.titleLbl?.text = self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
//
//        cell.discriptionLbl?.text = NSString(string: "\(PublisherNameStr) /n \(artistNameStr)") as String
        return cell
    }
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        //Before animate of cell
//        cell.alpha = 0
//        cell.layer.transform = CATransform3DMakeTranslation(0, 250, 20)
//
//        
//        //After animation of cell
//        UIView.animateWithDuration(1.0) {
//            cell.alpha = 1
//        }
//        
//    }
    
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

