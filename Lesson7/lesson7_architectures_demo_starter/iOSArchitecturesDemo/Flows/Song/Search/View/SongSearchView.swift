//
//  SongSearchView.swift
//  iOSArchitecturesDemo
//
//  Created by Igor on 19.11.2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation

protocol SearchViewInput: class {
    
    var searchResults: [ITunesApp] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SearchViewOutput: class {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
}
