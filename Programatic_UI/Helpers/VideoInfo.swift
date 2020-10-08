//
//  VideoInfo.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 07/10/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class VideoInfo: UIView {
    
    //User info stack view
    private let userInfoView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .top
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    //Name title tags stack view
    private let nameTitleAndTagsView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    //User image view
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    //User name label
    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        label.text = "First name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    //Title label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title for live stream"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "SubTextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        return label
    }()
    
    //Subscribe button
    private let subBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        btn.setTitle("Subscribe", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.backgroundColor = UIColor(named: "Purple")
        btn.layer.cornerRadius = 5
        btn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        return btn
    }()
    
    //Tag button
    private let tagBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
        btn.setTitle("English", for: .normal)
        btn.layer.cornerRadius = 8
        btn.backgroundColor = .darkGray
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentEdgeInsets = UIEdgeInsets(top: 2,left: 5,bottom: 2,right: 5)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "BackgroundColor")
        addSubview(userInfoView)
        userInfoView.addArrangedSubview(userImageView)
        userInfoView.addArrangedSubview(nameTitleAndTagsView)
        userInfoView.addArrangedSubview(subBtn)
        nameTitleAndTagsView.addArrangedSubview(nameLabel)
        nameTitleAndTagsView.addArrangedSubview(titleLabel)
        nameTitleAndTagsView.addArrangedSubview(tagBtn)
        setupUserInfoStackViewConstraints()
    }
    
    //Setup user info stack view constraints
    func setupUserInfoStackViewConstraints() {
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: topAnchor),
            userInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInfoView.widthAnchor.constraint(equalTo: widthAnchor),
            userInfoView.heightAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
