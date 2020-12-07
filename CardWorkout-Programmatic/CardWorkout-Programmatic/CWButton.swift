//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Michael Haviv on 12/2/20.
//

import UIKit

class CWButton: UIButton {

    // Overrides the UIButtin init
    override init(frame: CGRect) {
        super.init(frame: frame) // we want to pass in super everytime there is an init
        configure() // We are overriding the init method to add our button configuration
    }
    
    // xcode makes us put it in. This is if we initialize a button via storyboard (we dont have one though)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero) // .zero is essentially putting 0 for all CGRect values for x, y, width and height
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false // use auto layout
    }

}
