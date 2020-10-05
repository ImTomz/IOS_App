//
//  VideoLauncher.swift
//  Programatic_UI
//
//  Created by Tomas Boda on 04/10/2020.
//  Copyright © 2020 Tomas Boda. All rights reserved.
//

import UIKit

class VideoPlayerView: UIView {
    
    private let btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 16))
        btn.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.tintColor = UIColor(named: "SubTextColor")
        return btn
    }()
    
    var title: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.addSubview(btn)
        btn.center = self.center
    }
    
    @objc func checkAction() {
        // Do what you want
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.window?.viewWithTag(100)?.frame = CGRect(x: 0, y: (self.window?.frame.height)!, width: (self.window?.frame.width)!, height: 10)
        }, completion: { (completedAnimation) in
            self.window?.viewWithTag(100)!.removeFromSuperview()
        })
       
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
        view.backgroundColor = .black
        view.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 10)
        view.tag = 100
        
        //Video player view
        let videoPlayerView = VideoPlayerView(frame: CGRect(x: 0, y: window.safeAreaInsets.top, width: window.frame.width, height: window.frame.width * 9 / 16))
        view.addSubview(videoPlayerView)
        
        window.addSubview(view)
     
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            view.frame = window.frame
        }, completion: { (completedAnimation) in
//            UIApplication.shared.setStatusBarHidden(true, with: .fade)
        })
    }
}

