//
//  RealmConfig.swift
//  Ridealong
//
//  Created by jcrzry on 10/11/17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import RealmSwift

func setDeafaultCondig(username: String){
    var defaultConfig = Realm.Configuration()
    
    //user default directory using username as filename 
    defaultConfig.fileURL! = defaultConfig.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
    
}
