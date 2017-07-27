//
//  MenuHeaderViewCell.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/26/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MenuHeaderViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.red
        self.profileImageView.layer.cornerRadius = 40
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.borderWidth = 3
        self.profileImageView.layer.borderColor = UIColor.white.cgColor
        self.profileImageView.image = UIImage(named: "my_profile")
        
        self.profileNameLabel.text = "Thanh-Tam Le"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MenuHeaderViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
}
