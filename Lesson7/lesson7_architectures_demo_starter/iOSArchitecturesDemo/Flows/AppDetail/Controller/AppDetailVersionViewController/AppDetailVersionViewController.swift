//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Igor on 24.11.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionViewController: UIViewController {

    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var versionView: AppDetailVersionView {
        return self.view as! AppDetailVersionView
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
        self.view = AppDetailVersionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        versionView.versionLabel.text = "Current version: " + app.version!
        versionView.fixInfoLabel.text = app.releaseNotes
        
        versionView.dateReleaseLabel.text = app.currentVersionReleaseDate

        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatterGet.date(from: app.currentVersionReleaseDate!)
        let dateFormatterConverter = DateFormatter()
        dateFormatterConverter.dateFormat = "MMM dd,yyyy"
        versionView.dateReleaseLabel.text = dateFormatterConverter.string(from: date!)
    }
}
