//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Bilal on 4/27/16.
//  Copyright © 2016 LNL. All rights reserved.
//

import Foundation

class Videos {
    
    
    var vRank = 0
    
    //Data Encapsulation
    
    private var _vName:String
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToitTunes:String
    private var _vReleaseDte:String
    
    //this variable gets created from the UI
    var vImageData:NSData?
    
    //Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    var vPrice: String {
        return _vPrice
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vArtist: String {
        return _vArtist
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
    
    var vLinkToitTunes: String {
        return _vLinkToitTunes
    }
    
    var vReleaseDte: String {
        return _vReleaseDte
    }
    
    init(data: JSONDictionary) {
        
        //if we do not initialize all properties we will get an error
        //return from initializer without initializing all stored properties
        
        //video name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        }
        else {
            //you may not always get data back from the json - you may want to display message
            //element in the JSON is unexpected
            
            _vName = ""
        }
        
        //the studio name
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
                self._vRights = vRights
        }
        else {
            _vRights = ""
        }
        
        //price of video
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
            self._vPrice = vPrice
        }
        else {
            _vPrice = ""
        }
        
        //the video image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String{
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else {
            _vImageUrl = ""
        }
        
        //the artist name
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String {
                self._vArtist = vArtist
        }
        else {
            _vArtist = ""
        }
        
        //video url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String{
                self._vVideoUrl = vVideoUrl
        }
        else {
            _vVideoUrl = ""
        }
        
        //the artist ID for iTunes search API
        if let imid = data["id"] as? JSONDictionary,
            vid = imid["attributes"] as? JSONDictionary,
            vImid = vid["im:id"] as? String {
                self._vImid = vImid
        }
        else {
            _vImid = ""
        }
        
        //the genre
        if let genre = data["category"] as? JSONDictionary,
            rel2 = genre["attributes"] as? JSONDictionary,
            vGenre = rel2["term"] as? String {
            self._vGenre = vGenre
        }
        else {
            _vGenre = ""
        }

        //video link to iTunes
        if let release2 = data["id"] as? JSONDictionary,
            vLinkToitTunes = release2["label"] as? String {
                self._vLinkToitTunes = vLinkToitTunes
        }
        else {
            _vLinkToitTunes = ""
        }
        
        //the release date
        if let release2 = data["im:releaseDate"] as? JSONDictionary,
            rel2 = release2["attributes"] as? JSONDictionary,
            vReleaseDte = rel2["label"] as? String {
                self._vReleaseDte = vReleaseDte
        }
        else {
            _vReleaseDte = ""
        }
    }
    
}
