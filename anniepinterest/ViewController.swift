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

    @IBOutlet weak var clickLabel: UIButton!
    
   
    override func viewDidAppear(_ animated: Bool) {
        
//        let didGetAuth: PDKClientSuccess = { response in
//            print("ok, i logged in to pinterest: %s", response ?? "response was nil")
//        }
//        let didFailToGetAuth: PDKClientFailure = { error in
//            print("failed to log in: %s", error ?? "no error")
//        }

    
        PDKClient.sharedInstance()
            .authenticate(withPermissions: [
                PDKClientReadPublicPermissions,
                PDKClientWritePublicPermissions,
                ],
                          from: self,
                          withSuccess: { response in
                            print("ok, i logged in to pinterest: %s", response ?? "response was nil")
                            
                            let myName = response?.user().firstName!
                            
                            self.clickLabel?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
                            self.clickLabel.titleLabel?.textAlignment = NSTextAlignment.center
                            
                            self.clickLabel.setTitle("Welcome, \(myName!)!", for: .normal)
                            
                            self.performSegue(withIdentifier: "Boards", sender: self)
                            
                            },
                          andFailure: { error in
                            print("failed to log in: %s", error ?? "no error")
            
            })
 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

