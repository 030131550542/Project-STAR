//
//  MenuViewController.swift
//  Star
//
//  Created by Токтаганов Турлыхан on 10/19/19.
//  Copyright © 2019 Токтаганов Турлыхан. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var contollers: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in contollers {
            button.layer.masksToBounds = false
            button.layer.cornerRadius = 16
            
            
            let layer = button.layer
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.8
            button.layer.shadowRadius = 10
            button.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            button.clipsToBounds = true
        }
    }
    


}
