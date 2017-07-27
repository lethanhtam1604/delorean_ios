//
//  ConfirmRegisterSettingDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/3/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ConfirmRegisterSettingDialog {
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ConfirmRegisterSettingView!
    
    init() {
        customView = ConfirmRegisterSettingView.instanceFromNib() as! ConfirmRegisterSettingView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.yesBtn.addTarget(self, action: #selector(self.yesClicked(_:)), for: .touchUpInside)
    }
    
    @objc func yesClicked(_ sender: AnyObject) {
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setStoreRegisterSettingValue(storeNameValue: String, cashRegisterNoValue: String, storeAddressValue: String, storeTelValue: String, appropriateTaxOfficeValue: String, taxPaymentPlaceValue: String) {
        customView.storeNameValueLabel.text = storeNameValue
        customView.cashRegisterNoValueLabel.text = cashRegisterNoValue
        customView.storeAddressValueLabel.text = storeAddressValue
        customView.storeTelValueLabel.text = storeTelValue
        customView.appropriateTaxOfficeValueLabel.text = appropriateTaxOfficeValue
        customView.taxPaymentPlaceValueLabel.text = taxPaymentPlaceValue
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
