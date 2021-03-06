//
//  VideoControls.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 06/10/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import Foundation
import UIKit

class VideoPlayerControls: UIView {
    
    //Hide button
    private let hideBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 16))
        btn.addTarget(self, action: #selector(hideButtonTap), for: .touchUpInside)
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Play and pause button
    private let playAndPauseBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.imageView?.tintColor = .white
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(hideBtn)
        self.addSubview(playAndPauseBtn)
        setupBtns()
    }
    
    //Action for hide button
    @objc func hideButtonTap() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.window?.viewWithTag(100)?.frame = CGRect(x: 0, y: (self.window?.frame.height)!, width: (self.window?.frame.width)!, height: 10)
        }, completion: { (completedAnimation) in
            self.window?.viewWithTag(100)!.removeFromSuperview()
        })
       
    }
    
    //Setup all buttons constraints
    func setupBtns() {
        
        //Hide button
        NSLayoutConstraint.activate([
            hideBtn.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            hideBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            hideBtn.widthAnchor.constraint(equalToConstant: 28),
            hideBtn.heightAnchor.constraint(equalToConstant: 28)
        ])
        //Play and pause button
        playAndPauseBtn.center = center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
