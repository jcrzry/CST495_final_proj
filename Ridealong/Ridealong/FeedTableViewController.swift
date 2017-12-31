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
import TB

class FeedTableViewController: UITableViewController{
    
    fileprivate var rides: [Ride]!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        rides = getCommonRealm().objects(Ride.self).toArray() as! [Ride]
        print("rides found..")
        print(rides)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.reuseIdentifier)
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    //returns the number of how many cells the view should generate
  
    func addTapped(){
        TB.info("add tapped")
        let newViewController = AddRideViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
//MARK: - Tableview methods
extension FeedTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return rides.count
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseIdentifier, for: indexPath as IndexPath) as! FeedTableViewCell
            let ride = rides[indexPath.row]
            cell.configureWithRide(ride)
            return cell
    }
}
   

