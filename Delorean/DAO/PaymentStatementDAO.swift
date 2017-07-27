//
//  PaymentStatementDAO.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/24/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import FMDB

class PaymentStatementDAO {
    
    func add(paymentStatement: PaymentStatement) -> Int {
        DatabaseManager.getInstance().database.open()
        DatabaseManager.getInstance().database.executeUpdate("INSERT INTO PaymentStatement (total_amount, payment_type, paid_by_t_point, paid_by_other_point, cash, credit_card, debit_card, voucher, received_total, change, created_time, updated_time, created_by_id, updated_by_id, del_flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: createParameters(paymentStatement: paymentStatement))
        let id = getLastInsertRowId()
        DatabaseManager.getInstance().database.close()
        return id
    }
    
    func update(paymentStatement: PaymentStatement) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isUpdated = DatabaseManager.getInstance().database.executeUpdate("UPDATE PaymentStatement SET total_amount=?, payment_type=?, paid_by_t_point=?, paid_by_other_point=?, cash=?, credit_card=?, debit_card=?, voucher=?, received_total=?, change=?, created_time=?, updated_time=?, created_by_id=?, updated_by_id=?, del_flag=? WHERE id=" + String(paymentStatement.id), withArgumentsIn: createParameters(paymentStatement: paymentStatement))
        DatabaseManager.getInstance().database.close()
        return isUpdated
    }
    
    func delete(paymentStatement: PaymentStatement) -> Bool {
        DatabaseManager.getInstance().database.open()
        let isDeleted = DatabaseManager.getInstance().database.executeUpdate("DELETE FROM PaymentStatement WHERE id=?", withArgumentsIn: [paymentStatement.id])
        DatabaseManager.getInstance().database.close()
        return isDeleted
    }
    
    func getAll() -> [PaymentStatement] {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PaymentStatement", withArgumentsIn: nil)
        var result = [PaymentStatement]()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result.append(createPaymentStatement(resultSet: resultSet))
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    func getByID(paymentID: Int) -> PaymentStatement {
        DatabaseManager.getInstance().database.open()
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT * FROM PaymentStatement WHERE id=?", withArgumentsIn: [paymentID])
        var result = PaymentStatement()
        
        if (resultSet != nil) {
            while resultSet.next() {
                result = createPaymentStatement(resultSet: resultSet)
            }
        }
        DatabaseManager.getInstance().database.close()
        return result
    }
    
    private func createPaymentStatement(resultSet: FMResultSet) -> PaymentStatement {
        let paymentStatement = PaymentStatement()
        paymentStatement.id = Int(resultSet.int(forColumn: "id"))
        paymentStatement.total = Int(resultSet.int(forColumn: "total_amount"))
        paymentStatement.paymentType = Int(resultSet.int(forColumn: "payment_type"))
        paymentStatement.paidByTPoint = Int(resultSet.int(forColumn: "paid_by_t_point"))
        paymentStatement.paidByOtherPoint = Int(resultSet.int(forColumn: "paid_by_other_point"))
        paymentStatement.cash = Int(resultSet.int(forColumn: "cash"))
        paymentStatement.creditCard = Int(resultSet.int(forColumn: "credit_card"))
        paymentStatement.debitCard = Int(resultSet.int(forColumn: "debit_card"))
        paymentStatement.voucher = Int(resultSet.int(forColumn: "voucher"))
        paymentStatement.receivedTotal = Int(resultSet.int(forColumn: "received_total"))
        paymentStatement.change = Int(resultSet.int(forColumn: "change"))
        paymentStatement.createdTime = resultSet.string(forColumn: "created_time")
        paymentStatement.updatedTime = resultSet.string(forColumn: "updated_time")
        paymentStatement.createdByID = Int(resultSet.int(forColumn: "created_by_id"))
        paymentStatement.updatedByID = Int(resultSet.int(forColumn: "updated_by_id"))
        paymentStatement.delFlag = Int(resultSet.int(forColumn: "del_flag"))
        return paymentStatement
    }
    
    private func createParameters(paymentStatement: PaymentStatement) -> [AnyObject] {
        var parameters = [AnyObject]()
        parameters.append(paymentStatement.total as AnyObject)
        parameters.append(paymentStatement.paymentType as AnyObject)
        parameters.append(paymentStatement.paidByTPoint as AnyObject)
        parameters.append(paymentStatement.paidByOtherPoint as AnyObject)
        parameters.append(paymentStatement.cash as AnyObject)
        parameters.append(paymentStatement.creditCard as AnyObject)
        parameters.append(paymentStatement.debitCard as AnyObject)
        parameters.append(paymentStatement.voucher as AnyObject)
        parameters.append(paymentStatement.receivedTotal as AnyObject)
        parameters.append(paymentStatement.change as AnyObject)
        parameters.append(paymentStatement.createdTime as AnyObject)
        parameters.append(paymentStatement.updatedTime as AnyObject)
        parameters.append(paymentStatement.createdByID as AnyObject)
        parameters.append(paymentStatement.updatedByID as AnyObject)
        parameters.append(paymentStatement.delFlag as AnyObject)
        return parameters
    }
    
    private func getLastInsertRowId() -> Int{
        let resultSet: FMResultSet! = DatabaseManager.getInstance().database.executeQuery("SELECT id FROM PaymentStatement WHERE id = (SELECT MAX(id) FROM PaymentStatement)", withArgumentsIn: nil)
        
        var id = 0
        if (resultSet != nil) {
            while resultSet.next() {
                id = Int(resultSet.int(forColumn: "id"))
            }
        }
        return id
    }
}
