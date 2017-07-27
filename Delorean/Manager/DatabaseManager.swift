//
//  DatabaseManager.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/21/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import FMDB


class DatabaseManager: NSObject {

    static let sharedInstance = DatabaseManager()

    var database: FMDatabase!
    
    static func getInstance() -> DatabaseManager
    {
        if(sharedInstance.database == nil) {
            sharedInstance.database = FMDatabase(path: Utils.getPath(fileName: "Delorean.db"))
        }
        return sharedInstance
    }
}
