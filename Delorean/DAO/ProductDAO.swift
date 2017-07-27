//
//  ProductDAO.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 11/2/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import FMDB

class ProductDAO {

    func add(product: Product) -> Int {
        DatabaseManager.getInstance().database.open()
        DatabaseManager.getInstance().database.executeUpdate("INSERT INTO Product (jan_code, original_jan_code, name, price, warranty, tcard, created_time, updated_time, created_by_id, updated_by_id, del_flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: createParameters(product: product))
        let id = getLastInsertRowId()
        DatabaseManager.getInstance().database.close()
        return id
    }
    
    func update(product: Product) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isUpdated = DatabaseManager.getInstance().database.executeUpdate("UPDATE Product SET jan_code=?, original_jan_code=?, name=?, price=?, warranty=?, tcard=?, created_time=?, updated_time=?, created_by_id=?, updated_by_id=?, del_flag=? WHERE id=" + String(product.id), withArgumentsIn: createParameters(product: product))
        DatabaseManager.getInstance().database.close()
        return isUpdated
    }
    
    func delete(product: Product) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isDeleted = DatabaseManager.getInstance().database.executeUpdate("DELETE FROM Product WHERE id=?", withArgumentsIn: [product.id])
        DatabaseManager.getInstance().database.close()
        return isDeleted
    }
    
    func getAll() -> [Product] {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM Product", withArgumentsIn: nil)
        var result = [Product]()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result.append(createProduct(resultSet: resultSet))
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    func getByID(productID: Int) -> Product {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM Product WHERE id=?", withArgumentsIn: [productID])
        var result = Product()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result = createProduct(resultSet: resultSet)
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    private func createProduct(resultSet: FMResultSet) -> Product {
        let product = Product()
        product.id = Int(resultSet.int(forColumn: "id"))
        product.janCode = resultSet.string(forColumn: "jan_code")
        product.originalJanCode = resultSet.string(forColumn: "original_jan_code")
        product.name = resultSet.string(forColumn: "name")
        product.price = Int(resultSet.int(forColumn: "price"))
        product.warranty = Int(resultSet.int(forColumn: "warranty"))
        product.tcard = Int(resultSet.int(forColumn: "tcard"))
        product.createdTime = resultSet.string(forColumn: "created_time")
        product.updatedTime = resultSet.string(forColumn: "updated_time")
        product.createdByID = Int(resultSet.int(forColumn: "created_by_id"))
        product.updatedByID = Int(resultSet.int(forColumn: "updated_by_id"))
        product.delFlag = Int(resultSet.int(forColumn: "del_flag"))
        return product
    }
    
    private func createParameters(product: Product) -> [AnyObject] {
        var parameters = [AnyObject]()
        parameters.append(product.janCode as AnyObject)
        parameters.append(product.originalJanCode as AnyObject)
        parameters.append(product.name as AnyObject)
        parameters.append(product.price as AnyObject)
        parameters.append(product.warranty as AnyObject)
        parameters.append(product.tcard as AnyObject)
        parameters.append(product.createdTime as AnyObject)
        parameters.append(product.updatedTime as AnyObject)
        parameters.append(product.createdByID as AnyObject)
        parameters.append(product.updatedByID as AnyObject)
        parameters.append(product.delFlag as AnyObject)
        return parameters
    }
    
    private func getLastInsertRowId() -> Int{
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT id FROM Product WHERE id = (SELECT MAX(id) FROM Product)", withArgumentsIn: nil)
        
        var id = 0
        if (resultSet != nil) {
            while resultSet.next() {
                id = Int(resultSet.int(forColumn: "id"))
            }
        }
        return id
    }
}
