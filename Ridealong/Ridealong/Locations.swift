//
//  Locations.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.


import Foundation
import RealmSwift

class Locations: Object {
    
    // Properties
    @objc dynamic var startDest : Date = ""
    @objc dynamic var endDest : Date = ""
    
    convenience init?(startDest: String, endDest: String){
        self.init()
        self.startDest = startDest
        self.endDest = endDest
    }
    
}
