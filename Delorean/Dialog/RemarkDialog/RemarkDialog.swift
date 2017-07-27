//
//  RemarkDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/19/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class RemarkDialog {
    let customIOSAlertView = CustomIOSAlertView()
    private var customView: RemarkView!
    var delegate: InteractDialogDelegate!
    
    init() {
        customView = RemarkView.instanceFromNib() as! RemarkView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.saveBtn.addTarget(self, action: #selector(saveClicked), for: .touchUpInside)
    }
    
    @objc func saveClicked() {
        let alert: UIAlertView = UIAlertView()
        alert.title = "Message"
        alert.message = "Save remark successfully!"
        alert.delegate = nil
        alert.addButton(withTitle: "Ok")
        alert.show()
        
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
