//
//  RealmConfig.swift
//  Ridealong
//
//  Created by jcrzry on 10/11/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift

func setDefaultConfiguration(realmUser: SyncUser)	{
    let defaultConfig = Realm.Configuration(syncConfiguration:SyncConfiguration(user: realmUser, realmURL: PRIVATE_REALM_PATH!), deleteRealmIfMigrationNeeded: true,objectTypes:[User.self, SimpleUser.self,Vehicle.self,Ride.self,Locations.self,Rating.self])
    //set de	fault realm as privaterealm
    Realm.Configuration.defaultConfiguration = defaultConfig
    print("defaulf config updated")
}



