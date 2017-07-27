//
//  ConfirmTransactionRecordDeletionDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/4/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ConfirmTransactionRecordDeletionDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ConfirmTransactionRecordDeletionView!
    
    init() {
        customView = ConfirmTransactionRecordDeletionView.instanceFromNib() as! ConfirmTransactionRecordDeletionView
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
    
    func setDateValue(dateValue: String) {
        customView.dateValueLabel.text = dateValue
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }

}
