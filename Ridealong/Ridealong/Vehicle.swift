//
//  Vehicle.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//


import UIKit
import RealmSwift

class Vehicle: Object {
    let types = ["s":"Sedan","t":"Truck","sv":"SUV","c":"Coupe"]
    //Properties
    @objc dynamic var vehicleID: String?
    @objc dynamic var make: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var year: Int = 0
    @objc dynamic var cylinder: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var seats: Int = 4;
    @objc dynamic var isDefault: Bool = false
    
    //Init
    convenience init?(make: String, model: String, year: Int, type: String, isDefault: Bool, seats: Int){
        self.init()
        let date = Date.init(timeIntervalSinceNow: 1)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyyHH:mm:ss"
        let datestring = formatter.string(from: date)
        self.vehicleID = make + model + datestring + String(seats)
        self.type = type
        self.make = make
        self.model = model
        self.year = year
        self.seats = seats
        self.isDefault = isDefault
    
    }
    
    override static func primaryKey() -> String?{
        return "vehicleID"
    }

}
	
