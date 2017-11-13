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
    let creds = SyncCredentials.usernamePassword(username:"jocruz@csumb.edu",password:"ridealong")
    
    SyncUser.logIn(with: creds, server: SERVER_PATH!){user,error in
        if user != nil{

            let remoteConfig = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user!, realmURL: COMMON_REALM_PATH!), deleteRealmIfMigrationNeeded: true, objectTypes: [SimpleUser.self,Vehicle.self,Ride.self,Locations.self])
            _ = try! Realm(configuration: remoteConfig)
            let perms = SyncPermission(realmPath: COMMON_REALM_STRING, identity: "*", accessLevel: .read)
            user?.apply(perms){
                error in
                if let error = error{
                    print(error)
                }else{
                    print("read permissions enabled")

                    let wperms = SyncPermission(realmPath: COMMON_REALM_STRING, identity: "*", accessLevel: .write)
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

