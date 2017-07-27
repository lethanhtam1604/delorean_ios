//
//  FourthView.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import FontAwesomeKit

class FourthView: UIView {

    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var paidByTPointLabel: UILabel!
    @IBOutlet weak var paidByOtherSystemLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var creditCardLabel: UILabel!
    @IBOutlet weak var debitCardLabel: UILabel!
    @IBOutlet weak var voucherLabel: UILabel!
    @IBOutlet weak var receivedLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    let closeBtn = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(closeBtn)
        
        let closeIcon = FAKIonIcons.closeIcon(withSize: 40)
        closeIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.black)
        let closeImg  = closeIcon?.image(with: CGSize(width: 40, height: 40))
        
        closeBtn.setImage(closeImg, for: .normal)
        closeBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        closeBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        closeBtn.autoSetDimensions(to: CGSize(width: 55, height: 55))
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "FourthView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        totalAmountLabel.text = String(PosManager.getInstance().paymentStatement.total) + "円"
        paidByTPointLabel.text = String(PosManager.getInstance().paymentStatement.paidByTPoint) + "円"
        paidByOtherSystemLabel.text = String(PosManager.getInstance().paymentStatement.paidByOtherPoint) + "円"
        cashLabel.text = String(PosManager.getInstance().paymentStatement.cash) + "円"
        creditCardLabel.text = String(PosManager.getInstance().paymentStatement.creditCard) + "円"
        debitCardLabel.text = String(PosManager.getInstance().paymentStatement.debitCard) + "円"
        voucherLabel.text = String(PosManager.getInstance().paymentStatement.voucher) + "円"
        receivedLabel.text = String(PosManager.getInstance().paymentStatement.receivedTotal) + "円"
        changeLabel.text = String(PosManager.getInstance().paymentStatement.change) + "円"
    }
}
