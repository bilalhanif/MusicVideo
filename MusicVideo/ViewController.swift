//
//  ViewController.swift
//  MusicVideo
//
//  Created by Waqar Kayani on 26/04/2016.
//  Copyright © 2016 LNL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call api
        let api = APIManager()
        api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=10/genre=1690/json", completion: didLoadData)
    }
    
    func didLoadData(result:String) {
        
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) {
            action -> Void in
            
            //code
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion:  nil)
        
        //print(result)
    }
}

