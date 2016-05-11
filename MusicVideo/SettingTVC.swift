//
//  SettingTVC.swift
//  MusicVideo
//
//  Created by Waqar Kayani on 10/05/2016.
//  Copyright © 2016 LNL. All rights reserved.
//

import UIKit
import MessageUI

class SettingTVC: UITableViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var aboutDisplay: UILabel!
    
    @IBOutlet weak var feedBackDisplay: UILabel!
    
    @IBOutlet weak var securityDisplay: UILabel!
    
    @IBOutlet weak var touchID: UISwitch!
    
    @IBOutlet weak var bestImageDisplay: UILabel!
    
    @IBOutlet weak var APICnt: UILabel!
    
    @IBOutlet weak var sliderCnt: UISlider!
    
    @IBOutlet weak var labelCnt: UILabel!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(preferredFontChange), name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        tableView.alwaysBounceVertical = false
        
        title = "Setting"
        
        touchID.on = NSUserDefaults.standardUserDefaults().boolForKey("SecSetting")
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("APICNT") != nil) {
            let theValue = NSUserDefaults.standardUserDefaults().objectForKey("APICNT") as! Int
            APICnt.text = "\(theValue)"
            sliderCnt.value = Float(theValue)
        }
        else {
            sliderCnt.value = 10.0
            APICnt.text = ("\(Int(sliderCnt.value))")
        }
    }
    
    
    @IBAction func touchIdSec(sender: UISwitch) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if touchID.on {
            defaults.setBool(touchID.on, forKey: "SecSetting")
        }
        else {
            defaults.setBool(false, forKey: "SecSetting")
        }
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(Int(sliderCnt.value), forKey: "APICNT")
        APICnt.text = ("\(Int(sliderCnt.value))")
    }
    
    func preferredFontChange() {
        print("preferred font change")
        
        aboutDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        feedBackDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        securityDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        bestImageDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        APICnt.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        labelCnt.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        labelSlider.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            let mailComposeViewController = configureMail()
            
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            }
            else {
                mailAlert()
            }
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    func configureMail() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["bilal@yahoo.com"])
        mailComposeVC.setSubject("Music Video App Feedback")
        mailComposeVC.setMessageBody("Hi Bilal, \n\nI would like to share the following feedback...\n", isHTML: false)
        return mailComposeVC
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail Cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail Saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail Faild")
        default:
            print("Unknow Issue")
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mailAlert() {
        let alertController: UIAlertController = UIAlertController(title: "Alert", message: "No e-Mail Account setup for Phone", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { action -> Void in
            //do something
        }
        
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

}
