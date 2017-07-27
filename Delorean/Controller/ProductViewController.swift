//
//  ProductViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/6/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import BFPaperButton
import FontAwesomeKit
import WYPopoverController

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, InteractDialogDelegate, WYPopoverControllerDelegate, NumberIPadDialogDelegate {
    
    private let barView = UIView()
    
    private let backBtn = UIButton()
    private let titleLabel = UILabel()
    private let titleIconImageView = UIImageView()
    
    private let newTransactionBtn = UIButton()
    private let cancelBtn = UIButton()
    private let bodyIconImageView = UIImageView()
    private let bodyTextField = UITextField()
    private let noLabel = UILabel()
    private let noTextField = UITextField()
    private let dateLabel = UILabel()
    
    private let productContainView = UIView()
    private let nextScreenBtn = UIButton()
    private let showFinaLConfirmationScreenBtn = UIButton()
    private let tPointLabel = UILabel()
    private let tPointValueBtn = UIButton()
    private let openDrawerBtn = UIButton()
    private let barcodeManualInputBtn = UIButton()
    private let barcodeManualInputTV = UITextView()
    
    private let totalAmountLabel = UILabel()
    private let yenLabel = UILabel()
    private let totalAmountValueLabel = UILabel()
    private let qTyLabel = UILabel()
    
    private let janCodeLabel = UILabel()
    private let productDetailLabel = UILabel()
    private let priceLabel = UILabel()
    private let discountLabel = UILabel()
    private let quantityLabel = UILabel()
    private let subTotalLabel = UILabel()
    
    private var productTableView = UITableView()
    
    private var firstDialog: FirstDialog!
    private var secondDialog: SecondDialog!
    private var thirdDialog: ThirdDialog!
    private var fourthDialog: FourthDialog!
    private var confirmCancelTransactionDialog: ConfirmCancelTransactionDialog!
    private var messageDialog: MessageDialog!
    private var remarkDialog: RemarkDialog!
    
    private var ProductCellReuseIdentifier = "ProductCellReuseIdentifier"
    private var constraintsNeeded = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(hexString: POS_BACKGROUND_COLOR)
        
        view.addSubview(barView)
        view.addSubview(newTransactionBtn)
        view.addSubview(cancelBtn)
        view.addSubview(bodyIconImageView)
        view.addSubview(bodyTextField)
        view.addSubview(noLabel)
        view.addSubview(noTextField)
        view.addSubview(nextScreenBtn)
        view.addSubview(showFinaLConfirmationScreenBtn)
        view.addSubview(tPointLabel)
        view.addSubview(tPointValueBtn)
        view.addSubview(openDrawerBtn)
        view.addSubview(barcodeManualInputBtn)
        view.addSubview(barcodeManualInputTV)
        view.addSubview(qTyLabel)
        view.addSubview(totalAmountLabel)
        view.addSubview(yenLabel)
        view.addSubview(totalAmountValueLabel)
        view.addSubview(productContainView)
        
        barView.addSubview(backBtn)
        barView.addSubview(titleLabel)
        barView.addSubview(titleIconImageView)
        barView.addSubview(dateLabel)
        
        productContainView.addSubview(productTableView)
        productContainView.addSubview(janCodeLabel)
        productContainView.addSubview(productDetailLabel)
        productContainView.addSubview(priceLabel)
        productContainView.addSubview(discountLabel)
        productContainView.addSubview(quantityLabel)
        productContainView.addSubview(subTotalLabel)
        
        if #available(iOS 9.0, *) {
            productTableView.cellLayoutMarginsFollowReadableWidth = false //full width
        }
        productTableView.tableFooterView = UIView()//remove empty cell
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellReuseIdentifier: ProductCellReuseIdentifier as String)
        
        barView.backgroundColor = UIColor(hexString: MAIN_COLOR)
        showFinaLConfirmationScreenBtn.isHidden = true
        
        let backLeftIcon = FAKIonIcons.chevronLeftIcon(withSize: 40)
        backLeftIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.white)
        let backLeftImg  = backLeftIcon?.image(with: CGSize(width: 40, height: 40))
        
        backBtn.setImage(backLeftImg, for: .normal)
        backBtn.isEnabled = true
        backBtn.addTarget(self, action: #selector(self.homeClicked(_:)), for: .touchUpInside)
        
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        titleLabel.font = UIFont.systemFont(ofSize: 50)
        
        titleIconImageView.image = UIImage(named: "cart")
        titleIconImageView.contentMode = .scaleAspectFit
        
        newTransactionBtn.backgroundColor = UIColor(hexString: TRANSACTION_BUTTON_COLOR)
        newTransactionBtn.setTitleColor(UIColor.white, for: .normal)
        newTransactionBtn.setTitleColor(UIColor.black, for: .highlighted)
        newTransactionBtn.layer.cornerRadius = 6
        newTransactionBtn.titleLabel?.textAlignment = .center
        newTransactionBtn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        
        cancelBtn.backgroundColor = UIColor(hexString: CANCEL_BUTTON_COLOR)
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.setTitleColor(UIColor.black, for: .highlighted)
        cancelBtn.layer.cornerRadius = 6
        cancelBtn.titleLabel?.textAlignment = .center
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        
        bodyIconImageView.image = UIImage(named: "s-figure-body-4-icon-1")
        bodyIconImageView.contentMode = .scaleAspectFit
        
        bodyTextField.borderStyle = UITextBorderStyle.roundedRect
        
        noLabel.textColor = UIColor.black
        noLabel.textAlignment = .center
        noLabel.adjustsFontSizeToFitWidth = true
        
        noTextField.borderStyle = UITextBorderStyle.roundedRect
        
        dateLabel.textColor = UIColor.black
        dateLabel.textAlignment = .right
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        
        productContainView.backgroundColor = UIColor.white
        
        nextScreenBtn.backgroundColor = UIColor(hexString: MAIN_COLOR)
        nextScreenBtn.setTitleColor(UIColor.white, for: .normal)
        nextScreenBtn.setTitleColor(UIColor.black, for: .highlighted)
        nextScreenBtn.titleLabel?.textAlignment = .center
        nextScreenBtn.layer.cornerRadius = 6
        nextScreenBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        showFinaLConfirmationScreenBtn.backgroundColor = UIColor.gray
        showFinaLConfirmationScreenBtn.setTitleColor(UIColor.white, for: .normal)
        showFinaLConfirmationScreenBtn.setTitleColor(UIColor.black, for: .highlighted)
        showFinaLConfirmationScreenBtn.titleLabel?.textAlignment = .center
        showFinaLConfirmationScreenBtn.layer.cornerRadius = 6
        showFinaLConfirmationScreenBtn.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        
        tPointLabel.textColor = UIColor.black
        tPointLabel.textAlignment = .right
        tPointLabel.font = UIFont.systemFont(ofSize: 20)
        
        tPointValueBtn.setTitleColor(UIColor.black, for: .normal)
        tPointValueBtn.titleLabel?.textAlignment = .right
        tPointValueBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        openDrawerBtn.setTitleColor(UIColor.black, for: .normal)
        openDrawerBtn.setTitleColor(UIColor.white, for: .highlighted)
        openDrawerBtn.titleLabel?.textAlignment = .center
        openDrawerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        barcodeManualInputBtn.setTitleColor(UIColor.black, for: .normal)
        barcodeManualInputBtn.setTitleColor(UIColor.white, for: .highlighted)
        barcodeManualInputBtn.titleLabel?.textAlignment = .left
        barcodeManualInputBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        barcodeManualInputBtn.isHidden = true
        
        barcodeManualInputTV.textAlignment = .left
        barcodeManualInputTV.placeholderText = "Barcode input here"
        barcodeManualInputTV.isHidden = false
        
        totalAmountLabel.textColor = UIColor.black
        totalAmountLabel.textAlignment = .right
        totalAmountLabel.font = UIFont.systemFont(ofSize: 30)
        
        yenLabel.textColor = UIColor.black
        yenLabel.textAlignment = .right
        yenLabel.font = UIFont.systemFont(ofSize: 30)
        
        totalAmountValueLabel.textColor = UIColor.black
        totalAmountValueLabel.textAlignment = .center
        totalAmountValueLabel.font = UIFont.systemFont(ofSize: 30)
        
        qTyLabel.textColor = UIColor.black
        qTyLabel.textAlignment = .right
        qTyLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        janCodeLabel.textColor = UIColor.black
        janCodeLabel.textAlignment = .center
        janCodeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        productDetailLabel.textColor = UIColor.black
        productDetailLabel.textAlignment = .center
        productDetailLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        priceLabel.textColor = UIColor.black
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        discountLabel.textColor = UIColor.black
        discountLabel.textAlignment = .center
        discountLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        quantityLabel.textColor = UIColor.black
        quantityLabel.textAlignment = .center
        quantityLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        subTotalLabel.textColor = UIColor.black
        subTotalLabel.textAlignment = .center
        subTotalLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        setAllDataScreenByLocalize()
        self.view.setNeedsUpdateConstraints()
        
        nextScreenBtn.addTarget(self, action: #selector(nextScreenClicked), for: .touchUpInside)
        showFinaLConfirmationScreenBtn.addTarget(self, action: #selector(showFinalConfirmationScreen), for: .touchUpInside)
        newTransactionBtn.addTarget(self, action: #selector(newTransaction), for: .touchUpInside)
        barcodeManualInputBtn.addTarget(self, action: #selector(barcode), for: .touchUpInside)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        barcodeManualInputTV.becomeFirstResponder()
        barcodeManualInputTV.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.range(of: "\n") != nil{
            var result = textView.text.components(separatedBy: "\n")
            if result.count <= 0 {
                return
            }
            print(result[0])
            PosManager.getInstance().scanProduct(janCodeScaned: result[0])
            productTableView.reloadData()
            if PosManager.getInstance().posOrderItems.count > 0 {
                productTableView.scrollToRow(at: NSIndexPath(row: PosManager.getInstance().posOrderItems.count - 1, section: 0) as IndexPath, at: UITableViewScrollPosition.bottom, animated: true)
            }
            updateTotalAmountQuantityofAllProduct()
            textView.text = ""
        }
    }
    
    func tap(gesture: UITapGestureRecognizer) {
        barcodeManualInputTV.resignFirstResponder()
    }
    
    private var isShowedRemark = false
    @objc func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            
            remarkDialog = RemarkDialog()
            remarkDialog.setAllDataScreenByLocalize()
            self.remarkDialog.customIOSAlertView?.frame = CGRect(x: ScreenSize.SCREEN_WIDTH, y: 0 , width: (self.remarkDialog.customIOSAlertView?.frame.size.width)!, height: (self.remarkDialog.customIOSAlertView?.frame.size.height)!)
            remarkDialog.showDialog()
        }
        
        if (sender.direction == .right) {
            remarkDialog = RemarkDialog()
            remarkDialog.setAllDataScreenByLocalize()
            self.remarkDialog.customIOSAlertView?.frame = CGRect(x: ScreenSize.SCREEN_WIDTH, y: 0 , width: (self.remarkDialog.customIOSAlertView?.frame.size.width)!, height: (self.remarkDialog.customIOSAlertView?.frame.size.height)!)
            remarkDialog.showDialog()
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            
            barView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            barView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            barView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            barView.autoSetDimension(.height, toSize: 100)
            
            backBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            backBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            backBtn.autoSetDimensions(to: CGSize(width: 60, height: 80))
            
            titleLabel.autoCenterInSuperview()
            
            titleIconImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
            titleIconImageView.autoSetDimensions(to: CGSize(width: 60, height: 60))
            titleIconImageView.autoPinEdge(.right, to: .left, of: titleLabel, withOffset: -20)
            
            newTransactionBtn.autoPinEdge(.top, to: .bottom, of: barView, withOffset: 10)
            newTransactionBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            newTransactionBtn.autoSetDimensions(to: CGSize(width: 105, height: 45))
            
            cancelBtn.autoPinEdge(.top, to: .bottom, of: barView, withOffset: 10)
            cancelBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
            cancelBtn.autoSetDimensions(to: CGSize(width: 105, height: 45))
            
            bodyIconImageView.autoPinEdge(.top, to: .bottom, of: barView, withOffset: 10)
            bodyIconImageView.autoPinEdge(.left, to: .right, of: newTransactionBtn, withOffset: 50)
            bodyIconImageView.autoSetDimensions(to: CGSize(width: 45, height: 45))
            
            bodyTextField.autoPinEdge(.top, to: .bottom, of: barView, withOffset: 17)
            bodyTextField.autoPinEdge(.left, to: .right, of: bodyIconImageView, withOffset: 0)
            bodyTextField.autoSetDimensions(to: CGSize(width: 112, height: 30))
            
            noLabel.autoPinEdge(.top, to: .bottom, of: barView, withOffset: 10)
            noLabel.autoPinEdge(.left, to: .right, of: bodyTextField, withOffset: 50)
            noLabel.autoSetDimensions(to: CGSize(width: 45, height: 45))
            
            noTextField.autoPinEdge(.top, to: .bottom, of: barView, withOffset: 17)
            noTextField.autoPinEdge(.left, to: .right, of: noLabel, withOffset: 2)
            noTextField.autoSetDimensions(to: CGSize(width: 112, height: 30))
            
            dateLabel.autoPinEdge(.top, to: .bottom, of: cancelBtn, withOffset: 0)
            dateLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 25)
            dateLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            dateLabel.autoSetDimension(.height, toSize: 40)
            
            productContainView.autoPinEdge(.top, to: .bottom, of: dateLabel, withOffset: 5)
            productContainView.autoPinEdge(toSuperviewEdge: .right, withInset: 40)
            productContainView.autoPinEdge(toSuperviewEdge: .left, withInset: 40)
            productContainView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 120)
            
            nextScreenBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 5)
            nextScreenBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30)
            nextScreenBtn.autoSetDimensions(to: CGSize(width: 180, height: 60))
            
            showFinaLConfirmationScreenBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            showFinaLConfirmationScreenBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
            showFinaLConfirmationScreenBtn.autoSetDimensions(to: CGSize(width: 180, height: 80))
            
            tPointValueBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 25)
            tPointValueBtn.autoSetDimensions(to: CGSize(width: 180, height: 30))
            tPointValueBtn.autoPinEdge(.right, to: .left, of: nextScreenBtn, withOffset: -70)
            
            tPointLabel.autoPinEdge(.right, to: .left, of: tPointValueBtn, withOffset: 0)
            tPointLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 25)
            tPointLabel.autoSetDimensions(to: CGSize(width: 180, height: 30))
            
            openDrawerBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
            openDrawerBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
            openDrawerBtn.autoSetDimensions(to: CGSize(width: 200, height: 60))
            
            barcodeManualInputBtn.autoPinEdge(toSuperviewEdge: .left, withInset: 50)
            barcodeManualInputBtn.autoPinEdge(.top, to: .bottom, of: productContainView, withOffset: 10)
            barcodeManualInputBtn.autoSetDimensions(to: CGSize(width: 150, height: 30))
            
            barcodeManualInputTV.autoPinEdge(toSuperviewEdge: .left, withInset: 50)
            barcodeManualInputTV.autoPinEdge(.top, to: .bottom, of: productContainView, withOffset: 10)
            barcodeManualInputTV.autoSetDimensions(to: CGSize(width: 150, height: 30))
            
            qTyLabel.autoPinEdge(.bottom, to: .top, of: tPointValueBtn, withOffset: 0)
            qTyLabel.autoPinEdge(.right, to: .left, of: nextScreenBtn, withOffset: -40)
            qTyLabel.autoSetDimensions(to: CGSize(width: 100, height: 60))
            
            totalAmountValueLabel.autoPinEdge(.bottom, to: .top, of: tPointValueBtn, withOffset: 0)
            totalAmountValueLabel.autoPinEdge(.right, to: .left, of: qTyLabel, withOffset: 0)
            totalAmountValueLabel.autoSetDimensions(to: CGSize(width: 200, height: 60))
            
            yenLabel.autoPinEdge(.bottom, to: .top, of: tPointValueBtn, withOffset: 0)
            yenLabel.autoPinEdge(.right, to: .left, of: totalAmountValueLabel, withOffset: 0)
            yenLabel.autoSetDimensions(to: CGSize(width: 55, height: 60))
            
            totalAmountLabel.autoPinEdge(.bottom, to: .top, of: tPointValueBtn, withOffset: 0)
            totalAmountLabel.autoPinEdge(.right, to: .left, of: yenLabel, withOffset: 0)
            totalAmountLabel.autoSetDimensions(to: CGSize(width: 150, height: 60))
            
            productTableView.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
            productTableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            productTableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            productTableView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
            
            janCodeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            janCodeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 18)
            janCodeLabel.autoSetDimensions(to: CGSize(width: 140, height: 50))
            
            productDetailLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            productDetailLabel.autoPinEdge(.right, to: .left, of: priceLabel)
            productDetailLabel.autoPinEdge(.left, to: .right, of: janCodeLabel)
            productDetailLabel.autoSetDimension(.height, toSize: 50)
            
            priceLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            priceLabel.autoPinEdge(.right, to: .left, of: discountLabel, withOffset: -40)
            priceLabel.autoSetDimensions(to: CGSize(width: 84, height: 50))
            
            discountLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            discountLabel.autoPinEdge(.right, to: .left, of: quantityLabel, withOffset: -24)
            discountLabel.autoSetDimensions(to: CGSize(width: 86, height: 50))
            
            quantityLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            quantityLabel.autoPinEdge(.right, to: .left, of: subTotalLabel, withOffset: -47)
            quantityLabel.autoSetDimensions(to: CGSize(width: 45, height: 50))
            
            subTotalLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            subTotalLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
            subTotalLabel.autoSetDimensions(to: CGSize(width: 100, height: 50))
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
        titleLabel.text = "title_pos".localized()
        newTransactionBtn.setTitle("new_transaction".localized(), for: .normal)
        cancelBtn.setTitle("cancel".localized(), for: .normal)
        noLabel.text = "number".localized()
        dateLabel.text = "設置店舗：大阪  レジ端末番号：1 2016/10/23"
        nextScreenBtn.setTitle("next_screen".localized(), for: .normal)
        showFinaLConfirmationScreenBtn.setTitle("show_final_confirmation_screen".localized(), for: .normal)
        tPointLabel.text = "t_point".localized()
        tPointValueBtn.setTitle("yen".localized() + Utils.numberToComma(number: PosManager.getInstance().posOrder.tPointAmount), for: .normal)
        
        let openDrawer = [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        let  openDrawerString = NSAttributedString(string: "open_drawer".localized(), attributes: openDrawer)
        openDrawerBtn.setAttributedTitle(openDrawerString, for: .normal)
        
        barcodeManualInputBtn.setTitle("barcode_manual".localized(), for: .normal)
        //        barcodeManualInputTV.text = "barcode_manual".localized()
        totalAmountLabel.text = "total_amount".localized()
        yenLabel.text = "yen".localized()
        
        updateTotalAmountQuantityofAllProduct()
        
        janCodeLabel.text = "jan".localized()
        productDetailLabel.text = "product".localized()
        priceLabel.text = "price".localized()
        discountLabel.text = "discount".localized()
        quantityLabel.text = "quantity".localized()
        subTotalLabel.text = "sub_total".localized()
    }
    
    private func updateTotalAmountQuantityofAllProduct() {
        PosManager.getInstance().calculateTotalAmount()
        PosManager.getInstance().calculateTotalQuantity()
        
        qTyLabel.text = "(" + String(PosManager.getInstance().posOrder.totalQuantity) + " " + "qty".localized() + ")"
        totalAmountValueLabel.text = Utils.numberToComma(number: PosManager.getInstance().posOrder.totalAmount)
    }
    
    func homeClicked(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func nextScreenClicked() {
        if PosManager.getInstance().posOrderItems.count <= 0 {
            messageDialog = MessageDialog()
            messageDialog.setAllDataScreenByLocalize()
            messageDialog.setMessage(message: "Empty! Please add product more.")
            messageDialog.showDialog()
            return
        }
        firstDialog = FirstDialog()
        firstDialog.setAllDataScreenByLocalize()
        firstDialog.dialogDelegate = self;
        firstDialog.showDialog()
    }
    
    func showFinalConfirmationScreen() {
        fourthDialog = FourthDialog()
        fourthDialog.dialogDelegate = self;
        fourthDialog.setAllDataScreenByLocalize()
        fourthDialog.showDialog()
    }
    
    func newTransaction() {
        if(!showFinaLConfirmationScreenBtn.isHidden) {
            backToTransactionScreen()
            
            PosManager.getInstance().clearPos()
            //            PosManager.getInstance().getAllPreviousPosOrderItemList()
            updateTotalAmountQuantityofAllProduct()
            productTableView.reloadData()
        }
        else {
            confirmCancelTransactionDialog = ConfirmCancelTransactionDialog()
            confirmCancelTransactionDialog.setAllDataScreenByLocalize()
            confirmCancelTransactionDialog.delegate = self
            confirmCancelTransactionDialog.showDialog()
        }
    }
    
    func clearAllCurrentProductList() {
        PosManager.getInstance().clearPos()
        updateTotalAmountQuantityofAllProduct()
        productTableView.reloadData()
    }
    
    func barcode() {
        PosManager.getInstance().createPosOrderItem()
        productTableView.reloadData()
        productTableView.scrollToRow(at: NSIndexPath(row: PosManager.getInstance().posOrderItems.count - 1, section: 0) as IndexPath, at: UITableViewScrollPosition.bottom, animated: true)
        updateTotalAmountQuantityofAllProduct()
    }
    
    func nextFirstDialogClick(useTPoint: Int) {
        secondDialog = SecondDialog()
        secondDialog.dialogDelegate = self
        secondDialog.useTPoint = useTPoint
        secondDialog.setAllDataScreenByLocalize()
        secondDialog.showDialog()
    }
    
    func backFirstDialogClick() {
        firstDialog.hideDialog()
    }
    
    func nextSecondDialogClick() {
        //save product list to database after printing reciept
        //        PosManager.getInstance().saveToDatabase()
        
        thirdDialog = ThirdDialog()
        thirdDialog.dialogDelegate = self
        thirdDialog.setAllDataScreenByLocalize()
        thirdDialog.showDialog()
    }
    
    func backSecondDialogClick() {
        firstDialog.showDialog()
    }
    
    func nextThirdDialogClick() {
        showFinaLConfirmationScreenBtn.isHidden = false
        nextScreenBtn.isHidden = true
        barView.backgroundColor = UIColor.gray
        titleLabel.text = "show_final_confirmation_screen".localized()
        titleIconImageView.isHidden = true
        backBtn.isHidden = true
        cancelBtn.isHidden = true
        noTextField.isEnabled = false
        bodyTextField.isEnabled = false
        barcodeManualInputBtn.isEnabled = false
        barcodeManualInputTV.isEditable = false
        productTableView.isUserInteractionEnabled = false
        self.present(ReceiptViewController(), animated: false, completion: nil)
    }
    
    func backThirdDialogClick() {
        secondDialog.showDialog()
    }
    
    func nextFourthDialogClick() {
        fourthDialog.hideDialog()
        backToTransactionScreen()
    }
    
    func backToTransactionScreen() {
        showFinaLConfirmationScreenBtn.isHidden = true
        nextScreenBtn.isHidden = false
        barView.backgroundColor = UIColor(hexString: MAIN_COLOR)
        titleLabel.text = "title_pos".localized()
        titleIconImageView.isHidden = false
        backBtn.isHidden = false
        cancelBtn.isHidden = false
        noTextField.isEnabled = true
        bodyTextField.isEnabled = true
        barcodeManualInputBtn.isEnabled = true
        barcodeManualInputTV.isEditable = true
        productTableView.isUserInteractionEnabled = true
    }
    
    func backFourthDialogClick() {
        
    }
    
    //MARK - Product TableView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PosManager.getInstance().posOrderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductViewCell! = tableView.dequeueReusableCell(withIdentifier: ProductCellReuseIdentifier as String) as? ProductViewCell
        
        let posOrderItem = PosManager.getInstance().posOrderItems[indexPath.row]
        
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        
        cell.janCodeTextField.text = posOrderItem.product.janCode
        cell.productNameTextField.text = posOrderItem.product.name
        cell.priceTextField.text = Utils.numberToComma(number: posOrderItem.product.price) + "円"
        cell.priceValue = posOrderItem.product.price
        cell.discountTextField.text = Utils.numberToComma(number: posOrderItem.productDiscount) + "円"
        cell.discountValue = posOrderItem.productDiscount
        cell.quantityTextField.text = String(posOrderItem.productQuantity)
        
        PosManager.getInstance().calculateSubTotal(posOrderItem: posOrderItem)
        cell.totalLabel.text = Utils.numberToComma(number: posOrderItem.subTotalWithoutTax) + "円"
        cell.warrantyLabel.text = String(posOrderItem.product.warranty) + "年間"
        cell.tcardLabel.text = String(posOrderItem.product.tcard) + "%"
        
        cell.janCodeTextField.tag = indexPath.row
        cell.productNameTextField.tag = indexPath.row
        cell.quantityTextField.tag = indexPath.row
        cell.discountTextField.tag = indexPath.row
        cell.priceTextField.tag = indexPath.row
        
        cell.productNameTextField.addTarget(self, action: #selector(productNameChanged), for: .editingChanged)
        cell.janCodeTextField.addTarget(self, action: #selector(janCodeChanged), for: .editingDidBegin)
        cell.priceTextField.addTarget(self, action: #selector(priceChanged), for: .editingDidBegin)
        cell.discountTextField.addTarget(self, action: #selector(discountChanged), for: .editingDidBegin)
        cell.quantityTextField.addTarget(self, action: #selector(quantityChanged), for: .editingDidBegin)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: ProductViewCell! = tableView.dequeueReusableCell(withIdentifier: ProductCellReuseIdentifier as String) as? ProductViewCell
        cell.discountTextField.isEnabled = false
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if showFinaLConfirmationScreenBtn.isHidden {
            return true
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        PosManager.getInstance().posOrderItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [NSIndexPath(row: indexPath.row, section: 0) as IndexPath], with: UITableViewRowAnimation.fade)
        
        updateTotalAmountQuantityofAllProduct()
    }
    
    var popoverController: WYPopoverController!
    var inputTextFieldType = 1
    var currentTextFiled: UITextField!

    func janCodeChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        currentTextFiled = textField
        
        let janCodeNumberIPadKeyView = JanCodeNumberIPadKeyView(nibName: "JanCodeNumberIPadKeyView", bundle: nil)
        janCodeNumberIPadKeyView.delegate = self
        inputTextFieldType = 1
        
        popoverController = WYPopoverController(contentViewController: janCodeNumberIPadKeyView)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 379);
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .any, animated: true)
    }
    
    func priceChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        currentTextFiled = textField
        
        let numberIPadViewController = NumberIPadViewController(nibName: "NumberIPadViewController", bundle: nil)
        numberIPadViewController.keyBoardType = 2
        numberIPadViewController.delegate = self
        inputTextFieldType = 2

        popoverController = WYPopoverController(contentViewController: numberIPadViewController)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 493)
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .right, animated: true)
    }
    
    func discountChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        currentTextFiled = textField
        
        let numberIPadViewController = NumberIPadViewController(nibName: "NumberIPadViewController", bundle: nil)
        numberIPadViewController.keyBoardType = 3
        numberIPadViewController.delegate = self
        inputTextFieldType = 3

        popoverController = WYPopoverController(contentViewController: numberIPadViewController)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 493)
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .any, animated: true)
    }
    
    func quantityChanged(_ textField: UITextField) {
        textField.resignFirstResponder()
        currentTextFiled = textField
        
        let numberIPadViewController = NumberIPadViewController(nibName: "NumberIPadViewController", bundle: nil)
        numberIPadViewController.keyBoardType = 4
        numberIPadViewController.delegate = self
        inputTextFieldType = 4

        popoverController = WYPopoverController(contentViewController: numberIPadViewController)
        popoverController?.delegate = self
        popoverController?.popoverContentSize = CGSize(width: 296, height: 493)
        popoverController?.presentPopover(from: textField.bounds, in: textField, permittedArrowDirections: .any, animated: true)
    }
    
    func popoverControllerShouldDismissPopover(_ popoverController: WYPopoverController!) -> Bool {
        return true
    }
    
    func confirmFunction(value: String) {
        popoverController.dismissPopover(animated: true)
        
        let cell = productTableView.cellForRow(at: NSIndexPath(row: currentTextFiled.tag, section: 0) as IndexPath) as! ProductViewCell
        let posOrderItem = PosManager.getInstance().posOrderItems[currentTextFiled.tag]
        
        currentTextFiled.resignFirstResponder()
        currentTextFiled.text = value
        
        if inputTextFieldType  == 1 {
            posOrderItem.product.janCode = value
        }
        else if inputTextFieldType  == 2 {
            posOrderItem.product.price = Int(value)
        }
        else if inputTextFieldType  == 3 {
            posOrderItem.productDiscount = Int(value)
        }
        else if inputTextFieldType  == 4 {
            posOrderItem.productQuantity = Int(value)
        }

        changeValueProductCellItem(cell: cell, posOrderItem: posOrderItem)
    }
    
    func productNameChanged(_ textField: UITextField) {
        let posOrderItem = PosManager.getInstance().posOrderItems[textField.tag]
        posOrderItem.product.name = textField.text
    }
    
    private func changeValueProductCellItem(cell: ProductViewCell, posOrderItem: PosOrderItem) {
        PosManager.getInstance().calculateSubTotal(posOrderItem: posOrderItem)
        updateTotalAmountQuantityofAllProduct()
        cell.totalLabel.text = Utils.numberToComma(number: posOrderItem.subTotalWithoutTax) + "円"
    }
    
    func keyboardWillShow() {
        
    }
    
    func keyboardWillHide() {
        
    }
    
}
