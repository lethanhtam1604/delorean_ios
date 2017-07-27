//
//  APIViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/21/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class APIViewController: UIViewController {
    
    @IBOutlet weak var apiListScrollView: UIScrollView!
    @IBOutlet weak var apiContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.title = "API List"
        
        //init navigation bar
        navigationController!.navigationBar.barTintColor = UIColor(hexString: MAIN_COLOR)
        navigationController!.navigationBar.tintColor = UIColor.white
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController!.navigationBar.barStyle = UIBarStyle.black;
        navigationController!.navigationBar.shadowImage = UIImage()
        view.backgroundColor = UIColor.white
        
        //init bar button
        
        let btnDone = UIBarButtonItem(title: "Cancel", style:.plain, target: self, action: #selector(done_Clicked))
        navigationItem.rightBarButtonItem = btnDone
        
        //add list api
  
        //---------------department--------------
        apiListScrollView.addSubview(createAPITitle(name: "Department", x: 10, y: 20, width: 200, height: 50))
        let widthBtn = Int(ScreenSize.SCREEN_WIDTH - 20)
        let xBtn = (Int(self.view.bounds.width) - widthBtn)/2
        
        apiListScrollView.addSubview(createAPIButton(name: "Get all department list", x: xBtn, y: 70, width: widthBtn, height: 40))
        apiListScrollView.addSubview(createAPIButton(name: "Get all department list 1", x: xBtn, y: 130, width: widthBtn, height: 40))
        
        //---------------department--------------
        apiListScrollView.addSubview(createAPITitle(name: "Currency", x: 10, y: 180, width: 200, height: 50))
        
        apiListScrollView.addSubview(createAPIButton(name: "Get all Currency list", x: xBtn, y: 230, width: widthBtn, height: 40))
        apiListScrollView.addSubview(createAPIButton(name: "Get all Currency list 1", x: xBtn, y: 280, width: widthBtn, height: 40))
        
        apiListScrollView.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height:950)
        apiListScrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight

    }
    
    private func createAPITitle(name: String, x: Int, y: Int, width: Int, height: Int) -> UILabel {
        let title = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        title.textAlignment = NSTextAlignment.left
        title.textColor = UIColor(hexString: MAIN_COLOR)
        title.text = name
        title.font = title.font.withSize(20)
        title.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        
        return title
    }
    
    private func createAPIButton(name: String, x: Int, y: Int, width: Int, height: Int) -> UIButton {
        let button = BFPaperButton(frame: CGRect(x: x, y: y, width: width, height: height))
        button.backgroundColor = UIColor(hexString: MAIN_COLOR)
        button.setTitle(name, for: .normal)
        button.addTarget(self, action: #selector(getAllListDeptmentClicked), for: .touchUpInside)
   
        return button
    }

    @IBAction func getAllListDeptmentClicked(_ sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: "APIResultViewController") as! APIResultViewController
        let nav = UINavigationController(rootViewController: loginViewController)
        navigationController!.present(nav, animated: true, completion: nil)
    }
    @IBAction func getDepartmetnClicked(_ sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: "APIResultViewController") as! APIResultViewController
        let nav = UINavigationController(rootViewController: loginViewController)
        navigationController!.present(nav, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func done_Clicked(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
