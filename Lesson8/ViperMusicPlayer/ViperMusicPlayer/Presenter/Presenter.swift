//
//  Presenter.swift
//  ViperMusicPlayer
//
//  Created by Igor on 26.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

//Обрабатывать user interaction (через ViewOutput).
//Управлять отображением View (через ViewInput).


protocol ViewProtocol: class {
    // Fist Load with this protocol
    // PRESENTER -> VIEW
    func loadPlaylist(playlist: [Playlist])
}

protocol PresenterProtocol: class {
    //View -> Presenter
    var interactor: IteractorViewInput? {get set}
    var view: ViewProtocol? {get set}
    func viewDidLoad()

}

class Presenter: PresenterProtocol {
    var interactor: IteractorViewInput?
    
    var view: ViewProtocol?
    
    func viewDidLoad() {
        loadPlaylist()
    }
    
    func loadPlaylist() {
        interactor?.loadPlaylist()
    }
    
    
}
