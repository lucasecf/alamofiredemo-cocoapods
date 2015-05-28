//
//  TweetsListViewController.swift
//  alamofire-cocoapods
//
//  Created by Lucas Eduardo on 03/04/15.
//  Copyright (c) 2015 Lucas Eduardo. All rights reserved.
//

import UIKit
import Alamofire

class TweetsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tweets : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reloadTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func reloadTableView() {
        Alamofire.request(.GET, "http://webdemo-itunesu.rhcloud.com/users/1/tweets")
            .responseJSON { (_, _, JSON, _) in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tweets = NSMutableArray(array: JSON as! NSArray)
                    self.tableView.reloadData()
                })
        }
        
    }
}

extension TweetsListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! UITableViewCell
        
        let tweet = tweets[indexPath.row] as! NSDictionary
        cell.textLabel?.text = tweet["message"] as? String
        
        return cell
    }
}

extension TweetsListViewController: UITableViewDelegate {
   
}