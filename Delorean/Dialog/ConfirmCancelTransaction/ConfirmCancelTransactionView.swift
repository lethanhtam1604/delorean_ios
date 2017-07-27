//
//  ConfirmCancelTransactionView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/18/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ConfirmCancelTransactionView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okBtn: BFPaperButton!
    @IBOutlet weak var noBtn: BFPaperButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        okBtn.cornerRadius = 4
        okBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        
        noBtn.cornerRadius = 4
        noBtn.backgroundColor = UIColor.red
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ConfirmCancelTransactionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "message".localized()
        messageLabel.text = "are_you_sure_to_cancel_this_transaction".localized()
        okBtn.setTitle("ok".localized(), for: .normal)
        noBtn.setTitle("no".localized(), for: .normal)
    }
}
