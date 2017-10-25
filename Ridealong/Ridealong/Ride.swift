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
    
    dynamic var creator: User = User()
    dynamic var options: Options = Options()
    dynamic var locations: Locations = Locations()
    var vehicle:	 Vehicle = Vehicle()
    
   convenience init?(creator: User, options: Options, locations: Locations){
        self.creator = creator
        self.options = options
        self.locations = locations
        self.vehicle = creator.defaultVehicle
    }
    
 }



