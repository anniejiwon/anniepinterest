//
//  ViewController.swift
//  pin_annie
//
//  Created by ajw on 3/22/17.
//  Copyright © 2017 annie. All rights reserved.
//

import UIKit
import PinterestSDK

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        PDKClient.sharedInstance()
            .authenticate(withPermissions: [
                PDKClientReadPublicPermissions,
                PDKClientWritePublicPermissions],
                          from: self,
                          withSuccess: { print($0!) },
                          andFailure: { print($0!) })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //
        //        PDKClient.sharedInstance().getBoardPins(boardID, fields: ["id", "image", "note"], withSuccess: { (responseObject :PDKResponseObject!) -> Void in
        //
        //            print(responseObject.pins().first!.descriptionText)
        //
        //        })  { (err :NSError!) -> Void in
        //            print("error NSError: \(err)")
        //        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

