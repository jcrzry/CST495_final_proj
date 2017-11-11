//
//  SimpleUser.swift
//  Ridealong
//
//  Created by jcrzry on 11/10/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift


// Properties
class SimpleUser: Object{
    @objc dynamic var username: String = ""
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var profileImage: UIImage?
    @objc dynamic var defaultVehicle: Vehicle?
    
    
    //Initializers
    convenience init?(username: String,firstname: String, lastname: String, email: String){
        self.init()
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
    }
    
    
    override static func primaryKey() -> String?{
        return "username"
    }
    
}
