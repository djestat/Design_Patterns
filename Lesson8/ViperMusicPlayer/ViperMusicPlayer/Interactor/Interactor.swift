//
//  Interactor.swift
//  ViperMusicPlayer
//
//  Created by Igor on 26.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import Foundation

//Реализовывать бизнес-логику.

class Interactor: InteractorViewInputProtocol {
    weak var presenter: InteractorViewOutputProtocol?
    
    let playlist = Playlist()
    
    func play() {
        presenter?.play()
    }
    
    func pause() {
        presenter?.pause()
    }
    
    func stop() {
        presenter?.stop()
    }
    
    func previous() {
        presenter?.previous()
    }
    
    func next() {
        presenter?.next()
    }

}
