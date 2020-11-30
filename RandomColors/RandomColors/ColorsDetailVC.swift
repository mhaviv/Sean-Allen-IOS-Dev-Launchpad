//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by Michael Haviv on 11/22/20.
//

import UIKit

class ColorsDetailVC: UIViewController {

    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .blue // unwrap optional UIColor
    }

}
