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
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDate:String
    
    // This variable gets created from the UI
    var vImageData: NSData?
    
    //Make getter
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid: String {
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDate: String {
        return _vReleaseDate
    }
    
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
        
        //Video publisher/Company Details
        if let name = data["rights"] as? JSONDictionary,
            vRight = name["label"] as? String {
            self._vRights = vRight;
        } else
        {
            self._vRights = ""
        }
        
        //Video price
        if let name = data["im:price"] as? JSONDictionary,
            vPrice = name["label"] as? String {
            self._vPrice = vPrice;
        } else
        {
            self._vPrice = ""
        }
        
        //The Video image Url
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String
        {
            print(immage)
            self._vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
//            self._vImageUrl = "http://is1.mzstatic.com/image/thumb/Video50/v4/35/d5/ee/35d5eef1-bf59-7ed4-a26c-a142671d272a/8864459030410101VIC.jpg/600x600bb-85.jpg"
            print(self._vImageUrl)
        } else{
            self._vImageUrl = ""
        }
        
        // Video Artisit name
        if let artist = data["im:artist"] as? JSONDictionary,
            label = artist["label"] as? String
        {
            self._vArtist = label
        } else{
            self._vArtist = ""
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
        
        // Artist id
        if let id = data["id"] as? JSONDictionary,
            attri = id["attributes"] as? JSONDictionary,
            imId = attri["im:id"] as? String
        {
            self._vImid = imId
        } else{
            self._vImid = ""
        }
 
        // The Genre
        if let id = data["category"] as? JSONDictionary,
            attri = id["attributes"] as? JSONDictionary,
            genre = attri["term"] as? String
        {
            self._vGenre = genre
        } else{
            self._vGenre = ""
        }
        
        // Link to iTunes
        if let id = data["id"] as? JSONDictionary,
            label = id["label"] as? String
        {
            self._vLinkToiTunes = label
            
        } else{
            self._vLinkToiTunes = ""
        }
        
        // Link to iTunes
        if let id = data["id"] as? JSONDictionary,
            ReleaseDate = id["label"] as? String
        {
            self._vReleaseDate = ReleaseDate
            
        } else{
            self._vReleaseDate = ""
        }
    }
}