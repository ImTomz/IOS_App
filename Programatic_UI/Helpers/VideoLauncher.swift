//
//  VideoLauncher.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 04/10/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class VideoPlayerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VideoLauncher: NSObject {
    func showVideoPlayer() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        // Whole view
        let view = UIView(frame: window.frame)
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.frame = CGRect(x: window.frame.width - 10, y: window.frame.height - 10, width: 10, height: 10)
        
        //Video player view
        let videoPlayerView = VideoPlayerView(frame: CGRect(x: 0, y: 0, width: window.frame.width, height: window.frame.width * 9 / 16))
        view.addSubview(videoPlayerView)
        
        window.addSubview(view)
     
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            view.frame = window.frame
        }, completion: { (completedAnimation) in
//            UIApplication.shared.setStatusBarHidden(true, with: .fade)
        })
    }
}

