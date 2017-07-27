//
//  ErrorRegisterSettingView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/3/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ErrorRegisterSettingView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okBtn: BFPaperButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        okBtn.cornerRadius = 4
        okBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ErrorRegisterSettingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "error".localized()
        messageLabel.text = "store_information_match_with_this_passcode_doesn't_exit_or_the_passcode_has_already_used_for_another_store_register".localized()
        okBtn.setTitle("ok".localized().uppercased(), for: .normal)
    }
}
