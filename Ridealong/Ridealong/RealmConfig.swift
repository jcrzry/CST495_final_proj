//
//  RealmConfig.swift
//  Ridealong
//
//  Created by jcrzry on 10/11/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift
let COMMON_REALM_PATH = URL(string: "http://ec2-52-54-239-17.compute-1.amazonaws.com:9080/CommonRealm")
let COMMON_REALM_STRING = "http://ec2-52-54-239-17.compute-1.amazonaws.com:9080/CommonRealm"
let SERVER_PATH = URL(string: "http://ec2-52-54-239-17.compute-1.amazonaws.com:9080")
let PRIVATE_REALM_PATH = URL(string:"http://ec2-52-54-239-17.compute-1.amazonaws.com:9080/~/PrivateRealm")


func setDefaultConfiguration(realmUser: SyncUser)	{
    let defaultConfig = Realm.Configuration(syncConfiguration:SyncConfiguration(user: realmUser, realmURL: PRIVATE_REALM_PATH!), objectTypes:[User.self, SimpleUser.self,Vehicle.self,Ride.self,Locations.self,Rating.self])
    //set de	fault realm as privaterealm
    Realm.Configuration.defaultConfiguration = defaultConfig
    
}

func loginUser(username: String, password: String){
    let userCreds = SyncCredentials.usernamePassword(username: username, password: password, register: false)
    SyncUser.logIn(with: userCreds, server: SERVER_PATH!){
        user,error in
        if user != nil{
            print("login successful!")
        }else if let error = error{
            print(error)
        }
    }
    
}

func registerUser(newUser: User){
    let userCreds = SyncCredentials.usernamePassword(username: newUser.username, password: newUser.password, register: true)
    SyncUser.logIn(with: userCreds, server: SERVER_PATH!){
        user, error in
        if user != nil{
            setDefaultConfiguration(realmUser:user!)
            _ = try! Realm()
            print("registered!")
        }else if let error = error{
            print(error)
        }
    }
}
