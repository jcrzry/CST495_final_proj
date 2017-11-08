//
//  Ride.swift
//  Ridealong
//
//  Created by SImon Nielsen on 28/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//


import Foundation
import RealmSwift

class Ride: Object {
    
    dynamic var creator: User?
    dynamic var locations: Locations?
    var vehicle:	 Vehicle?
    var date: Date = Date(timeIntervalSinceNow: 1)
    
   convenience init?(creator: User, locations: Locations){
    self.init()
        self.creator = creator
        self.locations = locations
        self.vehicle = creator.defaultVehicle!
        self.date = Date(timeIntervalSinceNow: 1)
    
    }
    
    
 }



