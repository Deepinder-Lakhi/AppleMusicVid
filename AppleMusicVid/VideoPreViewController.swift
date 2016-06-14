//
//  VideoPreViewController.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 14/06/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class VideoPreViewController: UIViewController {
    
    var videoDetailArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(videoDetailArray)
        
        //        var img = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://upload.wikimedia.org/wikipedia/commons/c/c3/Aurora_as_seen_by_IMAGE.PNG")!)!)
        //
        //        cell.backgroundColor = img?.areaAverage()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
