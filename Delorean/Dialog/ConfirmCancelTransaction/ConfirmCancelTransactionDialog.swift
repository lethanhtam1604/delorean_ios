//
//  ConfirmCancelTransactionDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/18/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ConfirmCancelTransactionDialog {
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ConfirmCancelTransactionView!
    var delegate: InteractDialogDelegate!
    
    init() {
        customView = ConfirmCancelTransactionView.instanceFromNib() as! ConfirmCancelTransactionView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.okBtn.addTarget(self, action: #selector(okClicked), for: .touchUpInside)
        customView.noBtn.addTarget(self, action: #selector(noClicked), for: .touchUpInside)
    }
    
    @objc func okClicked() {
        delegate.clearAllCurrentProductList()
        customIOSAlertView?.close()
    }
    
    @objc func noClicked() {
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
