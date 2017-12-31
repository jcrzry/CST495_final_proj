//
//  Locations.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.


import Foundation
import Realm
import RealmSwift
import CoreLocation

class Locations: Object {
    
    // Properties
    @objc dynamic var locationID: String = "0.0-0.0"
    @objc dynamic var location_lat: Double = 0.0
    @objc dynamic var location_long: Double = 0.0
    @objc dynamic var name: String?
    
    convenience init?(location_lat: Double, location_long: Double, name: String?){
        self.init()
        self.location_lat = location_lat
        self.location_long = location_long
        self.name = name
        self.locationID = String(format: "%f", location_long) + "-" + String(format: "%f", location_lat)

    }
    
    convenience init?(cLocation: CLLocation){
        self.init()
        self.location_lat = cLocation.coordinate.latitude
        self.location_long = cLocation.coordinate.longitude
        self.locationID = String(format: "%f", cLocation.coordinate.longitude) + "-" + String(format: "%f", cLocation.coordinate.latitude)
    }
    
    override static func primaryKey() -> String?{
        return "locationID"
    }
}
