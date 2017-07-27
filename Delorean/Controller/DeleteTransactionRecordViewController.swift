//
//  DeleteTransactionRecordViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/3/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton

class DeleteTransactionRecordViewController: UIViewController, CKCalendarDelegate {

    @IBOutlet weak var goToMenuBtn: BFPaperButton!
    @IBOutlet weak var deleteTransactionRecordLabel: UILabel!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var deleteBtn: BFPaperButton!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var calendarView: UIView!
    
    private var constraintsNeeded = true
    
    private var dateFormatter : DateFormatter!
    private var minimumDate: NSDate!
    private var disabledDates: NSMutableArray = []
    
    private var confirmTransactionRecordDeletionDialog: ConfirmTransactionRecordDeletionDialog!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true

        //init View
        goToMenuBtn.backgroundColor = UIColor.white
        deleteBtn.backgroundColor = UIColor(hexString: PINK_BUTTON_COLOR)

        goToMenuBtn.layer.cornerRadius = 4
        deleteBtn.layer.cornerRadius = 4
        
        let calendar = CKCalendarView.init(startDay: startMonday)
        calendar?.delegate = self;
        
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "dd/MM/yyyy"
        self.minimumDate = self.dateFormatter.date(from: "20/09/2012") as NSDate!
        
        self.disabledDates = [[self.dateFormatter.date(from: "20/09/2012")], [self.dateFormatter.date(from: "20/09/2012")], [self.dateFormatter.date(from: "20/09/2012")]]
        
        calendar?.onlyShowCurrentMonth = false;
        calendar?.adaptHeightToNumberOfWeeksInMonth = true;
        
        calendarView.addSubview(calendar!)
        calendarView.isHidden = false
        
        setAllDataScreenByLocalize()

        self.view.setNeedsUpdateConstraints()
    }
    
    func calendar(_ calendar: CKCalendarView, willSelect date: Date) -> Bool {
        return self.dateIsDisabled(date: (date as NSDate) as Date)
    }
    
    private func dateIsDisabled(date: Date) -> Bool {
        
//        for index in 0..<disabledDates.count {
//            print(disabledDates.count)
//
//            if(disabledDates[index]. == date) {
//                return true
//            }
        
//            let dateValue = disabledDates[index] as! Date
//            
//            print("Found \(dateValue.e)")

//        }
        
//        for disabledDate in self.disabledDates {
//        
//            let dateValue = (disabledDate as! NSDate)
//            if (dateValue.isEqual(to: date)) {
//                    return true;
//            }
//        }
        return true;
    }
    
    func calendar(_ calendar : CKCalendarView, didSelect date : Date) {
        dateTextField.text = self.dateFormatter.string(from: date as Date)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            
            deleteTransactionRecordLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            deleteTransactionRecordLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
            deleteTransactionRecordLabel.autoSetDimensions(to: CGSize(width: 400, height: 60))
            
            goToMenuBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            goToMenuBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
            goToMenuBtn.autoSetDimensions(to: CGSize(width: 140, height: 60))
            
            firstTitleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            firstTitleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            firstTitleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 200)
            firstTitleLabel.autoSetDimension(.height, toSize: 30)

            secondTitleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            secondTitleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            secondTitleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 250)
            secondTitleLabel.autoSetDimension(.height, toSize: 30)
            
            dateTextField.autoPinEdge(toSuperviewEdge: .left, withInset: (ScreenSize.SCREEN_WIDTH - 300)/2)
            dateTextField.autoPinEdge(toSuperviewEdge: .top, withInset: 350)
            dateTextField.autoSetDimensions(to: CGSize(width: 300, height: 40))
            
            dateLabel.autoPinEdge(toSuperviewEdge: .left, withInset: (ScreenSize.SCREEN_WIDTH - 300)/2 - 70)
            dateLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 350)
            dateLabel.autoSetDimensions(to: CGSize(width: 50, height: 40))
            
            calendarView.autoPinEdge(toSuperviewEdge: .left, withInset: (ScreenSize.SCREEN_WIDTH - 300)/2 + 320)
            calendarView.autoPinEdge(toSuperviewEdge: .top, withInset: 350)
            calendarView.autoSetDimensions(to: CGSize(width: 300, height: 320))
            
            deleteBtn.autoPinEdge(toSuperviewEdge: .left, withInset: (ScreenSize.SCREEN_WIDTH - 300)/2 + 300 - 110)
            deleteBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 450)
            deleteBtn.autoSetDimensions(to: CGSize(width: 110, height: 30))
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
        deleteTransactionRecordLabel.text = "delete_transaction_record".localized()
        goToMenuBtn.setTitle("go_to_menu".localized(), for: .normal)
        firstTitleLabel.text = "data_which_is_recorded_before_the_inputted_date_will_be_deleted".localized()
        secondTitleLabel.text = "transaction_record_maintenance".localized() + ": 7/7/2016 - 25/08/2016"
        dateLabel.text = "date".localized()
        deleteBtn.setTitle("delete".localized(), for: .normal)
    }
    
    @IBAction func deleteClicked(_ sender: AnyObject) {
        confirmTransactionRecordDeletionDialog = ConfirmTransactionRecordDeletionDialog()
        confirmTransactionRecordDeletionDialog.setAllDataScreenByLocalize()
        confirmTransactionRecordDeletionDialog.setDateValue(dateValue: dateTextField.text!)
        confirmTransactionRecordDeletionDialog.showDialog()
    }

    @IBAction func homeClicked(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToMenu(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
