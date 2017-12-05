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
    @objc dynamic var creator: User?
    @objc dynamic var rideID: String?
    @objc dynamic var start: Locations?
    @objc dynamic var destination: Locations?
    @objc dynamic var vehicle: Vehicle?
    @objc dynamic var date: Date = Date(timeIntervalSinceNow: 1)
    var riders: List<User> = List<User>()
    @objc dynamic var notes: String = " "
    var seatsAvailable: List<Bool> = List<Bool>()
    
    convenience init?(creator: User, start: Locations, destination: Locations){
        self.init()
        self.creator = creator
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyyHH:mm:ss"
        let datestring = formatter.string(from: self.date)
        self.rideID = self.creator!.email + datestring
        self.start = start
        self.destination = destination
        self.vehicle = creator.defaultVehicle!
        self.date = Date(timeIntervalSinceNow: 1)
        self.riders = List<User>()
        //first seat is taken by driver
        self.seatsAvailable.append(false)
        for _ in 1..<(self.vehicle?.seats)!{
            self.seatsAvailable.append(true)
//            self.riders.append(User())
        }
        
    }
    override static func primaryKey() -> String?{
        return "rideID"
    }
  
    //func to reserve seat in car, updates the list with a boolean. Will take an int or seat name as a parameter
    func reserveSeat(seatName: String?, seatNum: Int?,rider: User){
        var seatNames: [String] = Array()
        if (self.vehicle?.seats)! == 2{
            seatNames = ["drivers","passengers"]
        }
        else if (self.vehicle?.seats)! == 5{
            seatNames = ["drivers","passengers", "rear left", "rear middle", "rear right"]
        }else if (self.vehicle?.seats)! > 6{
            seatNames = ["drivers","passengers", "middle left", "middle middle","middle right","rear left", "rear middle", "rear right"]
        }
        if seatName != nil{
            self.seatsAvailable.replace(index: (seatNames.index(of: seatName!)!), object: false)
            self.riders.insert(rider, at: seatNames.index(of: seatName!)!)
        }
        if seatNum != nil{
            self.seatsAvailable.replace(index: (seatNum!-1), object: false)
            self.riders.insert(rider, at: seatNames.index(of: seatName!)!)
        }
    }
    
    func unreserveSeat(seatName: String?, seatNum: Int?, rider: User){
        var seatNames: [String] = Array()
        if (self.vehicle?.seats)! == 2{
            seatNames = ["drivers","passengers"]
        }
        else if (self.vehicle?.seats)! == 5{
            seatNames = ["drivers","passengers", "rear left", "rear middle", "rear right"]
        }else if (self.vehicle?.seats)! > 6{
            seatNames = ["drivers","passengers", "middle left", "middle middle","middle right","rear left", "rear middle", "rear right"]
        }
        if seatName != nil{
            self.seatsAvailable.replace(index: (seatNames.index(of: seatName!)!), object: true)
        }
        if seatNum != nil{
            self.seatsAvailable.replace(index: (seatNum!-1), object: true)
        }
    }
    
 }



