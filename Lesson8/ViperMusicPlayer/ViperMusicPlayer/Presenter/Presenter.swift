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
    
//    weak var view: ViewProtocol?
    
    weak var progressView: UIProgressView?

    init(interactor: InteractorViewInputProtocol, view: UIProgressView) {
        self.interactor = interactor
        self.progressView = view
    }
    
    init() {
    }
    
    func play() {
        interactor?.play()
        print("Presenter: PresenterProtocol")
    }
    
    func pause() {
        interactor?.pause()
    }
    
    func stop() {
        interactor?.stop()
    }
    
    func previous() {
        interactor?.previous()
    }
    
    func next() {
        interactor?.next()
    }
 
}

extension Presenter: InteractorViewOutputProtocol {
    
    
    func play(with progress: Float) {
        progressView?.progress = progress
        print("Presenter: InteractorViewOutputProtocol \(progress)")
    }
    
    func pause(with progress: Float) {
        progressView?.progress = progress
    }
    
    func stop(with progress: Float) {
        progressView?.progress = progress
    }
    
    func previous(with song: Int) {
        
    }
    
    func next(with song: Int) {
        
    }

}
