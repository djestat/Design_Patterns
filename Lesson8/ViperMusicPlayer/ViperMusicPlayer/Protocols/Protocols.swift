//
//  Protocols.swift
//  ViperMusicPlayer
//
//  Created by Igor on 26.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit


protocol ViewProtocol: class {
    // PRESENTER -> VIEW

    func play()
    func pause()
    func stop()
    func previous()
    func next()

}

protocol PresenterProtocol: class {
    //View -> Presenter
    var interactor: InteractorViewInputProtocol? {get set}
//    var view: ViewProtocol? {get set}
    
    func play()
    func pause()
    func stop()
    func previous()
    func next()

}

protocol InteractorViewInputProtocol: class {
    //Presenter -> Interactor
    
    var playlist: Playlist? {get set}

    var presenter: InteractorViewOutputProtocol? {get set}
    
    func play()
    func pause()
    func stop()
    func previous()
    func next()

}


protocol InteractorViewOutputProtocol: class {
    //Interactor -> Presenter
    
    var progressView: UIProgressView? {get set}
    
    func play(with progress: Float, artist: String, song: String)
    func pause(with progress: Float)
    func stop(with progress: Float)
    func previous(with song: Int)
    func next(with song: Int)
    
}
