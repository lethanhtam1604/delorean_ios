//
//  UIView.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 9/26/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

extension UIView {
    
    func changeSulfur() {
        let visualV = UIVisualEffectView(effect: UIBlurEffect(style: .dark)) as UIVisualEffectView
        visualV.frame = self.bounds
        self.addSubview(visualV)
    }
    
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
