//
//  CustomMusicCell.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 31/05/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class CustomMusicCell: UITableViewCell {

    var video:Videos? {
        didSet {
            musicImgView.image = nil
             updateCell()
        }
    }
    
    @IBOutlet weak var musicImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    func updateCell() {
        titleLbl.text = ("#\(video!.vRank)")
        discriptionLbl.text = video?.vName
        musicImgView.image = UIImage(named: "placeHolder")
        
        
        if video!.vImageData != nil {
            musicImgView.image = UIImage(data: video!.vImageData!)
        }
        else
        {
            GetVideoImage(video!, imageView: musicImgView)
        }
    }
    
    func GetVideoImage(video: Videos, imageView : UIImageView){
        
        // Background thread
        //  DISPATCH_QUEUE_PRIORITY_HIGH Items dispatched to the queue will run at high priority, i.e. the queue will be scheduled for execution before any default priority or low priority queue.
        //
        //  DISPATCH_QUEUE_PRIORITY_DEFAULT Items dispatched to the queue will run at the default priority, i.e. the queue will be scheduled for execution after all high priority queues have been scheduled, but before any low priority queues have been scheduled.
        //
        //  DISPATCH_QUEUE_PRIORITY_LOW Items dispatched to the queue will run at low priority, i.e. the queue will be scheduled for execution after all default priority and high priority queues have been scheduled.
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            let data = NSData(contentsOfURL: NSURL(string: video.vImageUrl)!)
            
            var image : UIImage?
            if data != nil {
                video.vImageData = data
                image = UIImage(data: data!)
            } else {
                image = UIImage(named: "placeHolder")
            }
            
            // move back to Main Queue
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }
    
    
    
    
    
    
}
