//
//  User.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import Realm

class User: RLMObject {

    
    // Properties
    var username : String?
    var firstName : String?
    var lastName : String?
    var email : String?
    var bio : String?
    var profileImage : NSObjectFileImage?
    var vehicle = Vehicle()
  
 
    
    
}
