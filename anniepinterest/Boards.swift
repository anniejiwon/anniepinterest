//
//  Boards.swift
//  anniepinterest
//
//  Created by ajw on 3/26/17.
//  Copyright © 2017 annie. All rights reserved.
//

import UIKit
import PinterestSDK
import Foundation
import SwiftyJSON


class Boards: UITableViewController {

    @IBOutlet var tableview: UITableView!

    //@IBOutlet weak var navigationBar: UINavigationBar!
    
        var myBoards = NSMutableArray()
//    var myBoards = Array<Array<AnyObject>>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PDKClient.sharedInstance()
            .getAuthenticatedUserBoards(withFields: ["id", "name","url","description","image"],
                success: { (data) in
                    guard let myData = data?.parsedJSONDictionary["data"] as? [[String: Any]]
                        
                    else {
                        return
                    }
                    
                    let list = NSMutableArray()
                    for item in myData {
                        list.add(item)
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.myBoards = list
                        self.tableView.reloadData()
                    }
                    
            }, andFailure: nil)
     
    }

    
    //tableview
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBoards.count
    }
    
    @IBOutlet weak var tableViewLabel: UILabel!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var current = myBoards[indexPath.row] as! [String: Any]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
//        let description = current["description"]!
//        
//        let image = current["image"] as? [[String:AnyObject]]
//        let imageUrl = image?[0]["url"] as? String
//        print(imageUrl)
//        
//        

    
        cell.textLabel?.text = current["name"] as? String
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return myBoards.count
//        
//    }
//
//    override func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "eachCell")
//        print("cell------ \(cell)")
//        cell?.textLabel?.text = ((myBoards[indexPath.row] as AnyObject).name.string)
//        
//        return cell!
//        
//        
//    }
//    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
   
}
