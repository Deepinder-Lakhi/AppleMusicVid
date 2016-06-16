//
//  VideoPreViewController.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 14/06/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit
//import MediaPlayer
import AVKit
import AVFoundation

class VideoPreViewController: UIViewController {
    
    var videos:Videos!
    
    private var firstAppear = true
    
//    var moviePlayer:MPMoviePlayerController!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var albumType: UILabel!
    
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var songImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = videos.vArtist
        albumType.text = videos.vGenre
        priceLbl.text = videos.vPrice
        songTitle.text = videos.vName
        
        if videos.vImageData != nil {
            songImageView.image = UIImage(data: videos.vImageData!)
        } else {
            songImageView.image = UIImage(named: "placeHolder")
        }
        
        
        /*let url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
        
        moviePlayer = MPMoviePlayerController(contentURL: url)
        moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 200, height: 150)
        
        self.view.addSubview(moviePlayer.view)
        moviePlayer.fullscreen = true
        
        moviePlayer.controlStyle = MPMovieControlStyle.Embedded
         */
        
//        var data = NSData(contentsOfURL: NSURL(ur))
//        songImageView.image = UIImage(data: )
        
        //        var img = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://upload.wikimedia.org/wikipedia/commons/c/c3/Aurora_as_seen_by_IMAGE.PNG")!)!)
        //
        //        cell.backgroundColor = img?.areaAverage()


        // Do any additional setup after loading the view.
    }
    
    @IBAction func playButtonTapped(sender:UIButton) {
        if firstAppear {
            do {
                try playVideo()
                firstAppear = false
            } catch AppError.InvalidResource(let name, let type) {
                debugPrint("Could not find resource \(name).\(type)")
            } catch {
                debugPrint("Generic error")
            }
        }
    }

    private func playVideo() throws {
//        guard let path = NSBundle.mainBundle().pathForResource("video", ofType:"m4v") else {
//            throw AppError.InvalidResource("video", "m4v")
//        }
        let player = AVPlayer(URL: NSURL(string: videos.vImageUrl)!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.presentViewController(playerController, animated: true) {
            player.play()
        }
    }
    
}

enum AppError : ErrorType {
    case InvalidResource(String, String)
}
