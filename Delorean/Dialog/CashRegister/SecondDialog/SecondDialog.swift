//
//  SecondDialog.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import CustomIOSAlertView
import WYPopoverController

class SecondDialog: NSObject, WYPopoverControllerDelegate, NumberIPadDialogDelegate {

    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: SecondView!
    var dialogDelegate: InteractDialogDelegate!
    var useTPoint: Int!
    var popoverController: WYPopoverController!
    var inputTextFieldType = 1
    
    override init() {
        super.init()
        
        customView = SecondView.instanceFromNib() as! SecondView
        customView.layer.cornerRadius = 10
        customView.errorLabel.isHidden = true

        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil

        PosManager.getInstance().createPaymentStatement()
        
        customView.secondBtn.addTarget(self, action: #selector(nextClicked), for: .touchUpInside)
        customView.closeBtn.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
        
        customView.tPointTextField.addTarget(self, action: #selector(tPointClicked), for: .editingDidBegin)
        customView.cashTextField.addTarget(self, action: #selector(cashClicked), for: .editingDidBegin)
        customView.creditCardTextField.addTarget(self, action: #selector(creditCardClicked), for: .editingDidBegin)
        customView.debitCardTextField.addTarget(self, action: #selector(debitCardClicked), for: .editingDidBegin)
        customView.voucherTextField.addTarget(self, action: #selector(voucherClicked), for: .editingDidBegin)
    }
    
    @objc func nextClicked(sender: AnyObject) {        
        if dialogDelegate != nil {
            hideDialog()
            dialogDelegate.nextSecondDialogClick()
        }
    }
    
    func tPointClicked(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        inputTextFieldType = 1
        
        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .left, animated: true)
    }
    
    func cashClicked(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        inputTextFieldType = 2

        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .left, animated: true)
    }
    
    func creditCardClicked(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        inputTextFieldType = 3

        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .left, animated: true)
    }
    
    func debitCardClicked(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        inputTextFieldType = 4
        
        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .left, animated: true)
    }
    
    func voucherClicked(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        inputTextFieldType = 5
        
        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .left, animated: true)
    }
    
    func popoverControllerShouldDismissPopover(_ popoverController: WYPopoverController!) -> Bool {
        return true
    }
    
    func confirmFunction(value: String) {
        popoverController.dismissPopover(animated: true)
        let paymentStatement = PosManager.getInstance().paymentStatement
        if inputTextFieldType  == 1 {
            customView.tPointTextField.resignFirstResponder()
            customView.tPointTextField.text = value
            paymentStatement?.paidByTPoint = Int(value)!
        }
        else if inputTextFieldType  == 2 {
            customView.cashTextField.resignFirstResponder()
            customView.cashTextField.text = value
            paymentStatement?.cash = Int(value)!
        }
        else if inputTextFieldType  == 3 {
            customView.creditCardTextField.resignFirstResponder()
            customView.creditCardTextField.text = value
            paymentStatement?.creditCard = Int(value)!
        }
        else if inputTextFieldType  == 4 {
            customView.debitCardTextField.resignFirstResponder()
            customView.debitCardTextField.text = value
            paymentStatement?.debitCard = Int(value)!
        }
        else if inputTextFieldType  == 5 {
            customView.voucherTextField.resignFirstResponder()
            customView.voucherTextField.text = value
            paymentStatement?.voucher = Int(value)!
        }
        customView.updateReceivedChange()
    }

    @objc func closeClicked() {
        self.hideDialog()
        dialogDelegate.backSecondDialogClick()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func hideDialog() {
        customIOSAlertView?.close()
    }
    
    func setAllDataScreenByLocalize() {
        PosManager.getInstance().paymentStatement.paidByTPoint = self.useTPoint
        customView.tPointTextField.text = String(useTPoint)
        customView.setAllDataScreenByLocalize()
    }
}
