//
//  ThirdDialog.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ThirdDialog {

    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ThirdView!
    var dialogDelegate: InteractDialogDelegate!

    init() {
        customView = ThirdView.instanceFromNib() as! ThirdView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        customView.thirdBtn.addTarget(self, action: #selector(nextClicked), for: .touchUpInside)
        customView.closeBtn.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
    }

    @objc func nextClicked(sender: AnyObject) {
        if(dialogDelegate != nil) {
            hideDialog()
            dialogDelegate.nextThirdDialogClick()
        }
    }
    
    @objc func closeClicked() {
        self.hideDialog()
        dialogDelegate.backThirdDialogClick()
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
