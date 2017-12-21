//
//  MyRidesCell.swift
//  Ridealong
//
//  Created by Simon M. Nielsen on 12/19/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit

@objc protocol MyRidesCellDelegate {
    func provideRating()
}


class MyRidesCell: UICollectionViewCell {
    
    // MARK: - vars -
 
    private var contentFrame: CGRect?
    var delegate: MyRidesCellDelegate?
    
    // MARK: - Outlets  -
    @IBOutlet weak var cellContent: UIView!
    @IBOutlet weak var placeholderImage: UIImageView!
  //  @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var arrowBtn: UIImageView!
    
    private var ride: [rideData] = []
    
    
    // MARK: - overrides -
    override func awakeFromNib() {
        super.awakeFromNib()
       // driverImage.layer.cornerRadius = driverImage.frame.height / 2
     //  driverImage.layer.masksToBounds = true
    }
    
    // MARK: - setup  -
    func setData(driver: driverData) {
        if let image = driver.image {
   //         driverImage.image = image
     //       driverImage.alpha = 1.0
            placeholderImage.isHidden = true
        } else {
           
            placeholderImage.isHidden = false
    //        driverImage.image = nil
      //      driverImage.alpha = 0.0
        }
        destinationLabel.text = driver.displayName
        ride = rideForDriver(withId: driver.rideID)
        for eachRide in ride{
            setData(ride: eachRide)
        }
        
    }
    func setData(ride: rideData) {
        driverName.text = "From: " + ride.from + " " + "To:" + ride.to
    }
    func updateDriverImage(image: UIImage) {
        DispatchQueue.main.async {
        //    self.driverImage.image = image
            UIView.animate(withDuration: 0.4, animations: {
      //          self.driverImage.alpha = 1.0
            }) { (didFinish) in
                self.placeholderImage.isHidden = didFinish
            }
        }
    }
    
    private func rideForDriver(withId ids: [String]) -> [rideData] {
        var rides = [rideData]()
        for ride in demoRides {
            for id in ids {
                if ride.id == id{
                    rides.append(ride)
                    break
                }
            }
        }
        return rides
    }
    
}

