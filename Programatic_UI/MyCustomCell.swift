//
//  MyCustomCell.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 20/07/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit    

class MyCustomCell: UITableViewCell {
    
    private let videoImageView: UIImageView = {
        let videoImageView = UIImageView()
        videoImageView.clipsToBounds = true
        videoImageView.backgroundColor = .white
        return videoImageView
    }()
    
    private let videoTextLabel: UILabel = {
        let videoTextLabel = UILabel()
        videoTextLabel.adjustsFontSizeToFitWidth = true
        videoTextLabel.numberOfLines = 0
        videoTextLabel.textColor = .white
        videoTextLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return videoTextLabel
    }()
    
    private let videoDescriptionLabel: UILabel = {
        let videoTextLabel = UILabel()
        videoTextLabel.adjustsFontSizeToFitWidth = true
        videoTextLabel.numberOfLines = 0
        videoTextLabel.textColor = .white
        videoTextLabel.font = videoTextLabel.font.withSize(12)
        videoTextLabel.text = "Description"
        return videoTextLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(videoTextLabel)
        addSubview(videoImageView)
        addSubview(videoDescriptionLabel)
        self.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)

        setupVideoImageViewConstraints()
        setupVideoTextLabelConstraints()
        
    }
    
    func set(video:Video) {
        videoTextLabel.text = video.title
    }
    
    func setupVideoImageViewConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setupVideoTextLabelConstraints() {
        
        videoTextLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTextLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        videoTextLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        videoTextLabel.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        
        videoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        videoDescriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        videoDescriptionLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        videoDescriptionLabel.topAnchor.constraint(equalTo: videoTextLabel.bottomAnchor, constant: 6).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
