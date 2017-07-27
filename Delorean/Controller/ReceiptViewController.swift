//
//  ReceiptViewController.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/27/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import FontAwesomeKit

class ReceiptViewController: UIViewController {
    var constraintsNeeded = true
    
    let scrollView = UIScrollView()
    let centerAbstractView = UIView()
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    let storeNameLabel = UILabel()
    let storeAddressLabel = UILabel()
    let telephoneNumberLabel = UILabel()
    let earPhoneLabel = UILabel()
    
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let buyingNumberLabel = UILabel()
    let cashierOperatorLabel = UILabel()
    let receiptLabel = UILabel()
    
    let productNameLabel = UILabel()
    let unitPriceLabel = UILabel()
    let qtyLabel = UILabel()
    
    var janCodeLabel: UILabel!
    var unitPriceValueLabel = UILabel()
    var qtyValueLabel = UILabel()
    var categoryLabel: UILabel!
    var productNameValueLabel: UILabel!
    var subTotalLabel = UILabel()
    
    let totalAmountLabel = UILabel()
    let usePointLabel = UILabel()
    let totalAmountValueLabel = UILabel()
    let usePointValueLabel = UILabel()
    let paymentLabel = UILabel()
    let paymentValueLabel = UILabel()
    let receivedMoneyLabel = UILabel()
    let receivedMoneyValueLabel = UILabel()
    let detailLabel = UILabel()
    let cashLabel = UILabel()
    let cashValueLabel = UILabel()
    let cardLabel = UILabel()
    let cardValueLabel = UILabel()
    let changeLabel = UILabel()
    let changeValueLabel = UILabel()
    
    let dashLine1 = UILabel()
    let dashLine2 = UILabel()
    
    let closeBtn = UIButton()
    let printBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        
        scrollView.addSubview(closeBtn)
        
        let closeIcon = FAKIonIcons.closeIcon(withSize: 40)
        closeIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.black)
        let closeImg  = closeIcon?.image(with: CGSize(width: 40, height: 40))
        
        closeBtn.setImage(closeImg, for: .normal)
        closeBtn.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
        
        scrollView.addSubview(centerAbstractView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(iconImageView)
        scrollView.addSubview(storeNameLabel)
        scrollView.addSubview(storeAddressLabel)
        scrollView.addSubview(telephoneNumberLabel)
        scrollView.addSubview(earPhoneLabel)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(buyingNumberLabel)
        scrollView.addSubview(cashierOperatorLabel)
        scrollView.addSubview(receiptLabel)
        scrollView.addSubview(productNameLabel)
        scrollView.addSubview(unitPriceLabel)
        scrollView.addSubview(qtyLabel)
        
        scrollView.addSubview(dashLine1)
        scrollView.addSubview(dashLine2)
        scrollView.addSubview(totalAmountLabel)
        scrollView.addSubview(totalAmountValueLabel)
        scrollView.addSubview(usePointLabel)
        scrollView.addSubview(usePointValueLabel)
        scrollView.addSubview(paymentLabel)
        scrollView.addSubview(paymentValueLabel)
        scrollView.addSubview(receivedMoneyLabel)
        scrollView.addSubview(receivedMoneyValueLabel)
        scrollView.addSubview(detailLabel)
        scrollView.addSubview(cashLabel)
        scrollView.addSubview(cashValueLabel)
        scrollView.addSubview(cardLabel)
        scrollView.addSubview(cardValueLabel)
        scrollView.addSubview(changeLabel)
        scrollView.addSubview(changeValueLabel)
        
        view.backgroundColor = UIColor.white
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        
        centerAbstractView.backgroundColor = UIColor.red
        centerAbstractView.isHidden = true
        
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        
        iconImageView.image = UIImage(named: "logo")
        iconImageView.contentMode = .scaleAspectFit
        
        storeNameLabel.textColor = UIColor.black
        storeNameLabel.textAlignment = .center
        storeNameLabel.numberOfLines = 1
        storeNameLabel.adjustsFontSizeToFitWidth = true
        storeNameLabel.font = UIFont.systemFont(ofSize: 20)
        
        storeAddressLabel.textColor = UIColor.black
        storeAddressLabel.textAlignment = .center
        storeAddressLabel.numberOfLines = 1
        storeAddressLabel.adjustsFontSizeToFitWidth = true
        storeAddressLabel.font = UIFont.systemFont(ofSize: 20)
        
        earPhoneLabel.textColor = UIColor.blue
        earPhoneLabel.textAlignment = .center
        earPhoneLabel.numberOfLines = 1
        earPhoneLabel.adjustsFontSizeToFitWidth = true
        earPhoneLabel.font = UIFont.systemFont(ofSize: 20)
        
        dateLabel.textColor = UIColor.black
        dateLabel.textAlignment = .left
        dateLabel.numberOfLines = 1
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.font = UIFont.systemFont(ofSize: 20)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateLabel.text = dateFormatter.string(from: NSDate() as Date)
        
        timeLabel.textColor = UIColor.black
        timeLabel.textAlignment = .center
        timeLabel.numberOfLines = 1
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.font = UIFont.systemFont(ofSize: 20)
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        timeLabel.text = dateFormatter.string(from: NSDate() as Date)
        
        buyingNumberLabel.textColor = UIColor.black
        buyingNumberLabel.textAlignment = .right
        buyingNumberLabel.numberOfLines = 1
        buyingNumberLabel.adjustsFontSizeToFitWidth = true
        buyingNumberLabel.font = UIFont.systemFont(ofSize: 20)
        
        cashierOperatorLabel.textColor = UIColor.black
        cashierOperatorLabel.textAlignment = .right
        cashierOperatorLabel.numberOfLines = 1
        cashierOperatorLabel.adjustsFontSizeToFitWidth = true
        cashierOperatorLabel.font = UIFont.systemFont(ofSize: 20)
        
        receiptLabel.textColor = UIColor.black
        receiptLabel.textAlignment = .center
        receiptLabel.numberOfLines = 1
        receiptLabel.adjustsFontSizeToFitWidth = true
        receiptLabel.font = UIFont.boldSystemFont(ofSize: 60)
        
        productNameLabel.textColor = UIColor.black
        productNameLabel.textAlignment = .left
        productNameLabel.numberOfLines = 1
        productNameLabel.adjustsFontSizeToFitWidth = true
        productNameLabel.font = UIFont.systemFont(ofSize: 20)
        
        unitPriceLabel.textColor = UIColor.black
        unitPriceLabel.textAlignment = .right
        unitPriceLabel.numberOfLines = 1
        unitPriceLabel.adjustsFontSizeToFitWidth = true
        unitPriceLabel.font = UIFont.systemFont(ofSize: 20)
        
        qtyLabel.textColor = UIColor.black
        qtyLabel.textAlignment = .right
        qtyLabel.numberOfLines = 1
        qtyLabel.adjustsFontSizeToFitWidth = true
        qtyLabel.font = UIFont.systemFont(ofSize: 20)
        
        dashLine1.textColor = UIColor.black
        dashLine1.textAlignment = .center
        dashLine1.numberOfLines = 1
        dashLine1.adjustsFontSizeToFitWidth = true
        dashLine1.font = UIFont.systemFont(ofSize: 20)
        
        dashLine2.textColor = UIColor.black
        dashLine2.textAlignment = .center
        dashLine2.numberOfLines = 1
        dashLine2.adjustsFontSizeToFitWidth = true
        dashLine2.font = UIFont.systemFont(ofSize: 20)
        
        totalAmountLabel.textColor = UIColor.black
        totalAmountLabel.textAlignment = .left
        totalAmountLabel.numberOfLines = 1
        totalAmountLabel.adjustsFontSizeToFitWidth = true
        totalAmountLabel.font = UIFont.systemFont(ofSize: 25)
        
        totalAmountValueLabel.textColor = UIColor.black
        totalAmountValueLabel.textAlignment = .right
        totalAmountValueLabel.numberOfLines = 1
        totalAmountValueLabel.adjustsFontSizeToFitWidth = true
        totalAmountValueLabel.font = UIFont.systemFont(ofSize: 25)
        
        usePointLabel.textColor = UIColor.black
        usePointLabel.textAlignment = .left
        usePointLabel.numberOfLines = 1
        usePointLabel.adjustsFontSizeToFitWidth = true
        usePointLabel.font = UIFont.systemFont(ofSize: 25)
        
        usePointValueLabel.textColor = UIColor.black
        usePointValueLabel.textAlignment = .right
        usePointValueLabel.numberOfLines = 1
        usePointValueLabel.adjustsFontSizeToFitWidth = true
        usePointValueLabel.font = UIFont.systemFont(ofSize: 25)
        
        paymentLabel.textColor = UIColor.black
        paymentLabel.textAlignment = .left
        paymentLabel.numberOfLines = 1
        paymentLabel.adjustsFontSizeToFitWidth = true
        paymentLabel.font = UIFont.systemFont(ofSize: 25)
        
        paymentValueLabel.textColor = UIColor.black
        paymentValueLabel.textAlignment = .right
        paymentValueLabel.numberOfLines = 1
        paymentValueLabel.adjustsFontSizeToFitWidth = true
        paymentValueLabel.font = UIFont.systemFont(ofSize: 25)
        
        receivedMoneyLabel.textColor = UIColor.black
        receivedMoneyLabel.textAlignment = .left
        receivedMoneyLabel.numberOfLines = 1
        receivedMoneyLabel.adjustsFontSizeToFitWidth = true
        receivedMoneyLabel.font = UIFont.systemFont(ofSize: 25)
        
        receivedMoneyValueLabel.textColor = UIColor.black
        receivedMoneyValueLabel.textAlignment = .right
        receivedMoneyValueLabel.numberOfLines = 1
        receivedMoneyValueLabel.adjustsFontSizeToFitWidth = true
        receivedMoneyValueLabel.font = UIFont.systemFont(ofSize: 25)
        
        detailLabel.textColor = UIColor.black
        detailLabel.textAlignment = .left
        detailLabel.numberOfLines = 1
        detailLabel.adjustsFontSizeToFitWidth = true
        detailLabel.font = UIFont.systemFont(ofSize: 23)
        
        cashLabel.textColor = UIColor.black
        cashLabel.textAlignment = .left
        cashLabel.numberOfLines = 1
        cashLabel.adjustsFontSizeToFitWidth = true
        cashLabel.font = UIFont.systemFont(ofSize: 23)
        
        cashValueLabel.textColor = UIColor.black
        cashValueLabel.textAlignment = .right
        cashValueLabel.numberOfLines = 1
        cashValueLabel.adjustsFontSizeToFitWidth = true
        cashValueLabel.font = UIFont.systemFont(ofSize: 23)
        
        cardLabel.textColor = UIColor.black
        cardLabel.textAlignment = .left
        cardLabel.numberOfLines = 1
        cardLabel.adjustsFontSizeToFitWidth = true
        cardLabel.font = UIFont.systemFont(ofSize: 23)
        
        changeLabel.textColor = UIColor.black
        changeLabel.textAlignment = .left
        changeLabel.numberOfLines = 1
        changeLabel.adjustsFontSizeToFitWidth = true
        changeLabel.font = UIFont.systemFont(ofSize: 25)
        
        changeValueLabel.textColor = UIColor.black
        changeValueLabel.textAlignment = .right
        changeValueLabel.numberOfLines = 1
        changeValueLabel.adjustsFontSizeToFitWidth = true
        changeValueLabel.font = UIFont.systemFont(ofSize: 25)
        
        setAllDataScreenByLocalize()
        view.setNeedsUpdateConstraints()
    }
    
    var height = 0
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if constraintsNeeded {
            constraintsNeeded = false
            
            scrollView.autoPinEdgesToSuperviewEdges()
            
            closeBtn.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            closeBtn.autoSetDimensions(to: CGSize(width: 55, height: 55))
            closeBtn.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 250)

            centerAbstractView.autoSetDimension(.width, toSize: 2)
            centerAbstractView.autoAlignAxis(toSuperviewAxis: .vertical)
            centerAbstractView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            centerAbstractView.autoSetDimension(.height, toSize: 2000)
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
            titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            titleLabel.autoSetDimension(.height, toSize: 30)
            
            iconImageView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
            iconImageView.autoAlignAxis(toSuperviewAxis: .vertical)
            iconImageView.autoSetDimension(.height, toSize: 80)
            
            storeNameLabel.autoPinEdge(.top, to: .bottom, of: iconImageView, withOffset: 20)
            storeNameLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            storeNameLabel.autoSetDimension(.height, toSize: 30)
            
            storeAddressLabel.autoPinEdge(.top, to: .bottom, of: storeNameLabel, withOffset: 20)
            storeAddressLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            storeAddressLabel.autoSetDimension(.height, toSize: 30)
            
            earPhoneLabel.autoPinEdge(.top, to: .bottom, of: storeAddressLabel, withOffset: 15)
            earPhoneLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            earPhoneLabel.autoSetDimension(.height, toSize: 30)
            
            timeLabel.autoPinEdge(.top, to: .bottom, of: earPhoneLabel, withOffset: 25)
            timeLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            timeLabel.autoSetDimension(.height, toSize: 30)
            
            dateLabel.autoPinEdge(.top, to: .bottom, of: earPhoneLabel, withOffset: 25)
            dateLabel.autoPinEdge(.right, to: .left, of: timeLabel, withOffset: -70)
            dateLabel.autoSetDimension(.height, toSize: 30)
            
            buyingNumberLabel.autoPinEdge(.top, to: .bottom, of: earPhoneLabel, withOffset: 25)
            buyingNumberLabel.autoPinEdge(.left, to: .right, of: timeLabel, withOffset: 70)
            buyingNumberLabel.autoSetDimension(.height, toSize: 30)
            
            cashierOperatorLabel.autoPinEdge(.top, to: .bottom, of: buyingNumberLabel, withOffset: 20)
            cashierOperatorLabel.autoPinEdge(.left, to: .right, of: timeLabel, withOffset: 70)
            cashierOperatorLabel.autoSetDimension(.height, toSize: 30)
            //400
            receiptLabel.autoPinEdge(.top, to: .bottom, of: timeLabel, withOffset: 70)
            receiptLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            receiptLabel.autoSetDimension(.height, toSize: 60)
            
            productNameLabel.autoPinEdge(.top, to: .bottom, of: receiptLabel, withOffset: 25)
            productNameLabel.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 0)
            productNameLabel.autoSetDimensions(to: CGSize(width: 250, height: 30))
            //185
            unitPriceLabel.autoPinEdge(.top, to: .bottom, of: receiptLabel, withOffset: 25)
            unitPriceLabel.autoPinEdge(.left, to: .right, of: centerAbstractView, withOffset: 0)
            unitPriceLabel.autoSetDimensions(to: CGSize(width: 150, height: 30))
            
            qtyLabel.autoPinEdge(.top, to: .bottom, of: receiptLabel, withOffset: 25)
            qtyLabel.autoPinEdge(.left, to: .right, of: unitPriceLabel, withOffset: 0)
            qtyLabel.autoSetDimensions(to: CGSize(width: 100, height: 30))
            
            var count = 0
            for posOrderItem in PosManager.getInstance().posOrderItems {
                
                janCodeLabel = UILabel()
                janCodeLabel.textColor = UIColor.black
                janCodeLabel.textAlignment = .left
                janCodeLabel.numberOfLines = 1
                janCodeLabel.adjustsFontSizeToFitWidth = true
                janCodeLabel.font = UIFont.systemFont(ofSize: 20)
                
                categoryLabel = UILabel()
                categoryLabel.textColor = UIColor.black
                categoryLabel.textAlignment = .left
                categoryLabel.numberOfLines = 1
                categoryLabel.adjustsFontSizeToFitWidth = true
                categoryLabel.font = UIFont.systemFont(ofSize: 20)
                
                productNameValueLabel = UILabel()
                productNameValueLabel.textColor = UIColor.black
                productNameValueLabel.textAlignment = .left
                productNameValueLabel.numberOfLines = 2
                productNameValueLabel.adjustsFontSizeToFitWidth = true
                productNameValueLabel.font = UIFont.systemFont(ofSize: 20)
                
                unitPriceValueLabel = UILabel()
                unitPriceValueLabel.textColor = UIColor.black
                unitPriceValueLabel.textAlignment = .right
                unitPriceValueLabel.numberOfLines = 1
                unitPriceValueLabel.adjustsFontSizeToFitWidth = true
                unitPriceValueLabel.font = UIFont.systemFont(ofSize: 20)
                
                qtyValueLabel = UILabel()
                qtyValueLabel.textColor = UIColor.black
                qtyValueLabel.textAlignment = .right
                qtyValueLabel.numberOfLines = 1
                qtyValueLabel.adjustsFontSizeToFitWidth = true
                qtyValueLabel.font = UIFont.systemFont(ofSize: 20)
                
                subTotalLabel = UILabel()
                subTotalLabel.textColor = UIColor.black
                subTotalLabel.textAlignment = .right
                subTotalLabel.numberOfLines = 1
                subTotalLabel.adjustsFontSizeToFitWidth = true
                subTotalLabel.font = UIFont.systemFont(ofSize: 20)
                
                scrollView.addSubview(janCodeLabel)
                scrollView.addSubview(categoryLabel)
                scrollView.addSubview(productNameValueLabel)
                scrollView.addSubview(unitPriceValueLabel)
                scrollView.addSubview(qtyValueLabel)
                scrollView.addSubview(subTotalLabel)
                
                height = count * 160 + 10
                
                janCodeLabel.autoPinEdge(.top, to: .bottom, of: productNameLabel, withOffset: CGFloat(height))
                janCodeLabel.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 0)
                janCodeLabel.autoSetDimensions(to: CGSize(width: 250, height: 30))
                janCodeLabel.text = posOrderItem.product.janCode
                
                categoryLabel.autoPinEdge(.top, to: .bottom, of: janCodeLabel, withOffset: 10)
                categoryLabel.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 0)
                categoryLabel.autoSetDimensions(to: CGSize(width: 250, height: 30))
                categoryLabel.text = String(count + 1) + ". " + "新品イヤホン"
                
                productNameValueLabel.autoPinEdge(.top, to: .bottom, of: categoryLabel, withOffset: 10)
                productNameValueLabel.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 0)
                productNameValueLabel.autoSetDimensions(to: CGSize(width: 250, height: 50))
                productNameValueLabel.text = posOrderItem.product.name
                
                unitPriceValueLabel.autoPinEdge(.top, to: .bottom, of: unitPriceLabel, withOffset: CGFloat(height))
                unitPriceValueLabel.autoPinEdge(.left, to: .right, of: centerAbstractView, withOffset: 0)
                unitPriceValueLabel.autoSetDimensions(to: CGSize(width: 150, height: 30))
                unitPriceValueLabel.text = "¥" + Utils.numberToComma(number: posOrderItem.product.price)
                
                qtyValueLabel.autoPinEdge(.top, to: .bottom, of: qtyLabel, withOffset: CGFloat(height))
                qtyValueLabel.autoPinEdge(.left, to: .right, of: unitPriceValueLabel, withOffset: 0)
                qtyValueLabel.autoSetDimensions(to: CGSize(width: 100, height: 30))
                qtyValueLabel.text = String(posOrderItem.productQuantity)
                
                subTotalLabel.autoPinEdge(.top, to: .bottom, of: unitPriceValueLabel, withOffset: 50)
                subTotalLabel.autoPinEdge(.left, to: .right, of: centerAbstractView, withOffset: 0)
                subTotalLabel.autoSetDimensions(to: CGSize(width: 250, height: 30))
                subTotalLabel.text = "¥" + Utils.numberToComma(number: posOrderItem.subTotalWithoutTax)
                
                count = count + 1
            }
            
            dashLine1.autoPinEdge(.top, to: .bottom, of: subTotalLabel, withOffset: 50)
            dashLine1.autoAlignAxis(toSuperviewAxis: .vertical)
            dashLine1.autoSetDimension(.height, toSize: 5)
            
            totalAmountLabel.autoPinEdge(.top, to: .bottom, of: dashLine1, withOffset: 10)
            totalAmountLabel.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 0)
            totalAmountLabel.autoSetDimensions(to: CGSize(width: 200, height: 30))
            
            totalAmountValueLabel.autoPinEdge(.top, to: .bottom, of: dashLine1, withOffset: 10)
            totalAmountValueLabel.autoPinEdge(.left, to: .right, of: centerAbstractView, withOffset: 0)
            totalAmountValueLabel.autoSetDimensions(to: CGSize(width: 250, height: 30))
            totalAmountValueLabel.text = Utils.numberToComma(number: PosManager.getInstance().posOrder.totalAmount)
            
            usePointLabel.autoPinEdge(.top, to: .bottom, of: totalAmountLabel, withOffset: 20)
            usePointLabel.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 0)
            usePointLabel.autoSetDimensions(to: CGSize(width: 200, height: 30))
            
            usePointValueLabel.autoPinEdge(.top, to: .bottom, of: totalAmountValueLabel, withOffset: 20)
            usePointValueLabel.autoPinEdge(.left, to: .right, of: centerAbstractView, withOffset: 0)
            usePointValueLabel.autoSetDimensions(to: CGSize(width: 250, height: 30))
            usePointValueLabel.text = "¥" + Utils.numberToComma(number: PosManager.getInstance().paymentStatement.paidByTPoint)
            
            dashLine2.autoPinEdge(.top, to: .bottom, of: usePointLabel, withOffset: 10)
            dashLine2.autoAlignAxis(toSuperviewAxis: .vertical)
            dashLine2.autoSetDimension(.height, toSize: 5)
            
            paymentLabel.autoPinEdge(.top, to: .bottom, of: dashLine2, withOffset: 20)
            paymentLabel.autoPinEdge(.right, to: .left, of: centerAbstractView, withOffset: 0)
            paymentLabel.autoSetDimensions(to: CGSize(width: 200, height: 30))
            
            paymentValueLabel.autoPinEdge(.top, to: .bottom, of: dashLine2, withOffset: 20)
            paymentValueLabel.autoPinEdge(.left, to: .right, of: centerAbstractView, withOffset: 0)
            paymentValueLabel.autoSetDimensions(to: CGSize(width: 250, height: 30))
            paymentValueLabel.text = "¥" + Utils.numberToComma(number: PosManager.getInstance().paymentStatement.receivedTotal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height = CGFloat(585 + self.height + 100 + 300)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.setAllDataScreenByLocalize), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    func setAllDataScreenByLocalize() {
        titleLabel.text = "receipt_title".localized()
        storeNameLabel.text = "SHIBUYA TSUTAYA店"
        storeAddressLabel.text = "東京都渋谷区宇田川町21−6QFRONTビル3F"
        storeNameLabel.text = "TEL : 03-5784-3652"
        
        let earPhoneDrawer = [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        let  earPhoneString = NSAttributedString(string: "e-earphone.jp", attributes: earPhoneDrawer)
        earPhoneLabel.attributedText = earPhoneString
        
        buyingNumberLabel.text = "30024628"
        cashierOperatorLabel.text = "receipt_cashier_operate".localized()
        receiptLabel.text = "【" + "receipt".localized() + "】"
        productNameLabel.text = "receipt_product_name".localized()
        unitPriceLabel.text = "receipt_unit_price".localized()
        qtyLabel.text = "receipt_qty".localized()
        totalAmountLabel.text = "* *" + "receipt_total_amount".localized()
        usePointLabel.text = "receipt_use_point".localized()
        paymentLabel.text = "receipt_payment".localized()
        receivedMoneyLabel.text = "receipt_received_money".localized()
        detailLabel.text = "receipt_detail".localized()
        cashLabel.text = "receipt_cash".localized()
        cardLabel.text = "receipt_card".localized()
        changeLabel.text = "receipt_change".localized()
        dashLine1.text = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        dashLine2.text = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
    }
    
    @objc func closeClicked() {
        
        let image: UIImage!
        
        UIGraphicsBeginImageContext(scrollView.contentSize)
        
        closeBtn.isHidden = true
        let savedContentOffset = scrollView.contentOffset
        let savedFrame = scrollView.frame
        
        scrollView.contentOffset = .zero
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        
        scrollView.layer.render(in: UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        scrollView.contentOffset = savedContentOffset
        scrollView.frame = savedFrame
        
        UIGraphicsEndImageContext();
        
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "receipt_title".localized()
        
        // Set up print controller
        let printController = UIPrintInteractionController.shared
        printController.printInfo = printInfo
        
        // Assign a UIImage version of my UIView as a printing iten
        printController.printingItem = image
        
        // Do it
        printController.present(from: self.view.frame, in: self.view, animated: true, completionHandler: nil)
        
        dismiss(animated: true, completion: nil)
    }
}
