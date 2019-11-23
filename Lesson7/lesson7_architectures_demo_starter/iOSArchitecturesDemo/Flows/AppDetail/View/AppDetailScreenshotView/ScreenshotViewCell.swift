//
//  ScreenshotViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by Igor on 23.11.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

class ScreenshotViewCell: UICollectionViewCell {
    // MARK: - Subviews
    
    var imageView = UIImageView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 8
        self.contentView.layer.cornerRadius = 8
        self.imageView.frame = self.contentView.bounds
        self.imageView.layer.cornerRadius = 8
        self.imageView.clipsToBounds = true
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.addImage()
    }
    
    private func addImage() {
        self.contentView.addSubview(self.imageView)
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.imageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
            ])
    }
}
