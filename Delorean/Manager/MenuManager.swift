//
//  MenuManager.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/23/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MenuManager: NSObject {

    static let shared = MenuManager()
    var menus: NSMutableArray = []
    
    override init() {
        super.init()
        createDatas()
    }
    
    func createDatas() {
        menus = NSMutableArray()
        var menuItem = MenuModel()
        menuItem.image = "ic_home"
        menuItem.name = "home".localized()
        menuItem.withIdentifier = 1
        menus.add(menuItem)
        
        menuItem = MenuModel()
        menuItem.image = "Setting"
        menuItem.name = "settings".localized()
        menuItem.withIdentifier = 2
        menus.add(menuItem)
        
        menuItem = MenuModel()
        menuItem.image = "Language"
        menuItem.name = "language".localized()
        menuItem.withIdentifier = 3
        menuItem.highlight = false
        menus.add(menuItem)
        
        menuItem = MenuModel()
        menuItem.image = "About"
        menuItem.name = "about".localized()
        menuItem.withIdentifier = 4
        menus.add(menuItem)
        
        menuItem = MenuModel()
        menuItem.image = "Star"
        menuItem.name = "rate_and_review".localized()
        menuItem.withIdentifier = 5
        menuItem.highlight = false
        menus.add(menuItem)
        
        menuItem = MenuModel()
        menuItem.image = "Debug"
        menuItem.name = "Debug"
        menuItem.highlight = false
        menuItem.withIdentifier = 6
        menus.add(menuItem)
    }
}
