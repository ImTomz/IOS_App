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
        image.backgroundColor = UIColor(named: "TextColor")
        return image
    }()
    
    private let title : UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.textColor = UIColor(named: "TextColor")
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 15)
        return title
    }()
    
    private let viewersLabel: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewerIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "circle.fill")
        image.tintColor = .red
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(viewersLabel)
        contentView.addSubview(viewerIcon)
        setupImageConstraints()
        setupTitleConstraints()
        setupViewersLabelConstraints()
        setupViewersIconConstraints()
    }
    
    func setupImageConstraints() {
        
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 160).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupTitleConstraints() {
        
        title.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 6).isActive = true
        title.heightAnchor.constraint(equalToConstant: 12).isActive = true
        title.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupViewersLabelConstraints() {
        
        viewersLabel.leadingAnchor.constraint(equalTo: viewerIcon.trailingAnchor, constant: 2).isActive = true
        viewersLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 6).isActive = true
        viewersLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        viewersLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupViewersIconConstraints() {
        
        viewerIcon.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        viewerIcon.centerYAnchor.constraint(equalTo: viewersLabel.centerYAnchor).isActive = true
        viewerIcon.heightAnchor.constraint(equalToConstant: 9).isActive = true
        viewerIcon.widthAnchor.constraint(equalToConstant: 9).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
