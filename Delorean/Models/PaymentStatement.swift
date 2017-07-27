//
//  PaymentStatement.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/18/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class PaymentStatement {
    
    var id: Int!
    var total = 0
    var paymentType = 0
    var paidByTPoint = 0
    var paidByOtherPoint = 0
    var cash = 0
    var creditCard = 0
    var debitCard = 0
    var voucher = 0
    var receivedTotal = 0
    var change = 0
    
    var delFlag = 0
    var createdTime: String!
    var updatedTime: String!
    var createdByID: Int!
    var updatedByID: Int!
}
