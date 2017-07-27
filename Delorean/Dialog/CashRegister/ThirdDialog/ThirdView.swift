//
//  ThirdView.swift
//  POS3
//
//  Created by Thanh-Tam Le on 10/10/16.
//  Copyright © 2016 Yoshi Nagase. All rights reserved.
//

import UIKit
import FontAwesomeKit

class ThirdView: UIView {

    @IBOutlet weak var thirdBtn: UIButton!
    
    let closeBtn = UIButton()
    @IBOutlet weak var changeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ThirdView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        changeLabel.text = "お釣り: " + String(PosManager.getInstance().paymentStatement.change) + "円"
    }

}
