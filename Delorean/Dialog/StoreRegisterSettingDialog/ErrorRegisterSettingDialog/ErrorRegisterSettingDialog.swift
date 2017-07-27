//
//  ErrorRegisterSettingDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/3/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ErrorRegisterSettingDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ErrorRegisterSettingView!
    
    init() {
        customView = ErrorRegisterSettingView.instanceFromNib() as! ErrorRegisterSettingView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.okBtn.addTarget(self, action: #selector(ErrorMessageDialog.okClicked(_:)), for: .touchUpInside)
        
    }
    
    @objc func okClicked(_ sender: AnyObject) {
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
