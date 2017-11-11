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

func regularLogin(username: String, password: String){
    let userCred = SyncCredentials.usernamePassword(username: username, password: password,register: false)
    SyncUser.logIn(with: userCred, server: SERVER_PATH!, onCompletion: {user,error in
        if user != nil{
            print("user logged in")
	
        }
    })
}

func registerUser(username: String, password: String){
    let regCreds = SyncCredentials.usernamePassword(username: username, password: password, register: true)
    SyncUser.logIn(with: regCreds, server: SERVER_PATH!, onCompletion: {user , error in
        if user != nil{
            //let syncConfig = Realm.Configuration(SyncConfiguration(user:user,realmURL:serverURL!))
            //let syncRealm = try! Realm(configuration: syncConfig)
        } else if let error = error{
            print(error)
        }
        
    })
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
