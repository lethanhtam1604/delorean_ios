//
//  NumberIPadViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/31/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class NumberIPadViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var zeroBtn: BFPaperButton!
    @IBOutlet weak var oneBtn: BFPaperButton!
    @IBOutlet weak var twoBtn: BFPaperButton!
    @IBOutlet weak var threeBtn: BFPaperButton!
    @IBOutlet weak var fourBtn: BFPaperButton!
    @IBOutlet weak var fiveBtn: BFPaperButton!
    @IBOutlet weak var sixBtn: BFPaperButton!
    @IBOutlet weak var sevenBtn: BFPaperButton!
    @IBOutlet weak var eightBtn: BFPaperButton!
    @IBOutlet weak var nineBtn: BFPaperButton!
    @IBOutlet weak var cBtn: BFPaperButton!
    @IBOutlet weak var delBtn: BFPaperButton!
    @IBOutlet weak var confirmBtn: BFPaperButton!
    @IBOutlet weak var unitPriceBtn: BFPaperButton!
    @IBOutlet weak var discountBtn: BFPaperButton!
    @IBOutlet weak var quantityBtn: BFPaperButton!
    @IBOutlet weak var yenBtn: BFPaperButton!
    @IBOutlet weak var percentBtn: BFPaperButton!
    @IBOutlet weak var addBtn: BFPaperButton!
    @IBOutlet weak var subtractBtn: BFPaperButton!
    @IBOutlet weak var topContainView: UIView!
    
    var keyBoardType: Int!
    var delegate: NumberIPadDialogDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.layer.borderWidth = 1
        textLabel.layer.cornerRadius = 2
        textLabel.layer.borderColor = UIColor(hexString: GRAY_BUTTON_COLOR).cgColor
        textLabel.numberOfLines = 1
        
        zeroBtn.layer.cornerRadius = 2
        oneBtn.layer.cornerRadius = 2
        twoBtn.layer.cornerRadius = 2
        threeBtn.layer.cornerRadius = 2
        fourBtn.layer.cornerRadius = 2
        fiveBtn.layer.cornerRadius = 2
        sixBtn.layer.cornerRadius = 2
        sevenBtn.layer.cornerRadius = 2
        eightBtn.layer.cornerRadius = 2
        nineBtn.layer.cornerRadius = 2
        cBtn.layer.cornerRadius = 2
        delBtn.layer.cornerRadius = 2
        confirmBtn.layer.cornerRadius = 2
        
        unitPriceBtn.layer.cornerRadius = 2
        discountBtn.layer.cornerRadius = 2
        quantityBtn.layer.cornerRadius = 2
        yenBtn.layer.cornerRadius = 2
        percentBtn.layer.cornerRadius = 2
        addBtn.layer.cornerRadius = 2
        subtractBtn.layer.cornerRadius = 2
        
        unitPriceBtn.addTarget(self, action: #selector(unitPriceClicked), for: .touchUpInside)
        discountBtn.addTarget(self, action: #selector(discountClicked), for: .touchUpInside)
        quantityBtn.addTarget(self, action: #selector(quantityClicked), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if keyBoardType == 2 {
            priceOption()
        } else if keyBoardType == 3 {
            discountOption()
        } else if keyBoardType == 4 {
            quantityOption()
        }
    }

    
    @objc func unitPriceClicked() {
        priceOption()
    }
    
    private func priceOption() {
        unitPriceBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        discountBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        quantityBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        yenBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        percentBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        yenBtn.isHidden = false
        percentBtn.isHidden = false
        addBtn.isHidden = true
        subtractBtn.isHidden = true
    }
    
    @objc func discountClicked() {
        discountOption()
    }
    
    private func discountOption() {
        unitPriceBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        discountBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        quantityBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        yenBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        percentBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        yenBtn.isHidden = false
        percentBtn.isHidden = false
        addBtn.isHidden = true
        subtractBtn.isHidden = true
    }
    
    @objc func quantityClicked() {
        quantityOption()
    }
    
    private func quantityOption() {
        unitPriceBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        discountBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        quantityBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        yenBtn.isHidden = true
        percentBtn.isHidden = true
        addBtn.isHidden = false
        subtractBtn.isHidden = false
    }

    var shouldClearDisplayBeforeInserting = true
    
    @IBAction func didTapNumber(_ sender: AnyObject) {
        if shouldClearDisplayBeforeInserting {
            textLabel.text = ""
            shouldClearDisplayBeforeInserting = false
        }
        
        if let numberAsString = sender.titleLabel??.text {
            let numberAsNSString = numberAsString as NSString
            if let oldDisplay = textLabel?.text! {
                textLabel.text = "\(oldDisplay)\(numberAsNSString.intValue)"
            } else {
                textLabel.text = "\(numberAsNSString.intValue)"
            }
            
            let number = (textLabel.text! as NSString).intValue
            if number == 0 {
                shouldClearDisplayBeforeInserting = true
            }
        }
    }
    
    @IBAction func clearDisplay(_ sender: AnyObject) {
        textLabel.text = "0"
        shouldClearDisplayBeforeInserting = true
    }
    
    @IBAction func confirmBtnClicked(_ sender: AnyObject) {
        if delegate != nil {
            delegate.confirmFunction(value: textLabel.text!)
        }
    }
    
    @IBAction func didDelTap(_ sender: AnyObject) {
        let name = textLabel.text!
        if name.length > 1 {
            let result = name.substring(to: name.index(before: name.endIndex))
            textLabel.text = result
        }
        else {
            textLabel.text = "0"
            shouldClearDisplayBeforeInserting = true
        }
    }
    @IBAction func didAddNumber(_ sender: AnyObject) {
        let number = (textLabel.text! as NSString).intValue + 1
        textLabel.text = String(number)
        if number == 0 {
            shouldClearDisplayBeforeInserting = true
        }
    }
    
    @IBAction func didSubtractNumber(_ sender: AnyObject) {
        let number = (textLabel.text! as NSString).intValue - 1
        if number >= 0 {
            textLabel.text = String(number)
        }

        if number == 0 {
            shouldClearDisplayBeforeInserting = true
        }
    }
}
