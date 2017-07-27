//
//  FirstDialog.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import CustomIOSAlertView
import WYPopoverController

class FirstDialog: NSObject, WYPopoverControllerDelegate, NumberIPadDialogDelegate {
    
    var dialogDelegate: InteractDialogDelegate!
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: FirstView!
    var popoverController: WYPopoverController!

    override init() {
        super.init()
        
        customView = FirstView.instanceFromNib() as! FirstView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.nextBtn.addTarget(self, action: #selector(nextClicked), for: .touchUpInside)
        customView.noTCardBtn.addTarget(self, action: #selector(noTCardClicked), for: .touchUpInside)
        customView.closeBtn.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
        
        customView.useTPointTextField.addTarget(self, action: #selector(useTPointClicked), for: .editingDidBegin)
    }
    
    func noTCardClicked(sender: AnyObject) {
        if(dialogDelegate != nil) {
            hideDialog()
            dialogDelegate.nextFirstDialogClick(useTPoint: 0)
        }
    }
    
    func nextClicked(sender: AnyObject) {
        if(dialogDelegate != nil) {
            hideDialog()
            if customView.useTPointTextField.text != "" {
                dialogDelegate.nextFirstDialogClick(useTPoint: Int(customView.useTPointTextField.text!)!)
            }
            else {
                dialogDelegate.nextFirstDialogClick(useTPoint: 0)
                
            }
        }
    }
    
    func useTPointClicked(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        
        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .any, animated: true)
    }
    
    func popoverControllerShouldDismissPopover(_ popoverController: WYPopoverController!) -> Bool {
        return true
    }
    
    func confirmFunction(value: String) {
        popoverController.dismissPopover(animated: true)
        customView.useTPointTextField.resignFirstResponder()
        customView.useTPointTextField.text = value
    }
    
    @objc func closeClicked() {
        self.hideDialog()
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
