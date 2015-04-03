//
//  NewTweetViewController.swift
//  alamofire-cocoapods
//
//  Created by Lucas Eduardo on 03/04/15.
//  Copyright (c) 2015 Lucas Eduardo. All rights reserved.
//

import UIKit
import Alamofire

class NewTweetViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTouchNewTweetBtn(sender: AnyObject) {
        let parameters = ["message" : textField.text]
        Alamofire.request(.POST, "http://webdemo-itunesu.rhcloud.com/users/1/tweets", parameters: parameters, encoding: .JSON).responseJSON { (_, _, JSON, _) in
            println(JSON)
            self.navigationController!.popViewControllerAnimated(true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
