//
//  SettingViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/29/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, DialogDelegate {
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var accessPointBtn: UIButton!
    @IBOutlet weak var storeBtn: UIButton!
    @IBOutlet weak var goToMenuBtn: UIButton!
    @IBOutlet weak var setting1Label: UILabel!
    @IBOutlet weak var inputSetting1TextField: UITextField!
    @IBOutlet weak var setting2Label: UILabel!
    @IBOutlet weak var inputSetting2TextField: UITextField!
    @IBOutlet weak var setting3Label: UILabel!
    @IBOutlet weak var inputSetting3TextField: UITextField!
    @IBOutlet weak var connectionSettingInputCancelBtn: UIButton!
    @IBOutlet weak var connectionTestBtn: UIButton!
    @IBOutlet weak var connectionSettingBtn: UIButton!
    @IBOutlet weak var accessPointContainView: UIView!
    @IBOutlet weak var connectionStatusLabel: UILabel!
    @IBOutlet weak var storeContainView: UIView!
    @IBOutlet weak var passcodeLabel: UILabel!
    @IBOutlet weak var inputPasscodeTextField: UITextField!
    @IBOutlet weak var cashRegisterSettingBtn: UIButton!
    @IBOutlet weak var currentSettingLabel: UILabel!
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
    @IBOutlet weak var tPointBtn: UIButton!
    @IBOutlet weak var tPointContainView: UIView!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var offBtn: UIButton!
    @IBOutlet weak var giveThePurchasedLabel: UILabel!
    @IBOutlet weak var giveRateLabel: UILabel!
    @IBOutlet weak var inputRateValueTextField: UITextField!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    private var confirmConnectionSettingDialog: ConfirmConnectionSettingDialog!
    private var errorConnectionSettingDialog: ErrorConnectionSettingDialog!
    private var confirmRegisterSettingDialog: ConfirmRegisterSettingDialog!
    private var errorRegisterSettingDialog: ErrorRegisterSettingDialog!
    private var settingCompleteDialog: SettingCompleteDialog!
    private var confirmTPointSettingDialog: ConfirmTPointSettingDialog!

    private var giveThePurchasedValue: String!
    private var constraintsNeeded = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        //init View
        accessPointBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        storeBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        tPointBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        okBtn.backgroundColor = UIColor(hexString: BLUE_LIGHT_3_BUTTON_COLOR)
        offBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        saveBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        goToMenuBtn.backgroundColor = UIColor.white
        connectionSettingInputCancelBtn.backgroundColor = UIColor.red
        connectionTestBtn.backgroundColor = UIColor(hexString: GRAY_LIGHT_BUTTON_COLOR)
        connectionSettingBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        cashRegisterSettingBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        
        
        accessPointBtn.layer.cornerRadius = 6
        storeBtn.layer.cornerRadius = 6
        tPointBtn.layer.cornerRadius = 6
        okBtn.layer.cornerRadius = 6
        offBtn.layer.cornerRadius = 6
        saveBtn.layer.cornerRadius = 6
        goToMenuBtn.layer.cornerRadius = 6
        connectionSettingInputCancelBtn.layer.cornerRadius = 6
        connectionTestBtn.layer.cornerRadius = 6
        connectionSettingBtn.layer.cornerRadius = 6
        cashRegisterSettingBtn.layer.cornerRadius = 6
        setAllDataScreenByLocalize()
        
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            
            settingLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            settingLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
            settingLabel.autoSetDimensions(to: CGSize(width: 200, height: 60))
            
            accessPointBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 200)
            accessPointBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
            accessPointBtn.autoSetDimensions(to: CGSize(width: 150, height: 60))
            
            storeBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 350)
            storeBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
            storeBtn.autoSetDimensions(to: CGSize(width: 150, height: 60))
            
            tPointBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 500)
            tPointBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
            tPointBtn.autoSetDimensions(to: CGSize(width: 140, height: 60))
            
            goToMenuBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            goToMenuBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
            goToMenuBtn.autoSetDimensions(to: CGSize(width: 140, height: 60))
            
            //set position for access point setting function
            
            accessPointContainView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 250, left: 0, bottom: 0, right: 0))
            
            setting1Label.autoPinEdge(toSuperviewEdge: .left, withInset: 150)
            setting1Label.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            setting1Label.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            setting2Label.autoPinEdge(toSuperviewEdge: .left, withInset: 150)
            setting2Label.autoPinEdge(toSuperviewEdge: .top, withInset: 80)
            setting2Label.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            setting3Label.autoPinEdge(toSuperviewEdge: .left, withInset: 150)
            setting3Label.autoPinEdge(toSuperviewEdge: .top, withInset: 160)
            setting3Label.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            inputSetting1TextField.autoPinEdge(toSuperviewEdge: .left, withInset: 280)
            inputSetting1TextField.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            inputSetting1TextField.autoSetDimensions(to: CGSize(width: 400, height: 45))
            
            inputSetting2TextField.autoPinEdge(toSuperviewEdge: .left, withInset: 280)
            inputSetting2TextField.autoPinEdge(toSuperviewEdge: .top, withInset: 80)
            inputSetting2TextField.autoSetDimensions(to: CGSize(width: 400, height: 45))
            
            inputSetting3TextField.autoPinEdge(toSuperviewEdge: .left, withInset: 280)
            inputSetting3TextField.autoPinEdge(toSuperviewEdge: .top, withInset: 160)
            inputSetting3TextField.autoSetDimensions(to: CGSize(width: 400, height: 45))
            
            connectionSettingInputCancelBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 700)
            connectionSettingInputCancelBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 250)
            connectionSettingInputCancelBtn.autoSetDimensions(to: CGSize(width: 168, height: 50))
            
            connectionTestBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 700)
            connectionTestBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 310)
            connectionTestBtn.autoSetDimensions(to: CGSize(width: 168, height: 35))
            
            connectionSettingBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 700)
            connectionSettingBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 360)
            connectionSettingBtn.autoSetDimensions(to: CGSize(width: 168, height: 35))
            
            connectionStatusLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 880)
            connectionStatusLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 310)
            connectionStatusLabel.autoSetDimensions(to: CGSize(width: 100, height: 35))
            
            //set position for store setting function
            
            storeContainView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 250, left: 0, bottom: 0, right: 0))
            storeContainView.isHidden = true
            
            passcodeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 140)
            passcodeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            passcodeLabel.autoSetDimensions(to: CGSize(width: 200, height: 50))
            
            inputPasscodeTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 280)
            inputPasscodeTextField.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            inputPasscodeTextField.autoSetDimensions(to: CGSize(width: 400, height: 50))
            
            cashRegisterSettingBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 750)
            cashRegisterSettingBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
            cashRegisterSettingBtn.autoSetDimensions(to: CGSize(width: 215, height: 50))
            
            currentSettingLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            currentSettingLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 140)
            currentSettingLabel.autoSetDimensions(to: CGSize(width: 200, height: 60))
            
            storeNameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            storeNameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 200)
            storeNameLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            cashRegisterNoLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            cashRegisterNoLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 250)
            cashRegisterNoLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            storeAddressLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            storeAddressLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 300)
            storeAddressLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            storeTelLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            storeTelLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 350)
            storeTelLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            appropriateTaxOfficeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            appropriateTaxOfficeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 400)
            appropriateTaxOfficeLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            taxPaymentPlaceLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 100)
            taxPaymentPlaceLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 450)
            taxPaymentPlaceLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            storeNameValueLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 400)
            storeNameValueLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 200)
            storeNameValueLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            cashRegisterNoValueLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 400)
            cashRegisterNoValueLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 250)
            cashRegisterNoValueLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            storeAddressValueLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 400)
            storeAddressValueLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 300)
            storeAddressValueLabel.autoSetDimensions(to: CGSize(width: 600, height: 45))
            
            storeTelValueLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 400)
            storeTelValueLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 350)
            storeTelValueLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            appropriateTaxOfficeValueLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 400)
            appropriateTaxOfficeValueLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 400)
            appropriateTaxOfficeValueLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            taxPaymentPlaceValueLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 400)
            taxPaymentPlaceValueLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 450)
            taxPaymentPlaceValueLabel.autoSetDimensions(to: CGSize(width: 200, height: 45))
            
            //set position for store setting function
            tPointContainView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 250, left: 0, bottom: 0, right: 0))
            
            giveThePurchasedLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
            giveThePurchasedLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            giveThePurchasedLabel.autoSetDimensions(to: CGSize(width: 150, height: 45))
            
            okBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 250)
            okBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            okBtn.autoSetDimensions(to: CGSize(width: 100, height: 35))
            
            offBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 350)
            offBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            offBtn.autoSetDimensions(to: CGSize(width: 100, height: 35))
            
            giveRateLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
            giveRateLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
            giveRateLabel.autoSetDimensions(to: CGSize(width: 150, height: 45))
            
            inputRateValueTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 250)
            inputRateValueTextField.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
            inputRateValueTextField.autoSetDimensions(to: CGSize(width: 150, height: 45))
            
            percentLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 410)
            percentLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
            percentLabel.autoSetDimensions(to: CGSize(width: 45, height: 45))
            
            saveBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 450)
            saveBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 200)
            saveBtn.autoSetDimensions(to: CGSize(width: 120, height: 30))
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
        settingLabel.text = "settings".localized().uppercased()
        accessPointBtn.setTitle("connection".localized(), for: .normal)
        storeBtn.setTitle("store_register".localized(), for: .normal)
        tPointBtn.setTitle("t_point".localized(), for: .normal)
        goToMenuBtn.setTitle("go_to_menu".localized(), for: .normal)
        okBtn.setTitle("ok".localized().uppercased(), for: .normal)
        offBtn.setTitle("off".localized().uppercased(), for: .normal)
        giveThePurchasedValue = "ok".localized().uppercased()
        
        setting1Label.text = "settings".localized() + " 1"
        setting2Label.text = "settings".localized() + " 2"
        setting3Label.text = "settings".localized() + " 3"
        connectionSettingInputCancelBtn.setTitle("cancel_inputting_connection_setting".localized(), for: .normal)
        connectionTestBtn.setTitle("test_connection".localized(), for: .normal)
        connectionSettingBtn.setTitle("set_connection".localized(), for: .normal)
        
        let status = "ok".localized().uppercased() + " " + "or".localized().lowercased() + " " + "ng".localized().uppercased()
        var statusMutableString = NSMutableAttributedString()
        statusMutableString = NSMutableAttributedString(string: status, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!])
        statusMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSRange(location:6,length:2))
        connectionStatusLabel.attributedText = statusMutableString
        
        passcodeLabel.text = "store_register_passcode".localized()
        cashRegisterSettingBtn.setTitle("set_store_register_setting".localized(), for: .normal)
        currentSettingLabel.text = "current_setting".localized()
        storeNameLabel.text = "store_name".localized()
        cashRegisterNoLabel.text = "cash_register_no".localized()
        storeAddressLabel.text = "store_address".localized()
        storeTelLabel.text = "store_tel".localized()
        appropriateTaxOfficeLabel.text = "appropriate_tax_office".localized()
        taxPaymentPlaceLabel.text = "tax_payment_place".localized()
        
        giveThePurchasedLabel.text = "give_the_purchased_t_point".localized()
        giveRateLabel.text = "give_rate".localized()
    }
    
    @IBAction func accessPointClicked(_ sender: AnyObject) {
        accessPointContainView.isHidden = false
        storeContainView.isHidden = true
        tPointContainView.isHidden = true
        accessPointBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        storeBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        tPointBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
    }
    
    @IBAction func storeClicked(_ sender: AnyObject) {
        accessPointContainView.isHidden = true
        storeContainView.isHidden = false
        tPointContainView.isHidden = true
        accessPointBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        tPointBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        storeBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
    }
    
    @IBAction func tPointClicked(_ sender: AnyObject) {
        accessPointContainView.isHidden = true
        storeContainView.isHidden = true
        tPointContainView.isHidden = false
        accessPointBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        tPointBtn.backgroundColor = UIColor(hexString: YELLOW_BUTTON_COLOR)
        storeBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
    }
    
    @IBAction func okBtnClicked(_ sender: AnyObject) {
        giveThePurchasedValue = "ok".localized().uppercased()
        okBtn.backgroundColor = UIColor(hexString: BLUE_LIGHT_3_BUTTON_COLOR)
        offBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)

    }
    
    @IBAction func offBtnClicked(_ sender: AnyObject) {
        giveThePurchasedValue = "off".localized().uppercased()
        okBtn.backgroundColor = UIColor(hexString: GRAY_BUTTON_COLOR)
        offBtn.backgroundColor = UIColor(hexString: BLUE_LIGHT_3_BUTTON_COLOR)
    }
    
    @IBAction func saveBtnClicked(_ sender: AnyObject) {
        confirmTPointSettingDialog = ConfirmTPointSettingDialog()
        confirmTPointSettingDialog.setAllDataScreenByLocalize()
        confirmTPointSettingDialog.setValue(giveThePurchasedValue: giveThePurchasedValue, giveRateValue: inputRateValueTextField.text!)
        confirmTPointSettingDialog.showDialog()
    }
    
    @IBAction func goToMenuClicked(_ sender: AnyObject) {
        settingCompleteDialog = SettingCompleteDialog()
        settingCompleteDialog.delegate = self
        settingCompleteDialog.setAllDataScreenByLocalize()
        settingCompleteDialog.showDialog()
    }
    
    @IBAction func connectionSettingInputCancelClicked(_ sender: AnyObject) {
        
    }
    
    @IBAction func connectionTestClicked(_ sender: AnyObject) {
        
    }
    
    @IBAction func connectionSettingClicked(_ sender: AnyObject) {
        errorConnectionSettingDialog = ErrorConnectionSettingDialog()
        errorConnectionSettingDialog.setAllDataScreenByLocalize()
        errorConnectionSettingDialog.setSettingValue(setting1Value: inputSetting1TextField.text!, setting2Value: inputSetting2TextField.text!, setting3Value: inputSetting3TextField.text!)
        errorConnectionSettingDialog.showDialog()
        
        confirmConnectionSettingDialog = ConfirmConnectionSettingDialog()
        confirmConnectionSettingDialog.setAllDataScreenByLocalize()
        confirmConnectionSettingDialog.setSettingValue(setting1Value: inputSetting1TextField.text!, setting2Value: inputSetting2TextField.text!, setting3Value: inputSetting3TextField.text!)
        confirmConnectionSettingDialog.showDialog()
    }
    
    @IBAction func cashRegisterSettingClicked(_ sender: AnyObject) {
        errorRegisterSettingDialog = ErrorRegisterSettingDialog()
        errorRegisterSettingDialog.setAllDataScreenByLocalize()
        errorRegisterSettingDialog.showDialog()
        
        confirmRegisterSettingDialog = ConfirmRegisterSettingDialog()
        confirmRegisterSettingDialog.setAllDataScreenByLocalize()
        confirmRegisterSettingDialog.setStoreRegisterSettingValue(storeNameValue: storeNameValueLabel.text!, cashRegisterNoValue: cashRegisterNoValueLabel.text!, storeAddressValue: storeAddressValueLabel.text!, storeTelValue: storeTelValueLabel.text!, appropriateTaxOfficeValue: appropriateTaxOfficeValueLabel.text!, taxPaymentPlaceValue: taxPaymentPlaceValueLabel.text!)
        confirmRegisterSettingDialog.showDialog()
    }
    
    @IBAction func homeClicked(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func settingComplete() {
        dismiss(animated: true, completion: nil)
    }
}
