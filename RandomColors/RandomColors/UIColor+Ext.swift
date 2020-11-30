//
//  UIColor+Ext.swift
//  RandomColors
//
//  Created by Michael Haviv on 11/25/20.
//

// UIKit imports foundation so importing foundation is redundant
import UIKit

extension UIColor {
    
    static func random() -> UIColor { // static func so every UIColor has this
        
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    
}
