//
//  CategoryCell.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 30/09/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    private let image : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(image)
        setupImageConstraints()
    }
    
    func setupImageConstraints() {
        
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 160).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
