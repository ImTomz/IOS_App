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
        view.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
        
        // Do any additional setup after loading the view.
        setupNavController()
    }
    
    func setupNavController() {
        let nav = navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]


        self.title = "Profile"
    }
}
