//
//  Realm.swift
//  Ridealong
//
//  Created by jcrzry on 9/28/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift


let crURL = URL(string: "realm://ec2-54-174-95-229.compute-1.amazonaws.com:9080/CommonRealm")
let commonUrlString = "realm://ec2-54-174-95-229.compute-1.amazonaws.com:9080/CommonRealm"
let serv = URL(string: "http://ec2-54-174-95-229.compute-1.amazonaws.com:9080")
let privateRealm = URL(string: "http://ec2-54-174-95-229.compute-1.amazonaws.com:9080")

func loginUser(username: String, password: String){
    let userCreds = SyncCredentials.usernamePassword(username: username, password: password, register: false)
    SyncUser.logIn(with: userCreds, server: SERVER_PATH!){
        user,error in
        if user != nil{
            print("login successful!")
        }else if let error = error{
            print(error)
            //if this is set, then user credentials are not correct
            let loginFailed = true
        }
    }
    
}

func registerUser(username: String, password: String){
    print("before registration")
    let userCreds = SyncCredentials.usernamePassword(username: username, password: password, register: true)
    SyncUser.logIn(with: userCreds, server: SERVER_PATH!){
        user, error in
        if user != nil{
            //setDefaultConfiguration(realmUser:user!)
            print("inside register block")
            let privateConfig = Realm.Configuration(syncConfiguration:SyncConfiguration(user: user!, realmURL: PRIVATE_REALM_PATH!), deleteRealmIfMigrationNeeded: true,objectTypes:[User.self, SimpleUser.self,Vehicle.self,Ride.self,Locations.self,Rating.self])
            let defaultRealm = try! Realm(configuration:privateConfig)
            print("registered!")
        }else if let error = error{
            print(error)
            //if this variable is set, then that means that a user already exists for given username
            let registerFailed = true
        }
    }
}

// todo things that are neccessary when login is completed.

func getCommonRealm() -> Realm{
    let common_config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: SERVER_PATH!))
    let commonRealm = try! Realm(configuration: common_config)
    return commonRealm
}

func getPrivateRealm()->Realm{
    
    
    return try! Realm()
}
