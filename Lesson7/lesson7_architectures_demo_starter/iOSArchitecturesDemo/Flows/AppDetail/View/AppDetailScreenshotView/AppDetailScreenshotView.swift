//
//  AppDetailScreenshotView.swift
//  iOSArchitecturesDemo
//
//  Created by Igor on 23.11.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenshotView: UIView {

    // MARK: - Subviews

    let collectionView: UICollectionView = {
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        let sizeScale: Double = 1125 / 2436
        collectionViewFlowLayout.itemSize = CGSize(width: 240 * sizeScale, height: 240)
        collectionViewFlowLayout.minimumLineSpacing = 10
        collectionViewFlowLayout.minimumInteritemSpacing = 10

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.frame = CGRect(x: 0, y: 0, width: 375, height: 260)
        collectionView.register(ScreenshotViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.addCollectionView()
        self.setupConstraints()
        collectionView.backgroundColor = .lightGray
    }
    
    private func addCollectionView() {
        self.addSubview(self.collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
