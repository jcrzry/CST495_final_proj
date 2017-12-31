//
//  dummyData.swift
//  Ridealong
//
//  Created by jcrzry on 12/3/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift


let names = ["john","matt","colin","sophia","john","kiley","rey","madison"]
var riders = [User]()
var rides = [Ride]()

func AddUsers(){
    let creds = SyncCredentials.usernamePassword(username:"jocruz@csumb.edu",password:"ridealong")
    
    SyncUser.logIn(with: creds, server: SERVER_PATH!){user,error in
        if user != nil{
            //logged in
            print("logged admin in")
            let names = ["john","matt","colin","sophia","john","kiley","rey","madison"]
            let common_config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user!, realmURL: COMMON_REALM_PATH!))
            let cRealm = try! Realm(configuration: common_config)
            for i in 0..<names.count{
                let dummyUser = User(firstname: names[i], lastname: (names[i]+"last"), email: (names[i]+"@csumb.edu"), password: (names[i]+"password"), phone: ("123567890"))
                let v = Vehicle(make: "Audi", model: "A4", year: 2003, type: "Sedan", isDefault: true, seats: 7)
                dummyUser?.addVehicle(vehicle: v!)
                dummyUser?.defaultVehicle = v!
                registerUser(newUser: dummyUser!)
                let begin = Locations(location_lat: 36.652922,location_long: -121.798163, name: "csumb")
                let end = Locations(location_lat: 37.774929, location_long: -122.419416, name: "sf")
                let ride = Ride(creator: dummyUser!, start: begin!, destination: end!)
                try! cRealm.write{
                    cRealm.create(User, value: dummyUser, update: true)
                    cRealm.create(Ride, value: ride, update: true)
                }
            }
            let allrides = cRealm.objects(Ride.self)
            for i in allrides{
                print(i)
            }
        }else{
            print(error ?? "No user found")
        }
    }
}


