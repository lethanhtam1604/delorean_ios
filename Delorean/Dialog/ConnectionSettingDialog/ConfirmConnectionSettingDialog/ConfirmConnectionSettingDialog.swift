//
//  ConfirmConnectionSettingDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/30/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ConfirmConnectionSettingDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ConfirmConnectionSettingView!
    
    init() {
        customView = ConfirmConnectionSettingView.instanceFromNib() as! ConfirmConnectionSettingView
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
    
    func setSettingValue(setting1Value: String, setting2Value: String, setting3Value: String) {
        customView.setting1ValueLabel.text = setting1Value
        customView.setting2ValueLabel.text = setting2Value
        customView.setting3ValueLabel.text = setting3Value
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
