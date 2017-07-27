//
//  MessageView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/19/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class MessageView: UIView {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okBtn: BFPaperButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        okBtn.cornerRadius = 4
        okBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        messageLabel.textColor = UIColor.red
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MessageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        messageLabel.text = "are_you_sure_to_cancel_this_transaction".localized()
        okBtn.setTitle("ok".localized(), for: .normal)
    }
    
}
