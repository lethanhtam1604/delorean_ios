//
//  Utils.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/22/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import MBProgressHUD

class Utils {

    public static func showHub(view : UIView) {
        let mbProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        mbProgressHUD.mode = MBProgressHUDMode.indeterminate
    }

    public static func hideHub(view : UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    public static func getPath(fileName: String) -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        return fileURL.path
    }
    
    public static func copyFile(fileName: NSString) {
        let dbPath: String = Utils.getPath(fileName: fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath) {
            
            let documentsURL = Bundle.main.resourceURL
            let fromPath = documentsURL!.appendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            let alert: UIAlertView = UIAlertView()
            if (error != nil) {
                alert.title = "Error Occured"
                alert.message = error?.localizedDescription
            } else {
                alert.title = "Successfully Copy"
                alert.message = "Your database copy successfully"
            }
            alert.delegate = nil
            alert.addButton(withTitle: "Ok")
            alert.show()
        }
    }
    
    public static func numberToComma(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    
}
