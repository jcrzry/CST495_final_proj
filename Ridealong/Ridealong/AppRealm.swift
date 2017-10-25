//
//  Realm.swift
//  Ridealong
//
//  Created by jcrzry on 9/28/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift

//let sharedRealmURL = URL("https://	")
func setDefaultRealmForUser(username: String){
    var config = Realm.Configuration()
    config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
    
    Realm.Configuration.defaultConfiguration = config
}

let defaultRealm = try! Realm(configuration: config)

class AppRealm: Realm{
    
    
}

func openRealm(name: Realm.Configuration){
    let realm = Realm.Configuration(configuration: name)
}
