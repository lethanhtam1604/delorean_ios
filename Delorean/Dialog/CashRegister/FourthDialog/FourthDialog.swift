//
//  FourthDialog.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class FourthDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: FourthView!
    var dialogDelegate: InteractDialogDelegate!

    init() {
        customView = FourthView.instanceFromNib() as! FourthView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        customView.closeBtn.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
    }

    
    @objc func nextClicked(sender: AnyObject) {
        if(dialogDelegate != nil) {
            self.hideDialog()
            dialogDelegate.nextFourthDialogClick()
        }
    }
    
    @objc func closeClicked() {
        self.hideDialog()
        dialogDelegate.backFourthDialogClick()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func hideDialog() {
        customIOSAlertView?.close()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
