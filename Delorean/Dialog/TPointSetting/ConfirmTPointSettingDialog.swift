//
//  ConfirmTPointSettingDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/6/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import  CustomIOSAlertView

class ConfirmTPointSettingDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ConfirmTPointSettingView!
    
    init() {
        customView = ConfirmTPointSettingView.instanceFromNib() as! ConfirmTPointSettingView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.okBtn.addTarget(self, action: #selector(self.okClicked(_:)), for: .touchUpInside)
    }
    
    @objc func okClicked(_ sender: AnyObject) {
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setValue(giveThePurchasedValue: String, giveRateValue: String) {
        customView.giveThePurchasedValueLabel.text = giveThePurchasedValue
        customView.giveRateValueLabel.text = giveRateValue
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
