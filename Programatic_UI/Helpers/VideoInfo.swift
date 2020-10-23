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
        stackView.spacing = 8
        stackView.alignment = .top
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    //MARK: - User name,title,image,tags,subscribe
    
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
        imageView.backgroundColor = UIColor(named: "TextColor")
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
        btn.contentEdgeInsets = UIEdgeInsets(top: 8,left: 10,bottom: 8,right: 10)
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
    
    // MARK: -  Follow,Notifications,Subscribe buttons
    
    //Follow, notifications and subscribe buttons
    private let actionButtonsView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center
        view.distribution = .equalSpacing
        view.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        view.isLayoutMarginsRelativeArrangement = true
        view.addBottomBorder(with: .darkGray, andWidth: 0.5)
        return view
    }()
    
    //Follow button
    private let followBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.setTitle("Following", for: .normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.imageView?.tintColor = UIColor(named: "TextColor")
        btn.tintColor = UIColor(named: "TextColor")
        btn.alignImageAndTitleVertically(imageOffSet: 30)
        return btn
    }()
    
    //Notifications button
    private let notificationsBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        btn.setImage(UIImage(systemName: "bell"), for: .normal)
        btn.setTitle("Notifications", for: .normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.imageView?.tintColor = UIColor(named: "TextColor")
        btn.tintColor = UIColor(named: "TextColor")
        btn.alignImageAndTitleVertically(imageOffSet: 40)
        return btn
    }()
    
    //Subscribe button
    private let subscribeBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        btn.setImage(UIImage(systemName: "star"), for: .normal)
        btn.setTitle("Subscribe", for: .normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.imageView?.tintColor = UIColor(named: "TextColor")
        btn.tintColor = UIColor(named: "TextColor")
        btn.alignImageAndTitleVertically(imageOffSet: 35)
        return btn
    }()
    
    //MARK: - Chat
        
    //Chat table view
    private let chatView = ChatTableView() //init setting in file
    
    //Text input
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "BackgroundColor")
        addSubview(userInfoView)
        addSubview(actionButtonsView)
        addSubview(chatView)
        
        //User info view
        userInfoView.addArrangedSubview(userImageView)
        userInfoView.addArrangedSubview(nameTitleAndTagsView)
        userInfoView.addArrangedSubview(subBtn)
        nameTitleAndTagsView.addArrangedSubview(nameLabel)
        nameTitleAndTagsView.addArrangedSubview(titleLabel)
        nameTitleAndTagsView.addArrangedSubview(tagBtn)
        actionButtonsView.addArrangedSubview(followBtn)
        actionButtonsView.addArrangedSubview(notificationsBtn)
        actionButtonsView.addArrangedSubview(subscribeBtn)
        setupUserInfoStackViewConstraints()
    }
    
    //Setup user info stack view constraints
    func setupUserInfoStackViewConstraints() {
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: topAnchor),
            userInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInfoView.widthAnchor.constraint(equalTo: widthAnchor),
            userInfoView.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            actionButtonsView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor),
            actionButtonsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionButtonsView.widthAnchor.constraint(equalTo: widthAnchor),
            actionButtonsView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            chatView.topAnchor.constraint(equalTo: actionButtonsView.bottomAnchor,constant: 1 ), //+1 horizontal line
            chatView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chatView.widthAnchor.constraint(equalTo: widthAnchor),
            chatView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
