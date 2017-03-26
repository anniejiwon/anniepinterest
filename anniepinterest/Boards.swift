//
//  Boards.swift
//  anniepinterest
//
//  Created by ajw on 3/26/17.
//  Copyright © 2017 annie. All rights reserved.
//

import UIKit
import PinterestSDK

class Boards: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    let myBoards = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        PDKClient.sharedInstance()
            .getAuthenticatedUserBoards(withFields: ["id", "name","url","description","creator","created_at","counts","image"], success: { data in
                let myData = data?.parsedJSONDictionary["data"] as? [[String: Any]];
                print("MY DATA-------- \(myData)")
            }, andFailure: nil)
        
        
        
//        navigationBar.titleTextAttributes =
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
