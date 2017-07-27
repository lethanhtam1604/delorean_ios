//
//  GetAttendanceManagerApiRequest.swift
//  Demo
//
//  Created by Tam Huynh on 7/13/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class GetAllDepartmentListApiRequest: ApiRequest{
    
    override init() {
        super.init()
    }
    
    override func getRequestUrl() -> String {
        return "/api/department/getAllDepartment"
    }
    
    override func getContentType() -> String {
        return "application/json"
    }
    
    override func getRequestType() -> String {
        return "GET"
    }
    
    func getAllDepartmentList(completion: @escaping (_ success: Bool, _ data: AnyObject?, _ message: String?) -> ()) {
        
        request(request: clientURLRequest(params: nil)) { (success, object) -> () in
            
            DispatchQueue.main.async(execute: {
                if success {
                    var results: [DepartmentModel] = []
                    
                    if let items = object as? NSArray {
                        for itemDict in items as! [NSDictionary] {
                            let item = DepartmentModel(
                                id: (itemDict.value(forKey: "Id") as? Int)!,
                                departmentCode:(itemDict.value(forKey: "DepartmentCode") as? String)!,
                                departmentName:(itemDict.value(forKey: "DepartmentName") as? String)!,
                                affiliationName:(itemDict.value(forKey: "AffiliationName") as? String)!,
                                personInCharge : (itemDict.value(forKey: "PersonInCharge") as? String)!,
                                update_time:(itemDict.value(forKey: "updated_time") as? String)!
                            )
                            
                            results.append(item)
                        }
                        completion(true, results as AnyObject?, nil)
                    } else {
                        let message = "error"
                        completion(false, nil, message)
                    }
                }

            })
        }
    }
}
