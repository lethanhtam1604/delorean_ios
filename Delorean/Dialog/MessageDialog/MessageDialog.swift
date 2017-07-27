//
//  MessageDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/19/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class MessageDialog {
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: MessageView!
    var delegate: InteractDialogDelegate!
    
    init() {
        customView = MessageView.instanceFromNib() as! MessageView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.okBtn.addTarget(self, action: #selector(okClicked), for: .touchUpInside)
    }
    
    @objc func okClicked() {
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
    
    func setMessage(message: String) {
        customView.messageLabel.text = message
    }
}
