//
//  DialogDelegateInterface.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/13/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

protocol InteractDialogDelegate {
    func nextFirstDialogClick(useTPoint: Int)
    func backFirstDialogClick()
    func nextSecondDialogClick()
    func backSecondDialogClick()
    func nextThirdDialogClick()
    func backThirdDialogClick()
    func nextFourthDialogClick()
    func backFourthDialogClick()
    
    func clearAllCurrentProductList()
}
