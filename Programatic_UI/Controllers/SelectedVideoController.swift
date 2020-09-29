//
//  SelectedVideoController.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 27/09/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class SelectedVideoController: UIViewController {

    var text: String?
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.text = text
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
    }
    
    

}
