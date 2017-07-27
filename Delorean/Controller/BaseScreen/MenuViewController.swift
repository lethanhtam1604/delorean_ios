//
//  MenuViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/21/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    private var MenuCellReuseIdentifier: NSString = "MenuCellReuseIdentifier"
    private var currentMenuCell: MenuViewCell!
    private var chooseLanguageDialog = ChooseLanguageDialog()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        let imageView: UIImageView = UIImageView(image: UIImage(named: "background_menu"))
        imageView.changeSulfur()
        menuTableView.backgroundView = imageView
        view.backgroundColor = UIColor.blue
        
        menuTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        menuTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        menuTableView.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellReuseIdentifier: MenuCellReuseIdentifier as String)
        menuTableView.sectionHeaderHeight = 150
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLanguageRuntime), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    func updateLanguageRuntime(){
        MenuManager.shared.createDatas()
        menuTableView.reloadData()
        chooseLanguageDialog.setAllDataScreenByLocalize()
    }
    
    // MARK: - Manager TableView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuManager.shared.menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MenuViewCell! = tableView.dequeueReusableCell(withIdentifier: MenuCellReuseIdentifier as String) as? MenuViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none;
        
        let menuItem = MenuManager.shared.menus[indexPath.row] as! MenuModel
        cell.setData(menuItem: menuItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menuItem = MenuManager.shared.menus[indexPath.row] as! MenuModel
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var viewController: UIViewController!
        
        if(menuItem.withIdentifier == 1) {
            viewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        }
        else if(menuItem.withIdentifier == 3) {
            chooseLanguageDialog = ChooseLanguageDialog()
            chooseLanguageDialog.showDialog()
        }
        else if(menuItem.withIdentifier == 4) {
            viewController = mainStoryboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        }
        else if(menuItem.withIdentifier == 6) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: "APIViewController") as! APIViewController
            let nav = UINavigationController(rootViewController: loginViewController)
            appDelegate.currentViewController.present(nav, animated: true, completion: nil)
        }
        else {
            viewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        }
        
        if(menuItem.highlight) {
            appDelegate.currentViewController = viewController
            appDelegate.frontNavigationController.setViewControllers([viewController], animated: false)
        }
        revealViewController().revealToggle(animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = MenuHeaderViewCell.instanceFromNib()
        
        view.backgroundColor = UIColor.clear
        return view
    }
}
