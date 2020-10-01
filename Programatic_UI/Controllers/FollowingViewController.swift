//
//  SecondController.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 20/07/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class FollowingViewController: UIViewController {
    
    let tableView = UITableView()
    var live: [Video] = [Video(title: "First title"),
                         Video(title: "Second"),
                         Video(title: "Third"),]
    
    var videos: [Video] = [Video(title: "First title"),
                           Video(title: "Second"),
                           Video(title: "Third"),
                           Video(title: "Second"),
                           Video(title: "Second"),
                           Video(title: "Second"),
                           Video(title: "Second"),]
    
    let cellId = "cellId"
    let collectionCellId = "collectionCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
        setupNavController()
        setupTableView()
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
        
        tableView.sectionHeaderHeight = 30
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)
        tableView.register(VideoCell.self, forCellReuseIdentifier: cellId)
        tableView.register(CollectionInTableViewCell.self, forCellReuseIdentifier: collectionCellId)
        tableView.contentInset.bottom = 10
        setupTableViewConstraints()
        
    }

    func setupTableViewConstraints() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }

}

extension FollowingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        }
        else if (section == 1){
            return live.count
        }
        return videos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 220 : 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: collectionCellId) as! CollectionInTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! VideoCell
        let video:Video?
        switch indexPath.section {
        case 1:
            video = live[indexPath.row]
        case 2:
            video = videos[indexPath.row]
        default:
            video = nil
        }
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.gray
        cell.selectedBackgroundView = bgColorView
        cell.set(video: video!)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section >= 1){
            let vc = SelectedVideoController()
            vc.text = live[indexPath.row].title
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        headerView.backgroundColor = UIColor(red: 34/255, green: 37/255, blue: 38/255, alpha: 1)

        let label = UILabel()
        label.frame = CGRect(x: 15, y: 5, width: headerView.frame.width-12, height: headerView.frame.height-12)
        switch section {
        case 0:
            label.text = "FOLLOWED CATEGORIES"
        case 1:
            label.text = "LIVE CHANNELS"
        case 2:
            label.text = "VIDEOS"
        default:
            label.text = ""
        }
        
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)


        headerView.addSubview(label)

        return headerView
    }
    
}
