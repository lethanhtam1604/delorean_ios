//
//  String.swift
//  Delorean
//
//  Created by Thanh-Tam Le on 10/26/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit

extension String {
    
    var length : Int {
        return self.characters.count
    }
    
    func digitsOnly() -> String {
        let intString = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            .joined(separator: "")
        
        return intString
    }
    
    func isdigitsOnly() -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return self.rangeOfCharacter(from: invalidCharacters, options: [], range: (self.startIndex) ..< (self.endIndex)) == nil
    }
    
}
