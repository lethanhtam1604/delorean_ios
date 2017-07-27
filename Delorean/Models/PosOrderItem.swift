//
//  PosOrderItem.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/18/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class PosOrderItem {

    var id: Int!
    var product: Product!
    var productQuantity: Int!
    var productDiscount: Int!
    var productTax: Int!
    var subTotalWithoutTax: Int!
    var subTotalTax: Int!

    var createdTime: String!
    var updatedTime: String!
    var createdByID: Int!
    var updatedByID: Int!
    var posOrderID: Int!
    var delFlag = 0
}
