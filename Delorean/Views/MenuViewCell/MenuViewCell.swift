//
//  MenuViewCell.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/23/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var arrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.backgroundColor = UIColor(white: 1, alpha: 0.2)
        }
        else {
            self.backgroundColor = UIColor.clear
        }
    }
    
    func setData(menuItem: MenuModel) {
        let origImage = UIImage(named: menuItem.image)

        changeImageViewColor(color: UIColor.white, origImage: origImage, imageView: icon)
        changeImageViewColor(color: UIColor.white, origImage: UIImage(named: "ic_keyboard_arrow_right"), imageView: arrow)
        
        name.text = menuItem.name
        name.textColor = UIColor.white
    }
    
    private func changeImageViewColor(color: UIColor, origImage: UIImage?, imageView: UIImageView) {
        let tintedImage = origImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        imageView.image = tintedImage
        imageView.tintColor = color
    }
    
}
