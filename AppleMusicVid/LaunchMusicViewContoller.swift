//
//  LaunchMusicViewContoller.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 24/05/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//  This is my new feature

import Foundation

class LaunchMusicViewContoller: BaseViewController, ServerCommunictionDelegate, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var musicListTableView: UITableView!;
    var musicVideoArray = NSMutableArray()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sereverCommunication.delegate = self
        let parameterString = NSString(string:"")
        sereverCommunication.getRequest(parameterString as String, viewController: self)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
//        let object = objects[indexPath.row]

        print(self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String);
        cell.textLabel?.text = self.musicVideoArray.valueForKey("im:name").valueForKey("label")!.objectAtIndex(indexPath.row) as? String

//        cell.textLabel?.text = self.musicVideoArray.objectForKey("feed")![indexPath.row] as? String
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

