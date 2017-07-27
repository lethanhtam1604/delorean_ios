//
//  SecondView.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import FontAwesomeKit

class SecondView: UIView, UITextFieldDelegate{
    
    @IBOutlet weak var secondBtn: UIButton!
    
    let closeBtn = UIButton()
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tPointTextField: UITextField!
    @IBOutlet weak var tPointSystemBtn: UIButton!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var creditCardTextField: UITextField!
    @IBOutlet weak var debitCardTextField: UITextField!
    @IBOutlet weak var voucherTextField: UITextField!
    @IBOutlet weak var receivedTotalLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(closeBtn)
        
        let closeIcon = FAKIonIcons.closeIcon(withSize: 40)
        closeIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.black)
        let closeImg  = closeIcon?.image(with: CGSize(width: 40, height: 40))
        closeBtn.setImage(closeImg, for: .normal)
        
        closeBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        closeBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        closeBtn.autoSetDimensions(to: CGSize(width: 55, height: 55))
        
        tPointTextField.keyboardType = .numberPad
        cashTextField.keyboardType = .numberPad
        creditCardTextField.keyboardType = .numberPad
        debitCardTextField.keyboardType = .numberPad
        voucherTextField.keyboardType = .numberPad
        
        tPointTextField.returnKeyType = .done
        cashTextField.returnKeyType = .done
        creditCardTextField.returnKeyType = .done
        debitCardTextField.returnKeyType = .done
        voucherTextField.returnKeyType = .done
        
        tPointTextField.delegate = self
        cashTextField.delegate = self
        creditCardTextField.delegate = self
        debitCardTextField.delegate = self
        voucherTextField.delegate = self
        
        tPointTextField.addTarget(self, action: #selector(tPointChanged), for: .editingChanged)
        cashTextField.addTarget(self, action: #selector(cashChanged), for: .editingChanged)
        creditCardTextField.addTarget(self, action: #selector(creditCardChanged), for: .editingChanged)
        debitCardTextField.addTarget(self, action: #selector(debitCardChanged), for: .editingChanged)
        voucherTextField.addTarget(self, action: #selector(voucherCardChanged), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tPointTextField.resignFirstResponder()
        cashTextField.resignFirstResponder()
        creditCardTextField.resignFirstResponder()
        debitCardTextField.resignFirstResponder()
        voucherTextField.resignFirstResponder()
        return true
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SecondView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        cashTextField.text = String(PosManager.getInstance().posOrder.totalAmount)
        let paymentStatement = PosManager.getInstance().paymentStatement
        paymentStatement?.cash = Int(cashTextField.text!)!

        PosManager.getInstance().paymentStatement.total = PosManager.getInstance().posOrder.totalAmount
        totalAmountLabel.text = String(PosManager.getInstance().paymentStatement.total) + "円"
        updateReceivedChange()
    }
    
    func tPointChanged(_ textField: UITextField) {
        let paymentStatement = PosManager.getInstance().paymentStatement
        
        if textField.text == "" {
            paymentStatement?.paidByTPoint = 0
        }
        else {
            let value = textField.text?.digitsOnly()
            if (value?.isdigitsOnly())! {
                paymentStatement?.paidByTPoint = Int(value!)!
            }
            else {
                paymentStatement?.paidByTPoint = 0
            }
        }
        updateReceivedChange()
    }
    
    func cashChanged(_ textField: UITextField) {
        let paymentStatement = PosManager.getInstance().paymentStatement
        
        if textField.text == "" {
            paymentStatement?.cash = 0
        }
        else {
            let value = textField.text?.digitsOnly()
            if (value?.isdigitsOnly())! {
                paymentStatement?.cash = Int(value!)!
            }
            else {
                paymentStatement?.cash = 0
            }
        }
        updateReceivedChange()
    }
    
    func creditCardChanged(_ textField: UITextField) {
        let paymentStatement = PosManager.getInstance().paymentStatement
        
        if textField.text == "" {
            paymentStatement?.creditCard = 0
        }
        else {
            let value = textField.text?.digitsOnly()
            if (value?.isdigitsOnly())! {
                paymentStatement?.creditCard = Int(value!)!
            }
            else {
                paymentStatement?.creditCard = 0
            }
        }
        updateReceivedChange()
    }
    
    func debitCardChanged(_ textField: UITextField) {
        let paymentStatement = PosManager.getInstance().paymentStatement
        
        if textField.text == "" {
            paymentStatement?.debitCard = 0
        }
        else {
            let value = textField.text?.digitsOnly()
            if (value?.isdigitsOnly())! {
                paymentStatement?.debitCard = Int(value!)!
            }
            else {
                paymentStatement?.debitCard = 0
            }
        }
        updateReceivedChange()
    }
    
    func voucherCardChanged(_ textField: UITextField) {
        let paymentStatement = PosManager.getInstance().paymentStatement
        
        if textField.text == "" {
            paymentStatement?.voucher = 0
        }
        else {
            let value = textField.text?.digitsOnly()
            if (value?.isdigitsOnly())! {
                paymentStatement?.voucher = Int(value!)!
            }
            else {
                paymentStatement?.voucher = 0
            }
        }
        updateReceivedChange()
    }
    
    func updateReceivedChange() {
        PosManager.getInstance().calculateReceivedChange()
        receivedTotalLabel.text = String(PosManager.getInstance().paymentStatement.receivedTotal) + "円"
        changeLabel.text = String(PosManager.getInstance().paymentStatement.change) + "円"
        if PosManager.getInstance().paymentStatement.total > PosManager.getInstance().paymentStatement.receivedTotal {
            secondBtn.isEnabled = false
            secondBtn.titleLabel?.textColor = UIColor.red
            secondBtn.titleLabel?.alpha = 0.5
        }
        else {
            secondBtn.isEnabled = true
            secondBtn.titleLabel?.alpha = 1.0
        }
    }
}
