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
        addSubview(VideoPlayerControls(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)))
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
        view.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 10)
        view.tag = 100
        
        //Video player view
        let videoPlayerView = VideoPlayerView(frame: CGRect(x: 0, y: window.safeAreaInsets.top, width: window.frame.width, height: window.frame.width * 9 / 16))
        //Video info view
        let videoInfoView = VideoInfo(frame: CGRect(x: 0, y: window.safeAreaInsets.top + videoPlayerView.frame.height, width: window.frame.width, height: window.frame.height - videoPlayerView.frame.height))

        view.addSubview(videoPlayerView)
        view.addSubview(videoInfoView)
        
        window.addSubview(view)
     
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            view.frame = window.frame
        }, completion: { (completedAnimation) in
//            UIApplication.shared.setStatusBarHidden(true, with: .fade)
        })
    }
}

