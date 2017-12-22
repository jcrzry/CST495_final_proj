//
//  SettingsViewController.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 25.09.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit
import TB

class SettingsViewController: UITableViewController{
    var settings = ["Profile", "Feedback" ,"Contact" ,"Licences"]
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableView Functions

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return Int(settings.count)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        if (indexPath.row == 0){
        cell.textLabel?.text = settings[indexPath.row]
        } else {
       // cell.textLabel?.text = rideLog[indexPath.row]
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Profil", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            self.present(viewController!, animated: true)
        }
    }
}
