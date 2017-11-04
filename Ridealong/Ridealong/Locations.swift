//
//  Locations.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.


import Foundation
import Realm
import RealmSwift


class Locations: Object {
    
    // Properties
    @objc dynamic var locationStart: String = ""
    @objc dynamic var locationEnd : String = ""
    
    convenience init?(locationStart: String, locationEnd: String){
        self.init()
        self.locationStart = locationStart
        self.locationEnd = locationEnd
    }
    
}
