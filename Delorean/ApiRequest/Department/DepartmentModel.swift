//
//  DepartmentModel.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/22/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class DepartmentModel: NSObject {
    
    var id: Int!
    var departmentCode: String!
    var departmentName: String!
    var affiliationName: String!
    var personInCharge: String!
    var update_time: String!
    
    init(id: Int, departmentCode: String, departmentName: String, affiliationName: String, personInCharge: String, update_time: String) {
        self.id = id
        self.departmentCode = departmentCode
        self.departmentName = departmentName
        self.affiliationName = affiliationName
        self.personInCharge = personInCharge
        self.update_time = update_time
    }
    
    func parseToString() -> String {
        return "id: " + String(id) + "\ndepartmentCode: " + departmentCode + "\ndepartmentName: " + departmentName + "\naffiliationName: " + affiliationName + "\npersonInCharge: " + personInCharge + "\nupdate_time: " + update_time
    }
    
//    required convenience init(coder aDecoder: NSCoder) {
//        let id = aDecoder.decodeInteger(forKey: "Id")
//        let departmentCode = aDecoder.decodeObject(forKey: "DepartmentCode") as! String
//        let departmentName = aDecoder.decodeObject(forKey: "DepartmentName") as! String
//        let affiliationName = aDecoder.decodeObject(forKey: "AffiliationName") as! String
//        let personInCharge = aDecoder.decodeObject(forKey: "PersonInCharge") as! String
//        let update_time = aDecoder.decodeObject(forKey: "update_time") as! String
//        self.init(id: id, departmentCode: departmentCode, departmentName: departmentName, affiliationName: affiliationName, personInCharge: personInCharge, update_time: update_time)
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encode(id, forKey: "Id")
//        aCoder.encode(departmentCode, forKey: "DepartmentCode")
//        aCoder.encode(departmentName, forKey: "DepartmentName")
//        aCoder.encode(affiliationName, forKey: "AffiliationName")
//        aCoder.encode(personInCharge, forKey: "PersonInCharge")
//        aCoder.encode(update_time, forKey: "update_time")
//    }
}

