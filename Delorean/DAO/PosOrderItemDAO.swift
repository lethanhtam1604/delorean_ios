//
//  PosOrderItemDAO.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/21/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import FMDB

class PosOrderItemDAO {

    func add(posOrderItem: PosOrderItem) -> Int {
        DatabaseManager.getInstance().database.open()
        DatabaseManager.getInstance().database.executeUpdate("INSERT INTO PosOrderItem (product_id, product_quantity, product_discount, product_tax, sub_total_wo_tax, sub_total_inc_tax, created_time, updated_time, created_by_id, updated_by_id, pos_order_id, del_flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: createParameters(posOrderItem: posOrderItem))
        let id = getLastInsertRowId()
        DatabaseManager.getInstance().database.close()
        return id
    }
    
    func update(posOrderItem: PosOrderItem) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isUpdated = DatabaseManager.getInstance().database.executeUpdate("UPDATE PosOrderItem SET product_id=?, product_quantity=?, product_discount=?, product_tax=?, sub_total_wo_tax=?, sub_total_inc_tax=?, created_time=?, updated_time=?, created_by_id=?, updated_by_id=?, pos_order_id=?, del_flag=? WHERE id=" + String(posOrderItem.id), withArgumentsIn: createParameters(posOrderItem: posOrderItem))
        DatabaseManager.getInstance().database.close()
        return isUpdated
    }
    
    func delete(posOrderItem: PosOrderItem) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isDeleted = DatabaseManager.getInstance().database.executeUpdate("DELETE FROM PosOrderItem WHERE id=?", withArgumentsIn: [posOrderItem.id])
        DatabaseManager.getInstance().database.close()
        return isDeleted
    }
    
    func getAll() -> [PosOrderItem] {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PosOrderItem", withArgumentsIn: nil)
        var result = [PosOrderItem]()

        if (resultSet != nil) {
            while resultSet.next() {
                result.append(createPosOrderItem(resultSet: resultSet))
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    func getByID(posOrderItemID: Int) -> PosOrderItem {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PosOrderItem WHERE id=?", withArgumentsIn: [posOrderItemID])
        var result = PosOrderItem()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result = createPosOrderItem(resultSet: resultSet)
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    func getListByOrderID(posOrderID: Int) -> [PosOrderItem] {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PosOrderItem WHERE pos_order_id=?", withArgumentsIn: [posOrderID])
        var result = [PosOrderItem]()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result.append(createPosOrderItem(resultSet: resultSet))
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    private func createPosOrderItem(resultSet: FMResultSet) -> PosOrderItem {
        let posOrderItem = PosOrderItem()
        posOrderItem.id = Int(resultSet.int(forColumn: "id"))
        
        let productDAO = ProductDAO()
        posOrderItem.product = productDAO.getByID(productID: Int(resultSet.int(forColumn: "product_id")))
        
        posOrderItem.productQuantity = Int(resultSet.int(forColumn: "product_quantity"))
        posOrderItem.productDiscount = Int(resultSet.int(forColumn: "product_discount"))
        posOrderItem.productTax = Int(resultSet.int(forColumn: "product_tax"))
        posOrderItem.subTotalWithoutTax = Int(resultSet.int(forColumn: "sub_total_wo_tax"))
        posOrderItem.subTotalTax = Int(resultSet.int(forColumn: "sub_total_inc_tax"))
        posOrderItem.createdTime = resultSet.string(forColumn: "created_time")
        posOrderItem.updatedTime = resultSet.string(forColumn: "updated_time")
        posOrderItem.createdByID = Int(resultSet.int(forColumn: "created_by_id"))
        posOrderItem.updatedByID = Int(resultSet.int(forColumn: "updated_by_id"))
        posOrderItem.posOrderID = Int(resultSet.int(forColumn: "pos_order_id"))
        posOrderItem.delFlag = Int(resultSet.int(forColumn: "del_flag"))
        return posOrderItem
    }
    
    private func createParameters(posOrderItem: PosOrderItem) -> [AnyObject] {
        var parameters = [AnyObject]()
        parameters.append(posOrderItem.product.id as AnyObject)
        parameters.append(posOrderItem.productQuantity as AnyObject)
        parameters.append(posOrderItem.productDiscount as AnyObject)
        parameters.append(posOrderItem.productTax as AnyObject)
        parameters.append(posOrderItem.subTotalWithoutTax as AnyObject)
        parameters.append(posOrderItem.subTotalTax as AnyObject)
        parameters.append(posOrderItem.createdTime as AnyObject)
        parameters.append(posOrderItem.updatedTime as AnyObject)
        parameters.append(posOrderItem.createdByID as AnyObject)
        parameters.append(posOrderItem.updatedByID as AnyObject)
        parameters.append(posOrderItem.posOrderID as AnyObject)
        parameters.append(posOrderItem.delFlag as AnyObject)
        return parameters
    }
    
    private func getLastInsertRowId() -> Int{
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT id FROM PosOrderItem WHERE id = (SELECT MAX(id) FROM PosOrderItem)", withArgumentsIn: nil)
        
        var id = 0
        if (resultSet != nil) {
            while resultSet.next() {
                id = Int(resultSet.int(forColumn: "id"))
            }
        }
        return id
    }
}
