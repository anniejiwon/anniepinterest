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
        
//        let didGetAuth: PDKClientSuccess = { response in
//            print("ok, i logged in to pinterest: %s", response ?? "response was nil")
//        }
//        
//        let didFailToGetAuth: PDKClientFailure = { error in
//            print("failed to log in: %s", error ?? "no error")
//        }
//        
//        let permission = [PDKClientReadPublicPermissions];
//        
//        
//        print("PRINTTTT: \(permission)")
        

        PDKClient.sharedInstance()
            .authenticate(withPermissions: [
                PDKClientReadPublicPermissions,
                PDKClientWritePublicPermissions,
                ],
                          from: self,
                          withSuccess: { response in
                            print("ok, i logged in to pinterest: %s", response ?? "response was nil")
                            },
                          andFailure: { error in
                            print("failed to log in: %s", error ?? "no error")
            })
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

