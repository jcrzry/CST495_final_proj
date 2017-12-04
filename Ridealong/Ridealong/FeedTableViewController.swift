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

class FeedTableViewController: UITableViewController {

    //MARK: Variables
    var items: Results<Ride>!

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        items = (realm.objects(Ride.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FeedCell")
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    //returns the number of how many cells the view should generate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(1)
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel?.text = "Test"
        return cell
    }
    func addTapped(){
        TB.info("add tapped")
        let newViewController = AddRideViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
