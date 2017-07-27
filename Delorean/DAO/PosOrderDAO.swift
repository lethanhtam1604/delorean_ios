//
//  PosOrderDAO.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/24/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import FMDB

class PosOrderDAO {
    
    func add(posOrder: PosOrder) -> Int {
        DatabaseManager.getInstance().database.open()
        DatabaseManager.getInstance().database.executeUpdate("INSERT INTO PosOrder (total_amount, total_quantity, t_point_amount, payment_id, created_time, updated_time, created_by_id, updated_by_id, del_flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: createParameters(posOrder: posOrder))
        let id = getLastInsertRowId()
        DatabaseManager.getInstance().database.close()
        return id
    }
    
    func update(posOrder: PosOrder) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isUpdated = DatabaseManager.getInstance().database.executeUpdate("UPDATE PosOrder SET total_amount=?, total_quantity=?, t_point_amount=?, payment_id=?, created_time=?, updated_time=?, created_by_id=?, updated_by_id=?, del_flag=? WHERE id=" + String(posOrder.id), withArgumentsIn: createParameters(posOrder: posOrder))
        DatabaseManager.getInstance().database.close()
        return isUpdated
    }
    
    func delete(posOrder: PosOrder) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isDeleted = DatabaseManager.getInstance().database.executeUpdate("DELETE FROM PosOrder WHERE id=?", withArgumentsIn: [posOrder.id])
        DatabaseManager.getInstance().database.close()
        return isDeleted
    }
    
    func getAll() -> [PosOrder] {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PosOrder", withArgumentsIn: nil)
        var result = [PosOrder]()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result.append(createPosOrder(resultSet: resultSet))
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    func getByID(posOrderID: Int) -> PosOrder {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PosOrder WHERE id=?", withArgumentsIn: [posOrderID])
        var result = PosOrder()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result = createPosOrder(resultSet: resultSet)
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    private func createPosOrder(resultSet: FMResultSet) -> PosOrder {
        let posOrder = PosOrder()
        posOrder.id = Int(resultSet.int(forColumn: "id"))
        posOrder.totalAmount = Int(resultSet.int(forColumn: "total_amount"))
        posOrder.totalQuantity = Int(resultSet.int(forColumn: "total_quantity"))
        posOrder.tPointAmount = Int(resultSet.int(forColumn: "t_point_amount"))
        posOrder.paymentID = Int(resultSet.int(forColumn: "payment_id"))
        posOrder.createdTime = resultSet.string(forColumn: "created_time")
        posOrder.updatedTime = resultSet.string(forColumn: "updated_time")
        posOrder.createdByID = Int(resultSet.int(forColumn: "created_by_id"))
        posOrder.updatedByID = Int(resultSet.int(forColumn: "updated_by_id"))
        posOrder.delFlag = Int(resultSet.int(forColumn: "del_flag"))
        return posOrder
    }
    
    private func createParameters(posOrder: PosOrder) -> [AnyObject] {
        var parameters = [AnyObject]()
        parameters.append(posOrder.totalAmount as AnyObject)
        parameters.append(posOrder.totalQuantity as AnyObject)
        parameters.append(posOrder.tPointAmount as AnyObject)
        parameters.append(posOrder.paymentID as AnyObject)
        parameters.append(posOrder.createdTime as AnyObject)
        parameters.append(posOrder.updatedTime as AnyObject)
        parameters.append(posOrder.createdByID as AnyObject)
        parameters.append(posOrder.updatedByID as AnyObject)
        parameters.append(posOrder.delFlag as AnyObject)
        return parameters
    }
    
    private func getLastInsertRowId() -> Int{
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT id FROM PosOrder WHERE id = (SELECT MAX(id) FROM PosOrder)", withArgumentsIn: nil)
        
        var id = 0
        if (resultSet != nil) {
            while resultSet.next() {
                id = Int(resultSet.int(forColumn: "id"))
            }
        }
        return id
    }
}
