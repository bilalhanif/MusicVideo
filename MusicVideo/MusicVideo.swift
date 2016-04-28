//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Bilal on 4/27/16.
//  Copyright © 2016 LNL. All rights reserved.
//

import Foundation

class Videos {
    
    //Data Encapsulation
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    //Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
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
        
        //the video image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String{
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else {
            _vImageUrl = ""
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
    }
    
}
