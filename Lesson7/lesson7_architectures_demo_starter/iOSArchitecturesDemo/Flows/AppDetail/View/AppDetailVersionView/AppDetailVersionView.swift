//
//  AppDetailVersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Igor on 24.11.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class AppDetailVersionView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var whatNewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 1
        label.text = "What new"
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 11.0)
        return label
    }()
    
    private(set) lazy var dateReleaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 11.0)
        label.numberOfLines = .max
        return label
    }()
    
    private(set) lazy var fixInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
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
        self.addSubview(self.whatNewLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.dateReleaseLabel)
        self.addSubview(self.fixInfoLabel)
        
        NSLayoutConstraint.activate([
            self.whatNewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            self.whatNewLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.whatNewLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.whatNewLabel.bottomAnchor, constant: 12.0),
            self.versionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.versionLabel.widthAnchor.constraint(equalToConstant: 130.0),
            
            self.dateReleaseLabel.topAnchor.constraint(equalTo: self.whatNewLabel.bottomAnchor, constant: 12.0),
            self.dateReleaseLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.dateReleaseLabel.widthAnchor.constraint(equalToConstant: 120.0),
//            self.openButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            self.fixInfoLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 12.0),
            self.fixInfoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.fixInfoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.fixInfoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12.0)
            ])
    }
}
