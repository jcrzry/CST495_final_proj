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
    dynamic var key: String?
    dynamic var start: Locations?
    dynamic var destination: Locations?
    var vehicle:	 Vehicle?
    var date: Date = Date(timeIntervalSinceNow: 1)
    var riders: List<User> = List<User>()
    convenience init?(creator: User, start: Locations, destination: Locations){
    self.init()
        self.creator = creator
        self.start = start
        self.destination = destination
        self.vehicle = creator.defaultVehicle!
        self.date = Date(timeIntervalSinceNow: 1)
        self.riders = List<User>()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyyHH:mm:ss"
        var datestring = formatter.string(from: self.date)
        self.key = self.creator!.email + datestring
    }
    
    override static func primaryKey() -> String?{
        return "key"
    }
    
    func addRider(rider: User){
        self.riders.append(rider)
    }
    
    func remove(rider: User){
        let remove_index = self.riders.index(of: rider)
        self.riders.remove(at: remove_index!)
    }
    
    
    
 }



