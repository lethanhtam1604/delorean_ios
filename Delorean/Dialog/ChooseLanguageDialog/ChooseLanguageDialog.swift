//
//  ChooseLanguageDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/29/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class ChooseLanguageDialog {

    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: ChooseLanguageView!
    
    init() {
        customView = ChooseLanguageView.instanceFromNib() as! ChooseLanguageView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.japaneseBtn.addTarget(self, action: #selector(ChooseLanguageDialog.japaneseClicked(_:)), for: .touchUpInside)
        
        customView.englishBtn.addTarget(self, action: #selector(ChooseLanguageDialog.englishClicked(_:)), for: .touchUpInside)
        
        customView.vietnameseBtn.addTarget(self, action: #selector(ChooseLanguageDialog.vietnameseClicked(_:)), for: .touchUpInside)
        
        customView.closeBtn.addTarget(self, action: #selector(ChooseLanguageDialog.closeClicked(_:)), for: .touchUpInside)
    }
    
    @objc func japaneseClicked(_ sender: AnyObject) {
        Localize.setCurrentLanguage("ja")
        customIOSAlertView?.close()
    }
    
    @objc func englishClicked(_ sender: AnyObject) {
        Localize.setCurrentLanguage("en")
        customIOSAlertView?.close()
    }
    
    @objc func vietnameseClicked(_ sender: AnyObject) {
        Localize.setCurrentLanguage("vi")
        customIOSAlertView?.close()
    }
    
    @objc func closeClicked(_ sender: AnyObject) {
        customIOSAlertView?.close()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
}
