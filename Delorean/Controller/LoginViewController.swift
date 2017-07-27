//
//  LoginViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/28/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var titleEmployeeCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        
        //init View
        loginBtn.backgroundColor = UIColor(hexString: BLUE_BUTTON_COLOR)
        loginBtn.layer.cornerRadius = 4
        
        setAllDataScreenByLocalize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLanguageRuntime), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    func updateLanguageRuntime(){
        setAllDataScreenByLocalize()
    }
    
    private func setAllDataScreenByLocalize() {
        loginBtn.setTitle("login".localized(), for: .normal)
        loginLabel.text = "login".localized()
        titleEmployeeCodeLabel.text = "employee_code_for_cash_register".localized()
    }

    @IBAction func loginBtnClicked(_ sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let topMenuViewController = mainStoryboard.instantiateViewController(withIdentifier: "TopMenuViewController") as! TopMenuViewController
        let nav = UINavigationController(rootViewController: topMenuViewController)
        self.present(nav, animated: true, completion: nil)
    }
    
    @IBAction func homeClicked(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
