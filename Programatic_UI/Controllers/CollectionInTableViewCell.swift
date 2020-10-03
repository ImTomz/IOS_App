//
//  CollectionInTableViewCell.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 30/09/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class CollectionInTableViewCell: UITableViewCell {
    
    weak var delegate:CategoryRowDelegate?
    
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
        return 8
    }
    
    // Cell for item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CategoryCell
        // Configure the cell
        return cell
    }
    
    // Tap event for cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellTapped()
    }
    
}
