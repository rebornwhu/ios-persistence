//
//  ViewController.swift
//  ios-persistence
//
//  Created by Xiao Lu on 11/14/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lineFields:[UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()

        let filePath = self.dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(filePath) {
            let array = NSArray(contentsOfFile: filePath) as! [String]
            for var i = 0; i < array.count; i++ {
                lineFields[i].text = array[i]
            }
        }
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: UIApplicationWillResignActiveNotification, object: app)
    }
    
    func applicationWillResignActive(notification:NSNotification) {
        let filePath = self.dataFilePath()
        let array = (self.lineFields as NSArray).valueForKey("text") as! NSArray
        array.writeToFile(filePath, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.stringByAppendingPathComponent("data.plist") as String
    }

}

