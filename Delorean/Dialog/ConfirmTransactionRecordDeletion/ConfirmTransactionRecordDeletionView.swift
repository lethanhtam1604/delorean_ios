//
//  ConfirmTransactionRecordDeletionView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/4/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ConfirmTransactionRecordDeletionView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var yesBtn: BFPaperButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateValueLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yesBtn.cornerRadius = 4
        yesBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ConfirmTransactionRecordDeletionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "confirm_transaction_record_deletion".localized()
        messageLabel.text = "are_you_sure_you_want_to_delete_the_data_before_this_following_day".localized()
        yesBtn.setTitle("yes".localized(), for: .normal)
        
        dateLabel.text = "date".localized()
    }
}
