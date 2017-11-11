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
    
    dynamic var creator: SimpleUser?
    dynamic var start: Locations?
    dynamic var destination: Locations?
    var vehicle:	 Vehicle?
    var date: Date = Date(timeIntervalSinceNow: 1)
    var riders: List<SimpleUser> = List<SimpleUser>()
    convenience init?(creator: SimpleUser, start: Locations, destination: Locations){
    self.init()
        self.creator = creator
        self.start = start
        self.destination = destination
        self.vehicle = creator.defaultVehicle!
        self.date = Date(timeIntervalSinceNow: 1)
        self.riders = List<SimpleUser>()
    }
    
    func addRider(rider: SimpleUser){
        self.riders.append(rider)
    }
    
    func remove(rider: SimpleUser){
        let remove_index = self.riders.index(of: rider)
        self.riders.remove(at: remove_index!)
    }
    
 }



