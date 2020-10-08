//
//  CollectionInTableViewCell.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 30/09/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class CollectionInTableViewCell: UITableViewCell {

    //Delegate for selection
    weak var delegate:CategoryRowDelegate?
    
    //Categories dummy data
    var categories: [Category] = [Category(game: "World of Warcraft", viewers: "27K"),
                                  Category(game: "League of Legends", viewers: "57K"),
                                  Category(game: "Fortnite", viewers: "32K"),
                                  Category(game: "Among us", viewers: "25K"),
                                  Category(game: "Just Chatting", viewers: "156K"),]
    
    //Collection view setup
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120.0,height: 200.0)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 15,
                                           bottom: 0,
                                           right: 15)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "cellId")
        cv.backgroundColor = UIColor(named: "BackgroundColor")
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.contentView.isUserInteractionEnabled = false
        setupCollectionViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Setup for collection view constraints
    func setupCollectionViewConstraints() {
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}

extension CollectionInTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    // Cell for item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CategoryCell
        let category:Category?
        category = categories[indexPath.item]
        cell.setGame(category: category!)
        cell.setViewers(category: category!)
        return cell
    }
    
    // Tap event for cell from custom delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellTapped()
    }
    
}
