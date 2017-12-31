//
//  FeedTableViewCell.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import MapKit


class FeedTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FeedTableViewCell"
    
    
    //MARK: - properties
    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var placeholderImg: UIImageView!
    private var ride: Ride?
    
    override func prepareForReuse() {
        userPicture.image = nil
    }
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated:
            animated)
    }
    
    func configureWithRide(_ ride: Ride){
        self.ride = ride
        if let profImg = ride.creator?.profileImage{
            userPicture.image = UIImage(data: (profImg) as Data)
            placeholderImg.isHidden = true
            username.text = ((ride.creator?.firstname)! + " " + (ride.creator?.lastname)!)
        }else{
            //placeholderImg.isHidden = false
        }
        if let sloc = ride.start{
            decodeLocation(location: sloc, label: fromLabel)
            decodeLocation(location: ride.destination!, label: toLabel)
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        let datestring = formatter.string(from: ride.date)
        dateLabel.text = datestring
        seatsLabel.text = String(format: "%d", ride.seatsAvailable)
    }
    
    
    func decodeLocation(location: Locations, label: UILabel){
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: location.location_lat, longitude: location.location_long)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            print(placeMark.addressDictionary as Any)
            if let locationName = placeMark.addressDictionary!["Name"] as? String {
                label.text = locationName
            }
            if let street = placeMark.addressDictionary!["Thoroughfare"] as? String {
                print(street)
            }
            if let city = placeMark.addressDictionary!["City"] as? String {
                let ltext = label.text
                label.text = ltext! + " " + city
            }
            
        })
        
    }

}
