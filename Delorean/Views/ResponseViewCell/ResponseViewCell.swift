//
//  ResponseViewCell.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/22/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class ResponseViewCell: UITableViewCell {

//    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var textL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.backgroundColor = UIColor(white: 1, alpha: 0.3)
        }
        else {
            self.backgroundColor = UIColor.clear
        }
    }
    
    func setData(text: String) {
        responseLabel.text = text
       
    }
    
}
