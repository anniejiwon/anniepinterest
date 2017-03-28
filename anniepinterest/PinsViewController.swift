//
//  PinsViewController.swift
//  
//
//  Created by ajw on 3/27/17.
//
//

import UIKit
import PinterestSDK

class PinsViewController: UITableViewController {
    
    
    var boardId : String? = ""
    var boardTitle : String? = ""
    var pinId : String? = ""
    var myPins: NSMutableArray = []
    var selectedData = NSDictionary()

    @IBOutlet weak var pinsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        boardId = selectedData.object(forKey: "id") as? String
        
        PDKClient.sharedInstance()
            .getBoardPins(boardId, fields: ["image", "note"], withSuccess: {
                    response in
                
                guard let data = response?.parsedJSONDictionary["data"] as? [[String: Any]]
                    
                else {
                    return
                }

                let list = NSMutableArray()
                for item in data {
                    list.add(item)
                }
                
            
                DispatchQueue.main.async {
                    self.myPins = list
                    self.pinsTableView.reloadData()
                }
                
            }, andFailure: { error in
                    print("failed to load", error ?? "no error")
    
            })
        }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var current = myPins[indexPath.row] as! [String: Any]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pinscustomcell", for: indexPath)
        
        
        //        if let description = current["description"]!
        //
        //        let image = current["image"] as? [[String:AnyObject]]
        //        let imageUrl = image?[0]["url"] as? String
        //        print(imageUrl)

        cell.textLabel?.text = current["name"] as! String?
        
        return cell
    }


}
