//
//  ViewController.swift
//  MusicVideo
//
//  Created by Waqar Kayani on 26/04/2016.
//  Copyright © 2016 LNL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var videos = [Videos]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reachabilityStatusChanged), name: "ReachStatusChanged", object: nil)
        
        reachabilityStatusChanged()
        
        //call api
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/explicit=true/json", completion: didLoadData)
    }
    
    func didLoadData(videos: [Videos]) {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        print(reachabilityStatus)
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.vName)")
        }
        
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
        tableView.reloadData()
        
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
    
    func reachabilityStatusChanged() {
        switch reachabilityStatus {
        case NOACCESS: view.backgroundColor = UIColor.redColor()
        displayLabel.text = "No Internet"
        case WIFI: view.backgroundColor = UIColor.greenColor()
        displayLabel.text = "Reachable with WIFI"
        case WWAN: view.backgroundColor = UIColor.yellowColor()
        displayLabel.text = "Reachable with Cellular"
        default: return
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    }
    
    //    func myTest() {
    //        for item in videos {
    //            print("MytestName = \(item.vName)")
    //        }
    //    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let video = videos[indexPath.row]
        
        cell.textLabel?.text = ("\(indexPath.row + 1)")
        cell.detailTextLabel?.text = video.vName
        
        return cell
    }
}

