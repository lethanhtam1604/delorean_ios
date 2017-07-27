//
//  ErrorConnectionSettingView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/3/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ErrorConnectionSettingView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okBtn: BFPaperButton!
    @IBOutlet weak var setting1Label: UILabel!
    @IBOutlet weak var setting2Label: UILabel!
    @IBOutlet weak var setting3Label: UILabel!
    @IBOutlet weak var setting1ValueLabel: UILabel!
    @IBOutlet weak var setting2ValueLabel: UILabel!
    @IBOutlet weak var setting3ValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        okBtn.cornerRadius = 4
        okBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ErrorConnectionSettingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "error".localized()
        messageLabel.text = "failed_to_save_following_setting_of_access_point_information".localized()
        okBtn.setTitle("ok".localized().uppercased(), for: .normal)
        
        setting1Label.text = "connection_information".localized() + " 1"
        setting2Label.text = "connection_information".localized() + " 2"
        setting3Label.text = "connection_information".localized() + " 3"
    }
    
}
