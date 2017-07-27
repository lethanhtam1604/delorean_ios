//
//  ProductViewCell.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/13/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import WYPopoverController

protocol NumberIPadDialogDelegate {
    func confirmFunction(value: String)
}

class ProductViewCell: UITableViewCell, UITextFieldDelegate, WYPopoverControllerDelegate, NumberIPadDialogDelegate {

    @IBOutlet weak var janCodeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var warrantyLabel: UILabel!
    @IBOutlet weak var tcardLabel: UILabel!
    @IBOutlet weak var productNameTextField: UITextField!
    
    var discountValue: Int!
    var priceValue: Int!
    var popoverController: WYPopoverController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        janCodeTextField.keyboardType = .numberPad
        priceTextField.keyboardType = .numberPad
        discountTextField.keyboardType = .numberPad
        quantityTextField.keyboardType = .numberPad
        productNameTextField.keyboardType = .numberPad

        discountTextField.returnKeyType = .done
        quantityTextField.returnKeyType = .done
        janCodeTextField.returnKeyType = .done
        priceTextField.returnKeyType = .done
        productNameTextField.returnKeyType = .done

        discountTextField.delegate = self
        quantityTextField.delegate = self
        janCodeTextField.delegate = self
        priceTextField.delegate = self
        productNameTextField.delegate = self
            
//        janCodeTextField.addTarget(self, action: #selector(janCodeChanged), for: .editingDidBegin)
//        priceTextField.addTarget(self, action: #selector(priceChanged), for: .editingDidBegin)
//        discountTextField.addTarget(self, action: #selector(discountChanged), for: .editingDidBegin)
//        quantityTextField.addTarget(self, action: #selector(quantityChanged), for: .editingDidBegin)
    }
    
    func janCodeChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        
        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .any, animated: true)
    }
    
    func priceChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let numberIPadViewController = NumberIPadViewController(nibName: "NumberIPadViewController", bundle: nil)
        numberIPadViewController.keyBoardType = 2
        numberIPadViewController.delegate = self

        popoverController = WYPopoverController(contentViewController: numberIPadViewController)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 493)
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .right, animated: true)
    }
    
    func discountChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let numberIPadViewController = NumberIPadViewController(nibName: "NumberIPadViewController", bundle: nil)
        numberIPadViewController.keyBoardType = 3
        numberIPadViewController.delegate = self

        popoverController = WYPopoverController(contentViewController: numberIPadViewController)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 493)
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .any, animated: true)
    }
    
    func quantityChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let numberIPadViewController = NumberIPadViewController(nibName: "NumberIPadViewController", bundle: nil)
        numberIPadViewController.keyBoardType = 4
        numberIPadViewController.delegate = self

        popoverController = WYPopoverController(contentViewController: numberIPadViewController)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 493)
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .any, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func popoverControllerShouldDismissPopover(_ popoverController: WYPopoverController!) -> Bool {
        return true
    }
    
    func confirmFunction(value: String) {
        popoverController.dismissPopover(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        discountTextField.resignFirstResponder()
        quantityTextField.resignFirstResponder()
        janCodeTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
        productNameTextField.resignFirstResponder()
        return true
    }
}
