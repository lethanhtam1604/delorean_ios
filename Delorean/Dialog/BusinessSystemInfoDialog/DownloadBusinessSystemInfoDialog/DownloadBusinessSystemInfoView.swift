//
//  DownloadBusinessSystemInfoView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/29/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class DownloadBusinessSystemInfoView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var suspendBtn: BFPaperButton!
    @IBOutlet weak var downloadProgressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        suspendBtn.cornerRadius = 4
        suspendBtn.backgroundColor = UIColor(hexString: PINK_DARK_BUTTON_COLOR)
        
        downloadProgressView.transform = downloadProgressView.transform.scaledBy(x: 1, y: 10)
        downloadProgressView.progressTintColor = UIColor(hexString: BLUE_LIGHT_2_BUTTON_COLOR)
        downloadProgressView.trackTintColor = UIColor(hexString: GRAY_BUTTON_COLOR)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "DownloadBusinessSystemInfoView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "business_system_information_acquisition".localized()
        messageLabel.text = "business_system_information_acquiring".localized()
        suspendBtn.setTitle("suspend".localized(), for: .normal)
    }
    
    func updateDownloadProgressValue (value: Float) {
        downloadProgressView.progress = value
    }
}
