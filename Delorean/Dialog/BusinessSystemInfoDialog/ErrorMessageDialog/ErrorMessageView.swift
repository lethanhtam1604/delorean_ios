//
//  ErrorMessageView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/28/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ErrorMessageView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okBtn: BFPaperButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        okBtn.cornerRadius = 4
        okBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ErrorMessageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    func setAllDataScreenByLocalize() {
        titleLabel.text = "error_message".localized()
        messageLabel.text = "failed_to_save_business_system_information_acquisition".localized()
        okBtn.setTitle("ok".localized().uppercased(), for: .normal)
    }
}
