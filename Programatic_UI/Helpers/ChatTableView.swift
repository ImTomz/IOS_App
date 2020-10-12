//
//  ChatTableView.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 12/10/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import Foundation
import UIKit

class ChatTableView: UITableView {
    
    let chatCellID = "chatCellID"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChatTableView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatCellID )
        cell?.backgroundColor = .green
        return cell!
    }
    
}
