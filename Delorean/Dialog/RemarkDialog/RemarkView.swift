//
//  RemarkView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/19/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class RemarkView: UIView {
    
    @IBOutlet weak var saveBtn: BFPaperButton!
    @IBOutlet weak var remarkTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        saveBtn.cornerRadius = 4
        saveBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        remarkTextView.layer.cornerRadius = 4
        remarkTextView.layer.borderColor = UIColor.black.cgColor
        remarkTextView.layer.borderWidth = 0.5
        remarkTextView.textAlignment = .center
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "RemarkView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        saveBtn.setTitle("save".localized(), for: .normal)
    }
    
}
