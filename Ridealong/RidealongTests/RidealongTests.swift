//
//  RidealongTests.swift
//  RidealongTests
//
//  Created by Jonas Deichelmann on 12.09.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Ridealong

class RidealongTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testAddUsers(){
        let creds = SyncCredentials.usernamePassword(username:"jocruz@csumb.edu",password:"ridealong")
        
        SyncUser.logIn(with: creds, server: SERVER_PATH!){user,error in
            if user != nil{
                //logged in
                print("logged admin in")
                let names = ["john","matt","colin","sophia","john","kiley","rey","madison"]
                var riders = [User]()
                var rides = [Ride]()
                let common_config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user!, realmURL: COMMON_REALM_PATH!))
                let cRealm = try! Realm(configuration: common_config)
                for i in 0..<names.count{
                    var dummyUser = User(firstname: names[i], lastname: (names[i]+"last"), email: (names[i]+"@csumb.edu"), password: (names[i]+"password"), phone: ("123567890"))
                    var v = Vehicle(make: "Audi", model: "A4", year: 2003, type: "Sedab", isDefault: true)
                    dummyUser?.addVehicle(name: "Audi", vehicle: v!)
                    dummyUser?.defaultVehicle = v
                    //registerUser(newUser: dummyUser!)
                    riders.append(dummyUser!)
                    var begin = Locations(location_lat: 36.652922,location_long: -121.798163, name: "csumb")
                    var end = Locations(location_lat: 37.774929, location_long: -122.419416, name: "sf")
                    var ride = Ride(creator: riders[i], start: begin!, destination: end!)
                    try! cRealm.write{
                        cRealm.create(User, value: dummyUser, update: true)
                        cRealm.create(Ride, value: ride, update: true)
                    }
                }
                let allrides = cRealm.objects(Ride)
                XCTAssertNotNil(allrides, "allrides turned up empty.")
            }else{
                print(error ?? "No user found")
            }
        }
        
        
            
}
}
