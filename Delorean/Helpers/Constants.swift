//
//  Constants.swift
//  Demo
//
//  Created by Tam Huynh on 6/30/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import Foundation
import UIKit

let MAIN_COLOR = "0x2196F3"
let MAIN_COLOR_LIGHT = "0x64B5F6"
let MENU_COLOR = "0xCCCCCC"
let MAIN_BACKGROUND_COLOR = "0x4CAF50"
let BLUE_BUTTON_COLOR = "0x2F74B1"
let PINK_BUTTON_COLOR = "0xFFC5FF"
let PINK_DARK_BUTTON_COLOR = "0xFFA2A1"
let GRAY_BUTTON_COLOR = "0xD4D4D4"
let BLUE_LIGHT_BUTTON_COLOR = "0xBFD4EF"
let BLUE_LIGHT_1_BUTTON_COLOR = "0xD6EBF2"
let BLUE_LIGHT_2_BUTTON_COLOR = "0xBCD3FF"
let BLUE_LIGHT_3_BUTTON_COLOR = "0x78AAF1"
let YELLOW_BUTTON_COLOR = "0xFFB802"
let GRAY_LIGHT_BUTTON_COLOR = "0xECE9DD"
let ORANGE_LIGHT_BUTTON_COLOR = "0xFDE7D5"
let TRANSACTION_BUTTON_COLOR = "0x94AEFF"
let CANCEL_BUTTON_COLOR = "0xFF2101"
let POS_BACKGROUND_COLOR = "0xEAEAEA"

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE  = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD    = UIDevice.current.userInterfaceIdiom == .pad
}
