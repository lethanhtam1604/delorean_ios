//
//  APIResultViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/22/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class APIResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var responeLabel: UILabel!
    
    var departments: [DepartmentModel] = []
    
    @IBOutlet weak var responseAPITableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Result"
        
        //init navigation bar 
        navigationController!.navigationBar.barTintColor = UIColor(hexString: MAIN_COLOR)
        navigationController!.navigationBar.tintColor = UIColor.white
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController!.navigationBar.barStyle = UIBarStyle.black; navigationController!.navigationBar.shadowImage = UIImage()
        view.backgroundColor = UIColor.white
        //init bar button 
        let btnDone = UIBarButtonItem(title: "Cancel", style:.plain, target: self, action: #selector(done_Clicked))
        navigationItem.rightBarButtonItem = btnDone
        Global.view = self.view
        let getAllDepartmentListApiRequest = GetAllDepartmentListApiRequest()
        getAllDepartmentListApiRequest.getAllDepartmentList() { (success, data, message) in
            if success == true {
                self.departments = data as! [DepartmentModel]
           
                self.responseAPITableview.reloadData()
            }
            else {
                
            }
        }
        
        // Initialize TableView
        responseAPITableview.delegate = self
        responseAPITableview.dataSource = self
        responseAPITableview.separatorColor = UIColor.black
        responseAPITableview.tableFooterView = UIView(frame: CGRect.zero)
        
        responseAPITableview.register(UINib(nibName: "ResponseViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentCellReuseIdentifier" as String)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func done_Clicked(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Manager TableView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ResponseViewCell! = tableView.dequeueReusableCell(withIdentifier: "DepartmentCellReuseIdentifier" as String) as? ResponseViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none;
        
        let department: DepartmentModel = departments[indexPath.row]
        cell.setData(text: department.parseToString())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
