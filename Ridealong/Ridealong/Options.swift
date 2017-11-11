//
//  Options.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift

class Options: Object {
    
    // Properties

    dynamic var smokingAllowed : Bool = false
    dynamic var petsAllowed : Bool = false
    dynamic var gasShare : Bool = false

    convenience init?(smoking: Bool, pets: Bool, gas: Bool){
        self.init()
        self.smokingAllowed = smoking
        self.petsAllowed = pets
        self.gasShare = gas
        
    }
}
