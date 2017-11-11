//
//  FeedTableViewController.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

private let reuseIdentifier = "Cell"

class FeedTableViewController: UITableViewController {

    

//    var rides: RLMArray<RLMObject>{
//        get {
//            //return Ride.allObjects()
//        }
//    }

    var items: Results<Ride>!

    //func to register cell to be dequeued by the tableview
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        let test = NSPredicate(format: "ride = %@", "title")
        items = (realm.objects(Ride.self).filter(test))

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FeedCell") // [1]
       // print(items[0].locations)
    }
    
    //reload the data to see the latest array fetched by allObjects()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    //returns the number of how many cells the view should generate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(1)
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath as IndexPath) as UITableViewCell
        
        //let index = UInt(indexPath.row)
        
        //fetch object from database at current index
      //  let ride = rides.objectAtIndex(index) as Ride
        cell.textLabel?.text = items.description

        return cell
    }
    
    
    
}
