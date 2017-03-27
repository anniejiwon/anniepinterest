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

    var myBoards: NSMutableArray = []
//    var myBoards: [String: AnyObject] = []
//    var myBoards: [Dictionary<String, String>] = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        PDKClient.sharedInstance()
            .getAuthenticatedUserBoards(withFields: ["id", "name","url","description","image"], success: { data in
                 guard let myData = data?.parsedJSONDictionary["data"] as? [[String: Any]]  else {
                        return
                    }
                
                    print("MY DATA-------- \(myData[0])")
                    
                    for item in myData {
                        
                        
                        //let valid = JSONSerialization.isValidJSONObject(board)
                        //print(valid)
                        self.myBoards.add(item)
                    
                }
                
                
            }, andFailure: nil)
        
        //print("myboards..... \(self.myBoards)")
        
//        navigationBar.titleTextAttributes =
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
