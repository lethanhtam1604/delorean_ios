//
//  FirstView.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import FontAwesomeKit

class FirstView: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var noTCardBtn: UIButton!
    @IBOutlet weak var useTPointTextField: UITextField!
    
    let closeBtn = UIButton()
    @IBOutlet weak var tPointLabel: UILabel!
    
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
        
        useTPointTextField.keyboardType = .numberPad
        useTPointTextField.returnKeyType = .done
        useTPointTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        useTPointTextField.resignFirstResponder()
        return true
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "FirstView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    func setAllDataScreenByLocalize() {
        tPointLabel.text = "Tポイント対象金額: " + String(PosManager.getInstance().posOrder.tPointAmount) + "円"
    }
}
