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
func setDefaultRealmForUser(username: String){
    var config = Realm.Configuration()
    config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
    
    Realm.Configuration.defaultConfiguration = config
}

//func commonRealmConfig(current_user: SyncUser)-> Realm.Configuration{
 //   let config = Realm.Configuration(SyncConfiguration(user: current_user, realmURL: sharedRealm!))
//}


func regularLogin(username: String, password: String){
    let userCred = SyncCredentials.usernamePassword(username: username, password: password,register: false)
    SyncUser.logIn(with: userCred, server: serverURL!, onCompletion: {user,error in
        if user != nil{
            
        }
    
    
    })
    
  
    
}



func registerUser(username: String, password: String){
    let regCreds = SyncCredentials.usernamePassword(username: username, password: password, register: true)
    SyncUser.logIn(with: regCreds, server: serverURL!, onCompletion: {user , error in
        if user != nil{
            //let syncConfig = Realm.Configuration(SyncConfiguration(user:user,realmURL:serverURL!))
            //let syncRealm = try! Realm(configuration: syncConfig)
        } else if let error = error{
            print(error)
        }
        
    })
}


func facebookLogin(fb_token: String){
    let fbCredentials = SyncCredentials.google(token: fb_token)
    SyncUser.logIn(with: fbCredentials, server: serverURL!, onCompletion: {
        user, error in
        if user != nil{
            //let syncConfig = Realm.Configuration(SyncConfiguration(user:user,realmURL:serverURL!))
            //let syncRealm = try! Realm(configuration: syncConfig)
        } else if let error = error{
            print(error)
        }})

}


func googleLogin(g_token: String){
    let gCredentials = SyncCredentials.google(token: g_token)
    SyncUser.logIn(with: gCredentials, server: serverURL!, onCompletion: {
        user, error in
        if user != nil{
            //let syncConfig = Realm.Configuration(SyncConfiguration(user:user,realmURL:serverURL!))
            //let syncRealm = try! Realm(configuration: syncConfig)
        } else if let error = error{
            print(error)
        }})
    
}



// todo things that are neccessary when login is completed.

