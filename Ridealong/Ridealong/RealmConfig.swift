//
//  RealmConfig.swift
//  Ridealong
//
//  Created by jcrzry on 10/11/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift
let serverURL = URL(string: "ec2-52-54-239-17.compute-1.amazonaws.com:9080")

func setDeafaultCondig(username: String){
    var defaultConfig = Realm.Configuration()
    
    //user default directory using username as filename 
    defaultConfig.fileURL! = defaultConfig.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
    
}

func loginUser(username: String, password: String){
    let userCreds = SyncCredentials.usernamePassword(username: username, password: password, register: false)
    SyncUser.logIn(with: userCreds, server: serverURL!){
        user,error in
        if user != nil{
            //
            
        }else if let error = error{
            print(error)
        }
    }
    
}

