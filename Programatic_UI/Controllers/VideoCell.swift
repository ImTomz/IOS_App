//
//  MyCustomCell.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 20/07/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit    

class VideoCell: UITableViewCell {
    
    private let videoImageView: UIImageView = {
        let videoImageView = UIImageView()
        videoImageView.clipsToBounds = true
        videoImageView.backgroundColor = UIColor(named: "TextColor")
        return videoImageView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(named: "TextColor")
        imageView.layer.cornerRadius = 20/2
        return imageView
    }()
    
    private let gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Game"
        label.font = label.font.withSize(16)
        label.textColor = UIColor(named: "SubTextColor")
        return label
    }()
    
    private let profileNameLabel: UILabel = {
        let videoTextLabel = UILabel()
        videoTextLabel.textColor = UIColor(named: "TextColor")
        videoTextLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return videoTextLabel
    }()
    
    private let videoDescriptionLabel: UILabel = {
        let videoTextLabel = UILabel()
        videoTextLabel.textColor = UIColor(named: "SubTextColor")
        videoTextLabel.font = videoTextLabel.font.withSize(16)
        videoTextLabel.text = "Description"
        return videoTextLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileNameLabel)
        addSubview(videoImageView)
        addSubview(videoDescriptionLabel)
        addSubview(profileImageView)
        addSubview(gameLabel)
        self.backgroundColor = UIColor(named: "BackgroundColor")

        setupVideoImageViewConstraints()
        setupVideoTextLabelConstraints()
        setupProfileImageViewConstraints()
        
    }
    
    func set(video:Video) {
        profileNameLabel.text = video.title
    }
    
    func setupVideoImageViewConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        videoImageView.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setupProfileImageViewConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor,constant: 15).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        profileImageView.topAnchor.constraint(equalTo: videoImageView.topAnchor).isActive = true
    }
    
    func setupVideoTextLabelConstraints() {
        
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        profileNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 6).isActive = true
        profileNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        profileNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        videoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        videoDescriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        videoDescriptionLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 15).isActive = true
        videoDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        videoDescriptionLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 6).isActive = true
        
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        gameLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 15).isActive = true
        gameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        gameLabel.topAnchor.constraint(equalTo: videoDescriptionLabel.bottomAnchor, constant: 6).isActive = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
