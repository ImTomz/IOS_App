//
//  CategoriesController.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 30/09/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit



class CategoriesController: UICollectionViewController {

    let collectionCellID = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath)
    
        // Configure the cell
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cell.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cell.backgroundColor = .red
        return cell
    }

}
