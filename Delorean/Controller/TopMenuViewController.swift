//
//  TopMenuViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/28/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CustomIOSAlertView

class TopMenuViewController: UIViewController {
    
    @IBOutlet weak var normalCashRegisterStartBtn: UIButton!
    @IBOutlet weak var businessSystemInformationAcquisitionBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var taxFreeCashRegisterStartBtn: UIButton!
    @IBOutlet weak var deleteTransactionRecordBtn: UIButton!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var accquiredTimeLabel: UILabel!
    
    private var errorMessageDialog: ErrorMessageDialog!
    private var downloadBusinessSystemInfoDialog: DownloadBusinessSystemInfoDialog!
    
    private var constraintsNeeded = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        //init View
        normalCashRegisterStartBtn.backgroundColor = UIColor(hexString: BLUE_LIGHT_BUTTON_COLOR)
        businessSystemInformationAcquisitionBtn.backgroundColor = UIColor(hexString: BLUE_LIGHT_1_BUTTON_COLOR)
        settingBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        taxFreeCashRegisterStartBtn.backgroundColor = UIColor(hexString: PINK_BUTTON_COLOR)
        deleteTransactionRecordBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        normalCashRegisterStartBtn.layer.cornerRadius = 4
        businessSystemInformationAcquisitionBtn.layer.cornerRadius = 4
        settingBtn.layer.cornerRadius = 4
        taxFreeCashRegisterStartBtn.layer.cornerRadius = 4
        deleteTransactionRecordBtn.layer.cornerRadius = 4
        setAllDataScreenByLocalize()
        
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            
            menuLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            menuLabel.autoPinEdge(toSuperviewEdge: .left, withInset: ScreenSize.SCREEN_WIDTH/2 - 190)
            menuLabel.autoSetDimensions(to: CGSize(width: 200, height: 30))
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLanguageRuntime), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    func updateLanguageRuntime(){
        setAllDataScreenByLocalize()
    }
    
    private func setAllDataScreenByLocalize() {
        menuLabel.text = "menu".localized().uppercased()
        normalCashRegisterStartBtn.setTitle("normal_cash_register_start".localized(), for: .normal)
        businessSystemInformationAcquisitionBtn.setTitle("business_system_information_acquisition".localized(), for: .normal)
        settingBtn.setTitle("setting".localized(), for: .normal)
        taxFreeCashRegisterStartBtn.setTitle("tax_free_cash_register_start".localized(), for: .normal)
        deleteTransactionRecordBtn.setTitle("delete_transaction_record".localized(), for: .normal)
        accquiredTimeLabel.text = "last_acquired_time".localized() + ": 2016/12/23 10:00:00"
    }
    
    @IBAction func normalCashRegisterStartClicked(_ sender: AnyObject) {
        
    }
    
    @IBAction func businessSystemInformationAcquisitionClicked(_ sender: AnyObject) {
        errorMessageDialog = ErrorMessageDialog()
        errorMessageDialog.setAllDataScreenByLocalize()
        errorMessageDialog.showDialog()
        
        downloadBusinessSystemInfoDialog = DownloadBusinessSystemInfoDialog()
        downloadBusinessSystemInfoDialog.setAllDataScreenByLocalize()
        downloadBusinessSystemInfoDialog.showDialog()
    }
    
    @IBAction func settingClicked(_ sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingViewController = mainStoryboard.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        let nav = UINavigationController(rootViewController: settingViewController)
        self.present(nav, animated: true, completion: nil)
    }
    
    @IBAction func taxFreeCashRegisterStartClicked(_ sender: AnyObject) {
        
    }
    
    @IBAction func deleteTransactionRecordClicked(_ sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let deleteTransactionRecordViewController = mainStoryboard.instantiateViewController(withIdentifier: "DeleteTransactionRecordViewController") as! DeleteTransactionRecordViewController
        let nav = UINavigationController(rootViewController: deleteTransactionRecordViewController)
        self.present(nav, animated: true, completion: nil)
    }
    
    @IBAction func homeClicked(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)

    }
}
