//
//  AppDelegate.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/16/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics
import PureLayout
import IQKeyboardManager
import MBProgressHUD
import CustomIOSAlertView
import BFPaperButton
import FontAwesomeKit
import WYPopoverController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var frontNavigationController : FrontNavigationController!
    var currentViewController: UIViewController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Crashlytics
        Fabric.with([Crashlytics.self])
        
        //HockeyApp
        BITHockeyManager.shared().configure(withIdentifier: "743d250be52541a684ae1d25ae963688")
        BITHockeyManager.shared().start()
        BITHockeyManager.shared().authenticator.authenticateInstallation()
        
        //set light status bar for whole ViewController
        UIApplication.shared.statusBarStyle = .lightContent
        
        //KeyboardManager
        IQKeyboardManager.shared().isEnabled = true
        
        //SQLite
        Utils.copyFile(fileName: "Delorean.db")
        
        //Test Fairy
//        TestFairy.begin("9dde72eec2ad7ff5df731451ef5079d47f21d309")
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Delorean")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        var context: NSManagedObjectContext!
        
        if #available(iOS 10.0, *) {
            context = persistentContainer.viewContext
        } else {
            guard let modelURL = Bundle.main.url(forResource: "Model", withExtension:"momd") else {
                fatalError("Error loading model from bundle")
            }
            guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
                fatalError("Error initializing mom from: \(modelURL)")
            }
            let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
            context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let docURL = urls[urls.endIndex-1]
            let storeURL = docURL.appendingPathComponent("Model.sqlite")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

