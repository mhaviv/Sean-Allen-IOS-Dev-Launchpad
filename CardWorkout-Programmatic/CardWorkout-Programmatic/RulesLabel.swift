//
//  RulesLabel.swift
//  CardWorkout-Programmatic
//
//  Created by Michael Haviv on 12/4/20.
//

import UIKit

class RulesLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame) // we want to pass in super everytime there is an init
        configure() // We are overriding the init method to add our label configuration
    }
    
    // xcode makes us put it in. This is if we initialize a label via storyboard (we dont have one though)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String, fontSize: CGFloat, fontWeight: UIFont.Weight, textAlignedCenter: Bool, wordWrapping: Bool) {
        super.init(frame: .zero) // .zero is essentially putting 0 for all CGRect values for x, y, width and height
        self.text = text
        self.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        self.textAlignment = setTextAlignment(textAlignedCenter: textAlignedCenter)
        self.lineBreakMode = setLineBreakMode(wordWrapping: wordWrapping)
        
        configure()
    }
    
    func setTextAlignment(textAlignedCenter: Bool) -> NSTextAlignment  {
        if textAlignedCenter == false {
            return .left
        } else {
            return .center
        }
    }
    
    func setLineBreakMode(wordWrapping: Bool) -> NSLineBreakMode {
        if wordWrapping == false {
            return .byTruncatingTail
        } else {
            return .byWordWrapping
        }
    }
    

    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }

}
