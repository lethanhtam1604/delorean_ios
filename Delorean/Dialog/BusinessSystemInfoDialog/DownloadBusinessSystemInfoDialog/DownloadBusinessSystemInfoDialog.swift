//
//  DownloadBusinessSystemInfoDialog.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/29/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class DownloadBusinessSystemInfoDialog {
    
    private let customIOSAlertView = CustomIOSAlertView()
    private var customView: DownloadBusinessSystemInfoView!
    private var timer: Timer!
    private var progressValue: Float = 0
    
    init() {
        customView = DownloadBusinessSystemInfoView.instanceFromNib() as! DownloadBusinessSystemInfoView
        customView.layer.cornerRadius = 10
        customIOSAlertView?.containerView  = customView
        customIOSAlertView?.buttonTitles = nil
        
        customView.suspendBtn.addTarget(self, action: #selector(self.suspendClicked(_:)), for: .touchUpInside)
        
    }
    
    @objc func suspendClicked(_ sender: AnyObject) {
        resetProgress()
    }
    
    func showDialog() {
        customIOSAlertView?.show()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    func setAllDataScreenByLocalize() {
        customView.setAllDataScreenByLocalize()
    }
    
    @objc func updateTimer() {
        progressValue += 0.1
        customView.updateDownloadProgressValue(value: progressValue)
        if(Int(progressValue) == 1) {
            resetProgress()
        }
    }
    
    private func resetProgress() {
        customIOSAlertView?.close()
        timer.invalidate()
        progressValue = 0
        customView.updateDownloadProgressValue(value: progressValue)
    }
}
