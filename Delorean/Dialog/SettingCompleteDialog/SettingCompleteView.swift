//
//  SettingCompleteView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/30/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class SettingCompleteView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var yesBtn: BFPaperButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yesBtn.cornerRadius = 4
        yesBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SettingCompleteView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "setting_complete".localized()
        messageLabel.text = "setting_haven't_been_completeed_do_you_want_to_complete_it_now".localized()
        yesBtn.setTitle("yes".localized(), for: .normal)
    }
}
