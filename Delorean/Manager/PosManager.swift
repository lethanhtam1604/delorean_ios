//
//  PosManager.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/18/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class PosManager {
    
    private static var sharedInstance: PosManager!
    
    var products = [Product]()
    var posOrderItems = [PosOrderItem]()
    var posOrder: PosOrder!
    var paymentStatement: PaymentStatement!
    
    var posOrderItemDAO = PosOrderItemDAO()
    var posOrderDAO = PosOrderDAO()
    var paymentStatementDAO = PaymentStatementDAO()
    var productDAO = ProductDAO()

    var idPreviousPosOrder: Int!
    var idCurrentPosOrder: Int!

    static func getInstance() -> PosManager {
        if(sharedInstance == nil) {
            sharedInstance = PosManager()
        }
        return sharedInstance
    }
    
    private init() {
        products = productDAO.getAll()
        createPosOrder()
        createPaymentStatement()
    }
    
    func createPosOrder() {
        posOrder = PosOrder()
        posOrder.tPointAmount = 10000
        posOrder.createdTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
        posOrder.updatedTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
        posOrder.createdByID = 0
        posOrder.updatedByID = 0
        posOrder.delFlag = 0
    }
    
    func createPaymentStatement() {
        paymentStatement = PaymentStatement()
        paymentStatement.paidByTPoint = 0
        paymentStatement.paidByOtherPoint = 0
        paymentStatement.cash = 0
        paymentStatement.creditCard = 0
        paymentStatement.debitCard = 0
        paymentStatement.voucher = 0
        paymentStatement.createdTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
        paymentStatement.updatedTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
        paymentStatement.createdByID = 0
        paymentStatement.updatedByID = 0
        paymentStatement.delFlag = 0
    }
    
    func createPosOrderItem() {
        let productResult = Product()
        productResult.id = getProductIDMax()
        productResult.janCode = "18764257" + String(posOrderItems.count)
        productResult.name = "オンソ onso 3.5ステレオプラグ"
        productResult.price = 3000
        productResult.warranty = 1
        productResult.tcard = 3
        productResult.delFlag = 0
        
        let posOrderItem = PosOrderItem()
        posOrderItem.product = productResult
        posOrderItem.productQuantity = 1
        posOrderItem.productDiscount = 0
        posOrderItem.productTax = 8
        posOrderItem.delFlag = 0
        posOrderItem.createdTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
        posOrderItem.updatedTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
        posOrderItem.createdByID = 0
        posOrderItem.updatedByID = 0
        posOrderItem.posOrderID = 0
        calculateSubTotal(posOrderItem: posOrderItem)
        posOrderItems.append(posOrderItem)
    }
    
    private func getProductIDMax() -> Int {
        var idMax = 0
        for posOrderItem in posOrderItems {
            if posOrderItem.product.id > idMax {
                idMax = posOrderItem.product.id
            }
        }
        
        return idMax + 11
    }
    
    func scanProduct(janCodeScaned: String) {
        
        var productResult: Product!
        for product in products {
            if product.janCode.caseInsensitiveCompare(janCodeScaned) == .orderedSame {
                productResult = product
                break
            }
        }
        
        if productResult == nil {
            return
        }
        
        var posOrderItemResult: PosOrderItem!
        for posOrderItem in posOrderItems {
            if posOrderItem.product.id == productResult.id {
                posOrderItemResult = posOrderItem
                break
            }
        }
        
        if posOrderItemResult != nil {
            posOrderItemResult.productQuantity = posOrderItemResult.productQuantity + 1
            calculateSubTotal(posOrderItem: posOrderItemResult)
        } else {
            let posOrderItem = PosOrderItem()
            posOrderItem.product = productResult
            posOrderItem.productQuantity = 1
            posOrderItem.productDiscount = 0
            posOrderItem.productTax = 8
            posOrderItem.delFlag = 0
            posOrderItem.createdTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
            posOrderItem.updatedTime = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .full, timeStyle: .none)
            posOrderItem.createdByID = 0
            posOrderItem.updatedByID = 0
            posOrderItem.posOrderID = 0
            calculateSubTotal(posOrderItem: posOrderItem)
            posOrderItems.append(posOrderItem)
        }
    }
    
    func calculateTotalQuantity() {
        var result = 0
        for posOrderItem in posOrderItems {
            result = result + posOrderItem.productQuantity
        }
        posOrder.totalQuantity = result
    }
    
    func calculateTotalAmount() {
        var totalAmount: Int = 0
        for posOrderItem in posOrderItems {
            totalAmount = totalAmount + posOrderItem.subTotalTax
        }
        posOrder.totalAmount = totalAmount
    }
    
    func calculateSubTotal(posOrderItem: PosOrderItem) {
        posOrderItem.subTotalWithoutTax = posOrderItem.product.price * posOrderItem.productQuantity - posOrderItem.productDiscount * posOrderItem.productQuantity
        posOrderItem.subTotalTax = posOrderItem.subTotalWithoutTax - posOrderItem.subTotalWithoutTax * (posOrderItem.productTax / 100)
    }
    
    func calculateReceivedChange() {
        paymentStatement.receivedTotal = paymentStatement.paidByTPoint + paymentStatement.paidByOtherPoint + paymentStatement.cash + paymentStatement.creditCard + paymentStatement.debitCard + paymentStatement.voucher
        
        if paymentStatement.receivedTotal >= paymentStatement.total {
            paymentStatement.change = paymentStatement.receivedTotal - paymentStatement.total
        }
        else {
            paymentStatement.change = 0
        }
    }
    
    func saveToDatabase() {
        paymentStatement.id = paymentStatementDAO.add(paymentStatement: paymentStatement)
        posOrder.paymentID = paymentStatement.id
        posOrder.id = posOrderDAO.add(posOrder: posOrder)
        idCurrentPosOrder = posOrder.id
        
        for posOrderItem in posOrderItems {
            posOrderItem.posOrderID = posOrder.id
            posOrderItem.id = posOrderItemDAO.add(posOrderItem: posOrderItem)
        }
    }
    
    func getAllPreviousPosOrderItemList() {
        if idPreviousPosOrder == nil {
            idPreviousPosOrder = idCurrentPosOrder
            return
        }

        posOrder = posOrderDAO.getByID(posOrderID: idPreviousPosOrder)
        paymentStatement = paymentStatementDAO.getByID(paymentID: posOrder.paymentID)
        posOrderItems = posOrderItemDAO.getListByOrderID(posOrderID: posOrder.id)
        idPreviousPosOrder = idCurrentPosOrder
    }
    
    func clearPos() {
        posOrderItems.removeAll()
        createPosOrder()
        createPaymentStatement()
    }
}
