//
//  ConfirmTPointSettingView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/6/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ConfirmTPointSettingView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okBtn: BFPaperButton!
    @IBOutlet weak var giveThePurchasedLabel: UILabel!
    @IBOutlet weak var giveRateLabel: UILabel!
    @IBOutlet weak var giveThePurchasedValueLabel: UILabel!
    @IBOutlet weak var giveRateValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        okBtn.cornerRadius = 4
        okBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ConfirmTPointSettingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "confirm_t_point_setting".localized()
        messageLabel.text = "is_the_bellow_setting_ok".localized()
        okBtn.setTitle("ok".localized(), for: .normal)
        
        giveThePurchasedLabel.text = "give_the_purchased_t_point".localized()
        giveRateLabel.text = "give_rate".localized()
    }

}
