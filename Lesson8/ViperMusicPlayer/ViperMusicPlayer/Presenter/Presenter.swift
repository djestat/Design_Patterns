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
    
    func play() {
        interactor?.play()
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
        <#code#>
    }
    
    func pause(with progress: Float) {
        <#code#>
    }
    
    func stop(with progress: Float) {
        <#code#>
    }
    
    func previous(with song: Int) {
        <#code#>
    }
    
    func next(with song: Int) {
        <#code#>
    }
    
    
  
    
}
