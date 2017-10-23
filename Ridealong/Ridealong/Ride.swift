//
//  Ride.swift
//  Ridealong
//
//  Created by SImon Nielsen on 28/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import Realm
class Ride: RLMObject {

    var user = User()
    //var options = Options()
    var locations = Locations()
    var date: String?
    var time: String?
    
}



