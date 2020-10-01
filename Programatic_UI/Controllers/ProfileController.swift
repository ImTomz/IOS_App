//
//  ProfileController.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 26/09/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        // Do any additional setup after loading the view.
        setupNavController()
    }
    
    func setupNavController() {
        let nav = navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        self.title = "Profile"
    }
}
