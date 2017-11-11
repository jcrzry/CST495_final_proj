//
//  RealmConfig.swift
//  Ridealong
//
//  Created by jcrzry on 10/11/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift
let COMMON_REALM_PATH = URL(string: "realm://ec2-54-174-95-229.compute-1.amazonaws.com:9080/CommonRealm")
let COMMON_REALM_STRING = "http://ec2-54-174-95-229.compute-1.amazonaws.com:9080/CommonRealm"
let SERVER_PATH = URL(string: "http://ec2-54-174-95-229.compute-1.amazonaws.com:9080")
let PRIVATE_REALM_PATH = URL(string:"realm://ec2-54-174-95-229.compute-1.amazonaws.com:9080/~/PrivateRealm")


func setDefaultConfiguration(realmUser: SyncUser)	{
    let defaultConfig = Realm.Configuration(syncConfiguration:SyncConfiguration(user: realmUser, realmURL: PRIVATE_REALM_PATH!), deleteRealmIfMigrationNeeded: true,objectTypes:[User.self, SimpleUser.self,Vehicle.self,Ride.self,Locations.self,Rating.self])
    //set de	fault realm as privaterealm
    Realm.Configuration.defaultConfiguration = defaultConfig
    print("defaulf config updated")
}



