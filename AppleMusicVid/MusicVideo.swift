//
//  MusicVideo.swift
//  AppleMusicVid
//
//  Created by DEEPINDERPAL SINGH on 06/06/16.
//  Copyright © 2016 Dimonds Infosys Pvt Ltd. All rights reserved.
//

import Foundation


class Videos {
    
    var vRank = 0
    
    //Data encapsulation
    private var _vName:String
//    private var _vRights:String
//    private var _vPrice:String
    private var _vImageUrl:String
//    private var _vArtist:String
    private var _vVideoUrl:String
//    private var _vImid:String
//    private var _vGenre:String
//    private var _vLinkToiTunes:String
//    private var _vReleaseDate:String
    
    //Make getter
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
//    var vDiscription = String {
//        return _vDiscription;
//    }
    
    
    init (data: JSONDictionary) {
        //if do not initializer all property we will get error meassage
        //Retun from initializer without intializing  all stored properties
        
        //Video name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
            self._vName = vName;
        } else
        {
            self._vName = ""
        }
        
        //The Video image Url
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String
        {
            self._vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600X600")
            print(self._vImageUrl)
        } else{
            self._vImageUrl = ""
        }
        
        
        //The Video Url
        if let url = data["link"] as? JSONArray,
            vidUrl = url[1] as? JSONDictionary,
            vref = vidUrl["attributes"] as? JSONDictionary,
            href = vref["href"] as? String
        {
            self._vVideoUrl = href
        } else{
            self._vVideoUrl = ""
        }
        
    }
}