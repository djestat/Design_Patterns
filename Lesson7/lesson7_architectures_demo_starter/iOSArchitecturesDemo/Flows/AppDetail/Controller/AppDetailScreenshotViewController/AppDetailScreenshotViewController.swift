//
//  AppDetailScreenshotViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Igor on 23.11.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenshotViewController: UIViewController {

    // MARK: - Properties
    
    private let app: ITunesApp
    
    private let imageDownloader = ImageDownloader()
    
    private var screenshotView: AppDetailScreenshotView {
        return self.view as! AppDetailScreenshotView
    }
        
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailScreenshotView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.screenshotView.collectionView.delegate = self
        self.screenshotView.collectionView.dataSource = self
        
    }
}

extension AppDetailScreenshotViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(app.screenshotUrls.count)
        return app.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ScreenshotViewCell
        
        let screenshotURL = app.screenshotUrls[indexPath.item]
        self.imageDownloader.getImage(fromUrl: screenshotURL) { (image, _) in
            cell.imageView.image = image
//            print("Size image: \(String(describing: image))")
        }
//        print("\(screenshotURL)")
        return cell
    }
}

extension AppDetailScreenshotViewController: UICollectionViewDelegate {
    
}

