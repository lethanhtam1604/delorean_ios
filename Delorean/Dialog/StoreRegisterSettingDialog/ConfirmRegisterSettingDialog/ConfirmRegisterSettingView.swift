//
//  ConfirmRegisterSettingView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/3/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ConfirmRegisterSettingView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var yesBtn: BFPaperButton!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var cashRegisterNoLabel: UILabel!
    @IBOutlet weak var storeAddressLabel: UILabel!
    @IBOutlet weak var storeTelLabel: UILabel!
    @IBOutlet weak var appropriateTaxOfficeLabel: UILabel!
    @IBOutlet weak var taxPaymentPlaceLabel: UILabel!
    @IBOutlet weak var storeNameValueLabel: UILabel!
    @IBOutlet weak var cashRegisterNoValueLabel: UILabel!
    @IBOutlet weak var storeAddressValueLabel: UILabel!
    @IBOutlet weak var storeTelValueLabel: UILabel!
    @IBOutlet weak var appropriateTaxOfficeValueLabel: UILabel!
    @IBOutlet weak var taxPaymentPlaceValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yesBtn.cornerRadius = 4
        yesBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ConfirmRegisterSettingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "confirm_store_register_setting".localized()
        messageLabel.text = "are_you_sure_you_want_to_save_the_following_setting".localized()
        yesBtn.setTitle("yes".localized(), for: .normal)
        
        storeNameLabel.text = "store_name".localized()
        cashRegisterNoLabel.text = "cash_register_no".localized()
        storeAddressLabel.text = "store_address".localized()
        storeTelLabel.text = "store_tel".localized()
        appropriateTaxOfficeLabel.text = "appropriate_tax_office".localized()
        taxPaymentPlaceLabel.text = "tax_payment_place".localized()
    }
}
