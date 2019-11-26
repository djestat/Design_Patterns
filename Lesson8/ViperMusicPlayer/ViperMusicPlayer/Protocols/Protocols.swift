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
    var view: ViewProtocol? {get set}
    
    func play()
    func pause()
    func stop()
    func previous()
    func next()

}

protocol InteractorViewInputProtocol: class {
    //Presenter -> Interactor

    var presenter: InteractorViewOutputProtocol? {get set}
    
    func play()
    func pause()
    func stop()
    func previous()
    func next()

}


protocol InteractorViewOutputProtocol: class {
    //Interactor -> Presenter
     func play()
     func pause()
     func stop()
     func previous()
     func next()
    
}
