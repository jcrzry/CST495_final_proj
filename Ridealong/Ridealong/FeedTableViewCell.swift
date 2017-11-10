//
//  FeedTableViewCell.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
private let reuseIdentifier = "FeedCell"

class FeedTableViewCell: UITableViewCell {

    @IBOutlet var lblDate: UILabel?
    @IBOutlet var lblLocationStart: UILabel?
    @IBOutlet var lblLocationEnd: UILabel?
    @IBOutlet var lblTime: UILabel?
    @IBOutlet var profileImg: UIImageView?
    @IBOutlet var lblName: UILabel?
    
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated:
            animated)

/* var ride: Ride? {
        var locations: Locations? {
            var rating: Rating? {
                var user: User? {
                    didSet {
                        guard ride != nil else { return }
                        guard let locations = locations else {return}
                        guard rating != nil else {return}
                        guard user != nil else {return}
                        
                        
                        lblLocationStart?.text = locations.locationStart
                        lblLocationEnd?.text = locations.locationEnd

                        //Thinking about a smart model for displaying the name after a ride is created.
                        //profileImg?.image = user.profileImage
                       // lblName?.text = ride.returnRiderName
                    }
                }
        }
   }
}*/

    }

}
