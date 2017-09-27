//
//  ProfilViewController.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 25.09.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit
import TB


class ProfilViewController: UITableViewController{
    var settings = ["Name", "Some" ,"Other" ,"Properties"]

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BackButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        self.present(viewController!, animated: true)

    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return Int(settings.count)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let CellImage = tableView.dequeueReusableCell(withIdentifier: "CellImage", for: indexPath) as UITableViewCell
            CellImage.textLabel?.text = "John Doe"
            if let image = UIImage(named: "ProfilImage.jpeg") {
                            CellImage.imageView?.image = image
                            CellImage.imageView?.cornerRadius = 30
            }
            return CellImage
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = settings[indexPath.row]

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0{
            return 100.0//Choose your custom row height
        }
        return 44.0
    }
}
