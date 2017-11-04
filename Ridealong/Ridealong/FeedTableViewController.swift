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

    
 //   var rides: RLMArray<RLMObject>{
   //     get {
     //       return 0 //Ride.allObjects()
       // }
    //}
    
    //func to register cell to be dequeued by the tableview
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FeedCell") // [1]
    }
    
    //reload the data to see the latest array fetched by allObjects()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    
    
}
