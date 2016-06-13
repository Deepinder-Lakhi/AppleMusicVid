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
            updateCell()
        }
    }
    
    @IBOutlet weak var musicImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    func updateCell() {
        titleLbl.text = ("\(video?.vRank)")
        discriptionLbl.text = video?.vName
        musicImgView.image = UIImage(named: "maxresdefault")
        
        
    }
    
    func getVideoImage(video: Videos, imageView: UIImageView) {
        
        /*! Back Ground Procesing
         * @constant DISPATCH_QUEUE_PRIORITY_HIGH
         * Items dispatched to the queue will run at high priority,
         * i.e. the queue will be scheduled for execution before
         * any default priority or low priority queue.
         *
         * @constant DISPATCH_QUEUE_PRIORITY_DEFAULT
         * Items dispatched to the queue will run at the default
         * priority, i.e. the queue will be scheduled for execution
         * after all high priority queues have been scheduled, but
         * before any low priority queues have been scheduled.
         *
         * @constant DISPATCH_QUEUE_PRIORITY_LOW
         * Items dispatched to the queue will run at low priority,
         * i.e. the queue will be scheduled for execution after all
         * default priority and high priority queues have been
         * scheduled.
         *
         * @constant DISPATCH_QUEUE_PRIORITY_BACKGROUND
         * Items dispatched to the queue will run at background priority, i.e. the queue
         * will be scheduled for execution after all higher priority queues have been
         * scheduled and the system will run items on this queue on a thread with
         * background status as per setpriority(2) (i.e. disk I/O is throttled and the
         * thread's scheduling priority is set to lowest value).
         */
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let data = NSData(contentsOfURL: NSURL(string: video.vImageUrl)!)
            
            var image: UIImage?
            if data != nil {
                video.vImageUrl
                
                image = UIImage(data: data!)
            }
            
        }
    }
    
}
