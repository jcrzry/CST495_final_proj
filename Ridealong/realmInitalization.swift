//
//  realmInitalization.swift
//  
//
//  Created by jcrzry on 11/1/17.
//
//

import Foundation
import RealmSwift

func initCommonRealm(){
    //: Playground - noun: a place where people can play
    let crURL = URL(string: "http://ec2-52-54-239-17.compute-1.amazonaws.com:9080/CommonRealm")
    let commonUrlString = "http://ec2-52-54-239-17.compute-1.amazonaws.com:9080/CommonRealm"
    let serv = URL(string: "http://ec2-52-54-239-17.compute-1.amazonaws.com:9080")
    let creds = SyncCredentials.usernamePassword(username:"jocruz@csumb.edu",password:"ridealong")
    
    SyncUser.logIn(with: creds, server: serv!){user,error in
        if user != nil{
           let remoteConfig = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user!, realmURL: crURL!))
            let sRealm = try! Realm(configuration: remoteConfig)
            let perms = SyncPermissionValue(realmPath: commonUrlString, userID: "*", accessLevel: .read)
            user?.applyPermission(perms){
                error in
                if let error = error{
                    print(error)
                }else{
                    print("read permissions enabled")
                    let wperms = SyncPermissionValue(realmPath: commonUrlString, userID: "*", accessLevel: .write)
                    user?.applyPermission(wperms){
                        error in
                        if let error = error{
                            print(error)
                        }else{
                            print("write permissions enabled")
                        }
                    }
                }
            }
            
        }else{
            print(error ?? "No user found")
        }
    }
    
}
