//
//  AppDetailDescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Igor on 23.11.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionViewController: UIViewController {

    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var descriptionViewView: AppDetailDescriptionView {
        return self.view as! AppDetailDescriptionView
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
        self.view = AppDetailDescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionViewView.titleLabel.text = app.appDescription
    }

}
