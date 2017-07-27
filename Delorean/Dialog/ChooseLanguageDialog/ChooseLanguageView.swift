//
//  ChooseLanguageView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/29/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class ChooseLanguageView: UIView {

    @IBOutlet weak var chooseLanguageLabel: UILabel!
    @IBOutlet weak var japaneseBtn: BFPaperButton!
    @IBOutlet weak var englishBtn: BFPaperButton!
    @IBOutlet weak var vietnameseBtn: BFPaperButton!
    @IBOutlet weak var closeBtn: BFPaperButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        japaneseBtn.cornerRadius = 4
        japaneseBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        
        englishBtn.cornerRadius = 4
        englishBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        
        vietnameseBtn.cornerRadius = 4
        vietnameseBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        
        closeBtn.cornerRadius = 4
        closeBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        
        setAllDataScreenByLocalize()
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ChooseLanguageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        closeBtn.setTitle("close".localized(), for: .normal)
        chooseLanguageLabel.text = "choose_language".localized()
    }
 
}
