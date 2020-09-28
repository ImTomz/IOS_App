//
//  SecondController.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 20/07/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    
    let tableView = UITableView()
    let videos: [Video] = [Video(title: "First title"),
                           Video(title: "Second"),
                           Video(title: "Third"),
                           Video(title: "Second"),
                           Video(title: "Second"),
                           Video(title: "Second"),
                           Video(title: "Second"),]
    let cellId = "cellId"
    
    private let liveChannelsLabel: UILabel = {
        let liveChannelsLabel = UILabel()
        liveChannelsLabel.text = "Live Channels"
        liveChannelsLabel.textColor = .white
        return liveChannelsLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        view.addSubview(liveChannelsLabel)
        view.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
        setupNavController()
        setupTableView()
        setupLiveChannelsLabelConstraints()
    }
    
    func setupNavController() {
        let navBar = navigationController?.navigationBar
        navBar?.prefersLargeTitles = true
        navBar?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar?.barTintColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
        self.title = "Following"
    }
    
    func setupTableView() {
        
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: cellId)
        setupTableViewConstraints()

    }
    
    
    func setupLiveChannelsLabelConstraints() {
        
        liveChannelsLabel.translatesAutoresizingMaskIntoConstraints = false
        liveChannelsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        liveChannelsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12).isActive = true
        liveChannelsLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 12).isActive = true
        liveChannelsLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    func setupTableViewConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

}

extension SecondController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MyCustomCell
        let video = videos[indexPath.row]
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.gray
        cell.selectedBackgroundView = bgColorView
        cell.set(video: video)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(SelectedVideoController(), animated: true)
    }
}
