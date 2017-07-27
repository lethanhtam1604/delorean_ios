//
//  SettingCompleteDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/30/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class SettingCompleteDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: SettingCompleteView!
    var delegate: DialogDelegate!

    init() {
        customView = SettingCompleteView.instanceFromNib() as! SettingCompleteView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.yesBtn.addTarget(self, action: #selector(self.yesClicked(_:)), for: .touchUpInside)
        
    }
    
    @objc func yesClicked(_ sender: AnyObject) {
        delegate.settingComplete()
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
    
}
