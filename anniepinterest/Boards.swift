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
    
    //var myBoards = [AnyObject]()
    var myBoards: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        PDKClient.sharedInstance()
            .getAuthenticatedUserBoards(withFields: ["id", "name","url","description","creator","created_at","counts","image"], success: { data in
                //guard let json = result?.parsedJSONDictionary["data"] as? [[String: Any]] else {
            
                let myData = data?.parsedJSONDictionary["data"] as! [[String: Any]];
                //print("MY DATA-------- \(myData)")
                for item in myData {
                    //self.myBoards.append(item)
                    self.myBoards.add(item)
                    print("MY DATA-------- \(self.myBoards)")
                }
            }, andFailure: nil)
        
        
        //print("MY DATA-------- \(myBoards)")
//        navigationBar.titleTextAttributes =
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}

