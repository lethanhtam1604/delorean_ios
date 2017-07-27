//
//  ConfirmConnectionSettingView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/30/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ConfirmConnectionSettingView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var yesBtn: BFPaperButton!
    @IBOutlet weak var setting1Label: UILabel!
    @IBOutlet weak var setting2Label: UILabel!
    @IBOutlet weak var setting3Label: UILabel!
    @IBOutlet weak var setting1ValueLabel: UILabel!
    @IBOutlet weak var setting2ValueLabel: UILabel!
    @IBOutlet weak var setting3ValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yesBtn.cornerRadius = 4
        yesBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ConfirmConnectionSettingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "confirm_connecion_setting".localized()
        messageLabel.text = "are_you_sure_you_want_to_save_the_following_setting".localized()
        yesBtn.setTitle("yes".localized(), for: .normal)
        
        setting1Label.text = "connection_information".localized() + " 1"
        setting2Label.text = "connection_information".localized() + " 2"
        setting3Label.text = "connection_information".localized() + " 3"
    }
}
