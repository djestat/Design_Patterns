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


class Presenter: PresenterProtocol {
    var interactor: InteractorViewInputProtocol?
    
    weak var view: ViewProtocol?
    
    func play() {
        view?.next()
    }
    
    func pause() {
        view?.pause()
    }
    
    func stop() {
        view?.stop()
    }
    
    func previous() {
        view?.previous()
    }
    
    func next() {
        view?.next()
    }
 
}
