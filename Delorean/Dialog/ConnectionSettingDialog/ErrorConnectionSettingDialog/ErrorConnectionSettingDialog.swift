//
//  ErrorConnectionSettingDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/3/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ErrorConnectionSettingDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ErrorConnectionSettingView!
    
    init() {
        customView = ErrorConnectionSettingView.instanceFromNib() as! ErrorConnectionSettingView
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
    
    func setSettingValue(setting1Value: String, setting2Value: String, setting3Value: String) {
        customView.setting1ValueLabel.text = setting1Value
        customView.setting2ValueLabel.text = setting2Value
        customView.setting3ValueLabel.text = setting3Value
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
