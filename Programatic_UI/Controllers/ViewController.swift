//
//  ViewController.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 20/07/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Next page button
    private let nextPageBtn: UIButton = {
        let nextPageBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        nextPageBtn.setTitle("Next", for: .normal)
        nextPageBtn.backgroundColor = .white
        nextPageBtn.setTitleColor(.black, for: .normal)
        nextPageBtn.layer.cornerRadius = 10
        nextPageBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        return nextPageBtn
    }()
    
    //Setup tab bar
    private let tabBarVC: UITabBarController = {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FollowingViewController())
        let vc2 = UINavigationController(rootViewController: ProfileController())
        let viewControllers = [vc1,vc2]
        
        tabBarVC.setViewControllers(viewControllers, animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.barTintColor = UIColor(named: "BarColor")
        tabBarVC.tabBar.tintColor = UIColor(named: "Purple")
        tabBarVC.tabBar.unselectedItemTintColor = UIColor(named: "SubTextColor")
        
        let images = ["heart","person"]
        let selectedImages = ["heart.fill","person.fill"]
        viewControllers[0].title = "Following"
        viewControllers[1].title = "Profile"
        
        let items = tabBarVC.tabBar.items
        for x in 0..<items!.count {
            items![x].image = UIImage(systemName: images[x])
        }
        for x in 0..<items!.count {
            
            items![x].selectedImage = UIImage(systemName: selectedImages[x])
        }
        return tabBarVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(nextPageBtn)
    }
        
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        nextPageBtn.center = view.center
        
    }
    
    //Action for next button
    @objc func nextBtnTapped() {
        present(tabBarVC, animated: true)
    }
}

