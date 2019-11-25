//
//  ControlTrackView.swift
//  ViperMusicPlayer
//
//  Created by Igor on 25.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

class ControlTrackView: UIView {
   
    private(set) lazy var playTrack: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play", for: .normal)
        button.titleLabel?.textColor = .systemRed
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var pauseTrack: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pause", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var stopTrack: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Stop", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var previousTrack: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("previous", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var nextTrack: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("next", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
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
        self.addSubview(self.playTrack)
        self.addSubview(self.pauseTrack)
        self.addSubview(self.stopTrack)
        self.addSubview(self.previousTrack)
        self.addSubview(self.nextTrack)

        NSLayoutConstraint.activate([
            self.playTrack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.playTrack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
            self.playTrack.widthAnchor.constraint(equalToConstant: 80.0),
            self.playTrack.heightAnchor.constraint(equalToConstant: 40.0),
            
            self.pauseTrack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.pauseTrack.leftAnchor.constraint(equalTo: self.playTrack.rightAnchor, constant: 10.0),
            self.pauseTrack.widthAnchor.constraint(equalToConstant: 80.0),
            self.pauseTrack.heightAnchor.constraint(equalToConstant: 40.0),
            
            self.stopTrack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            self.stopTrack.leftAnchor.constraint(equalTo: self.pauseTrack.rightAnchor, constant: 10.0),
            self.stopTrack.widthAnchor.constraint(equalToConstant: 80.0),
            self.stopTrack.heightAnchor.constraint(equalToConstant: 40.0),
            self.stopTrack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10.0),
            
            self.previousTrack.topAnchor.constraint(equalTo: self.playTrack.bottomAnchor, constant: 16.0),
            self.previousTrack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
            self.previousTrack.widthAnchor.constraint(equalToConstant: 125.0),
            self.previousTrack.heightAnchor.constraint(equalToConstant: 40.0),
            self.previousTrack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10.0),

            self.nextTrack.topAnchor.constraint(equalTo: self.stopTrack.bottomAnchor, constant: 16.0),
            self.nextTrack.leftAnchor.constraint(equalTo: self.previousTrack.rightAnchor, constant: 10.0),
            self.nextTrack.widthAnchor.constraint(equalToConstant: 125.0),
            self.nextTrack.heightAnchor.constraint(equalToConstant: 40.0),
            self.nextTrack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10.0),
            self.nextTrack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10.0)
            ])
    }
    
}
