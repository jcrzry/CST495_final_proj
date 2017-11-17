//
//  Realm.swift
//  Ridealong
//
//  Created by jcrzry on 9/28/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift

//realm file paths and urls
let COMMON_REALM_PATH = URL(string: "realm://ec2-54-174-95-229.compute-1.amazonaws.com:9080/CommonRealm")
let COMMON_REALM_STRING = "http://ec2-54-174-95-229.compute-1.amazonaws.com:9080/CommonRealm"
let SERVER_PATH = URL(string: "http://ec2-54-174-95-229.compute-1.amazonaws.com:9080")
let PRIVATE_REALM_PATH = URL(string:"realm://ec2-54-174-95-229.compute-1.amazonaws.com:9080/~/PrivateRealm")


func setDefaultConfiguration(realmUser: SyncUser)    {
    let defaultConfig = Realm.Configuration(syncConfiguration:SyncConfiguration(user: realmUser, realmURL: PRIVATE_REALM_PATH!), deleteRealmIfMigrationNeeded: true,objectTypes:[User.self, SimpleUser.self,Vehicle.self,Ride.self,Locations.self,Rating.self])
    //set de    fault realm as privaterealm
    Realm.Configuration.defaultConfiguration = defaultConfig
    print("defaulf config updated")
}

var loginFailed = false
func loginUser(username: String, password: String){
    let userCreds = SyncCredentials.usernamePassword(username: username, password: password, register: false)
    SyncUser.logIn(with: userCreds, server: SERVER_PATH!){
        user,error in
        if user != nil{
            print("login successful!")
        }else if let error = error{
            print(error)
            //if this is set, then user credentials are not correct
            loginFailed = true
        }
    }
    
}

func registerUser(newUser: User){
    print("before registration")
    //emails will be used as registered username in realm, as they are already unique, else error is thrown.
    let userCreds = SyncCredentials.usernamePassword(username: newUser.email, password: newUser.password, register: true)
    SyncUser.logIn(with: userCreds, server: SERVER_PATH!){
        user, error in
        if user != nil{
            //setDefaultConfiguration(realmUser:user!)
            print("inside register block")
            let privateConfig = Realm.Configuration(syncConfiguration:SyncConfiguration(user: user!, realmURL: PRIVATE_REALM_PATH!), deleteRealmIfMigrationNeeded: true,objectTypes:[User.self, SimpleUser.self,Vehicle.self,Ride.self,Locations.self,Rating.self])
            //realm opened to create users private realm
            let defaultRealm = try! Realm(configuration:privateConfig)
            try! defaultRealm.write{
                defaultRealm.add(newUser)
            }
            print("registered! User added to private Realm")
            let registerStatus:[String: Bool] = ["loginFailed":true]
            NotificationCenter.default.post(name:NSNotification.Name(rawValue:"registerFailed"),object:nil, userInfo: registerStatus)

        }else if let error = error{
            print(error)
            //if this variable is set, then that means that a user already exists for given username
            let registerStatus:[String: Bool] = ["loginFailed":true]
            NotificationCenter.default.post(name:NSNotification.Name(rawValue:"registerFailed"),object:nil, userInfo: registerStatus)
        }
    }
}




// todo things that are neccessary when login is completed.

func getCommonRealm() -> Realm{
    print(SyncUser.current!)
    let common_config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: COMMON_REALM_PATH!))
    let commonRealm = try! Realm(configuration: common_config)
    return commonRealm
}

func getPrivateRealm()->Realm{
    
    
    return try! Realm()
}
