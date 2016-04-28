//
//  ViewController.swift
//  MusicVideo
//
//  Created by Waqar Kayani on 26/04/2016.
//  Copyright © 2016 LNL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var videos = [Videos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call api
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/explicit=true/json", completion: didLoadData)
    }
    
    func didLoadData(videos: [Videos]) {
        
        print(reachabilityStatus)
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.vName)")
        }
        
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
//        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
//        
//        let okAction = UIAlertAction(title: "OK", style: .Default) {
//            action -> Void in
//            
//            //code
//        }
//        
//        alert.addAction(okAction)
//        self.presentViewController(alert, animated: true, completion:  nil)
        
        //print(result)
        
        //myTest()
        
    }
    
//    func myTest() {
//        for item in videos {
//            print("MytestName = \(item.vName)")
//        }
//    }
}

