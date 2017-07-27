//
//  PosSessionDAO.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 11/9/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import FMDB

class PosSessionDAO {

    func add(posSession: PosSession) -> Int {
        DatabaseManager.getInstance().database.open()
        DatabaseManager.getInstance().database.executeUpdate("INSERT INTO PosSession (start_at, stop_at, status_id, site_id, created_time, updated_time, created_by_id, updated_by_id, del_flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: createParameters(posSession: posSession))
        let id = getLastInsertRowId()
        DatabaseManager.getInstance().database.close()
        return id
    }
    
    func update(posSession: PosSession) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isUpdated = DatabaseManager.getInstance().database.executeUpdate("UPDATE PosSession SET start_at=?, stop_at=?, status_id=?, site_id=?, created_time=?, updated_time=?, created_by_id=?, updated_by_id=?, del_flag=? WHERE id=" + String(posSession.id), withArgumentsIn: createParameters(posSession: posSession))
        DatabaseManager.getInstance().database.close()
        return isUpdated
    }
    
    func delete(posSession: PosSession) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isDeleted = DatabaseManager.getInstance().database.executeUpdate("DELETE FROM PosSession WHERE id=?", withArgumentsIn: [posSession.id])
        DatabaseManager.getInstance().database.close()
        return isDeleted
    }
    
    func getAll() -> [PosSession] {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PosSession", withArgumentsIn: nil)
        var result = [PosSession]()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result.append(createPosSession(resultSet: resultSet))
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    func getByID(posSessionID: Int) -> PosSession {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PosSession WHERE id=?", withArgumentsIn: [posSessionID])
        var result = PosSession()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result = createPosSession(resultSet: resultSet)
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    private func createPosSession(resultSet: FMResultSet) -> PosSession {
        let posSession = PosSession()
        posSession.id = Int(resultSet.int(forColumn: "id"))
        posSession.startAt = resultSet.string(forColumn: "start_at")
        posSession.stopAt = resultSet.string(forColumn: "stop_at")
        posSession.statusID = Int(resultSet.int(forColumn: "status_id"))
        posSession.siteID = Int(resultSet.int(forColumn: "site_id"))
        posSession.createdTime = resultSet.string(forColumn: "created_time")
        posSession.updatedTime = resultSet.string(forColumn: "updated_time")
        posSession.createdByID = Int(resultSet.int(forColumn: "created_by_id"))
        posSession.updatedByID = Int(resultSet.int(forColumn: "updated_by_id"))
        posSession.delFlag = Int(resultSet.int(forColumn: "del_flag"))
        return posSession
    }
    
    private func createParameters(posSession: PosSession) -> [AnyObject] {
        var parameters = [AnyObject]()
        parameters.append(posSession.startAt as AnyObject)
        parameters.append(posSession.stopAt as AnyObject)
        parameters.append(posSession.statusID as AnyObject)
        parameters.append(posSession.siteID as AnyObject)
        parameters.append(posSession.createdTime as AnyObject)
        parameters.append(posSession.updatedTime as AnyObject)
        parameters.append(posSession.createdByID as AnyObject)
        parameters.append(posSession.updatedByID as AnyObject)
        parameters.append(posSession.delFlag as AnyObject)
        return parameters
    }
    
    private func getLastInsertRowId() -> Int {
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT id FROM PosSession WHERE id = (SELECT MAX(id) FROM PosSession)", withArgumentsIn: nil)
        
        var id = 0
        if (resultSet != nil) {
            while resultSet.next() {
                id = Int(resultSet.int(forColumn: "id"))
            }
        }
        return id
    }

}
