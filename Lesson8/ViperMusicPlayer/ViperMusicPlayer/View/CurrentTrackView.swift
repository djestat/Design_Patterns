//
//  CurrentTrackView.swift
//  ViperMusicPlayer
//
//  Created by Igor on 25.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

class CurrentTrackView: UIView {
    
    private(set) lazy var trackImageView: UIImageView = {
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "track")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var progressViev: UIProgressView = {
        let progress = UIProgressView()
        progress.frame = CGRect(x: 10, y: self.trackImageView.frame.size.height + 20, width: 200, height: 10)
        progress.progressTintColor = .systemBlue
        progress.progressViewStyle = .bar
        progress.backgroundColor = .systemRed
        progress.setProgress(0.4, animated: true)
        return progress
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    // MARK: - UI
    
    private func setupLayout() {
        self.addSubview(self.trackImageView)
        self.addSubview(self.progressViev)

        NSLayoutConstraint.activate([
            self.trackImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.trackImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
            self.trackImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10.0),
//            self.trackImageView.heightAnchor.constraint(equalToConstant: 280.0),
//            self.trackImageView.widthAnchor.constraint(equalToConstant: 280.0),

            self.progressViev.topAnchor.constraint(equalTo: self.trackImageView.bottomAnchor, constant: 10.0),
            self.progressViev.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
//            self.progressViev.heightAnchor.constraint(equalToConstant: 10.0),
            self.progressViev.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10.0),
            self.progressViev.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10.0)
            ])
    }
    
}
