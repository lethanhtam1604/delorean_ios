//
//  MainViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/16/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "home".localized()
        
        //init navigation bar
        navigationController!.navigationBar.barTintColor = UIColor(hexString: MAIN_COLOR)
        navigationController!.navigationBar.tintColor = UIColor.white
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController!.navigationBar.barStyle = UIBarStyle.black;
        navigationController!.navigationBar.shadowImage = UIImage()
        
        view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "Menu"), for: .normal)
        button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = button
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        if revealViewController() != nil {
            if(DeviceType.IS_IPAD) {
                revealViewController().rearViewRevealWidth = 330
            }
            else {
                revealViewController().rearViewRevealWidth = ScreenSize.SCREEN_WIDTH - 50
            }
            revealViewController().frontViewShadowColor = UIColor.black;
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLanguageRuntime), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    func updateLanguageRuntime(){
        title = "home".localized()
    }
    
    @IBAction func goToDeloreanClicked(_ sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let nav = UINavigationController(rootViewController: loginViewController)
        self.present(nav, animated: true, completion: nil)
    }
    
    @IBAction func posClicked(_ sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let productViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        let nav = UINavigationController(rootViewController: productViewController)
        self.present(nav, animated: true, completion: nil)

    }
}
