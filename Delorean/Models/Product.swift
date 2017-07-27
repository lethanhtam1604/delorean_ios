//
//  Product.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 11/2/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class Product: NSObject {
    
    var id: Int!
    var janCode: String!
    var originalJanCode: String!
    var name: String!
    var price: Int!
    var warranty: Int!
    var tcard: Int!
    
    var createdTime: String!
    var updatedTime: String!
    var createdByID: Int!
    var updatedByID: Int!
    var delFlag = 0
}
