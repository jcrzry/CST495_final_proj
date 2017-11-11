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
            let remoteConfig = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user!, realmURL: crURL!), objectTypes: [SimpleUser.self,Vehicle.self,Ride.self,Locations.self])
            _ = try! Realm(configuration: remoteConfig)
            let perms = SyncPermission(realmPath: commonUrlString, identity: "*", accessLevel: .read)
            user?.apply(perms){
                error in
                if let error = error{
                    print(error)
                }else{
                    print("read permissions enabled")
                    let wperms = SyncPermission(realmPath: commonUrlString, identity: "*", accessLevel: .write)	
                    user?.apply(wperms){
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

