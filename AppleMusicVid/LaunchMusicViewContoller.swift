//
//  LaunchMusicViewContoller.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 24/05/16.
//  Copyright © 2016 Diamonds Mobile Tech Pvt Ltd. All rights reserved.
//  This is my new feature

import Foundation

class LaunchMusicViewContoller: BaseViewController, ServerCommDelegate, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var musicListTableView: UITableView!;
    var musicVideoArray = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sereverCommunication.delegate = self
        sereverCommunication.getRequest("" as String, viewController: self)
    }
    
    //MARk:- TableView delegate
    //MARK:-
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = musicVideoArray.count
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Video Cell", forIndexPath: indexPath) as! CustomMusicCell
//        let object = objects[indexPath.row]
        
        let artistNameStr:String? = self.musicVideoArray.valueForKey("rights").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
        
        let PublisherNameStr:String? = self.musicVideoArray.valueForKey("rights").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
        
        print (musicVideoArray)
//        let imageName = self.jsonResult.objectForKey("image") as? String
//        print(self.musicVideoArray)
//    print(self.musicVideoArray.objectAtIndex(indexPath.row).valueForKey("im:price") as! String)
//        ßself.musicVideoArray.valueForKey("im:image").valueForKey("label")!.valueForKey("attributes")!.objectAtIndex(indexPath.row) as? String/
        let imageName = self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
        
        let imageUrl = NSURL(string:imageName!)!
        cell.musicImgView.sd_setImageWithURL(imageUrl, placeholderImage: UIImage(named: "default"))

        
        cell.titleLbl?.text = self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String
        
        cell.discriptionLbl?.text = NSString(string: "\(PublisherNameStr) /n \(artistNameStr)") as String
//        print(self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String);
//        cell.titleLbl?.text = self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String

//        cell.textLabel?.text = self.musicVideoArray.objectForKey("feed")![indexPath.row] as? String
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

