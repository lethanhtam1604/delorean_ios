//
//  JanCodeNumberIPadKeyView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 11/1/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

protocol JanCodeIPadDialogDelegate {
    func confirmFunction()
}

class JanCodeNumberIPadKeyView: UIViewController {
    
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
    
    var delegate: NumberIPadDialogDelegate!
    var shouldClearDisplayBeforeInserting = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.layer.borderWidth = 1
        textLabel.layer.cornerRadius = 2
        textLabel.layer.borderColor = UIColor(hexString: GRAY_BUTTON_COLOR).cgColor
        
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
    }

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
}
