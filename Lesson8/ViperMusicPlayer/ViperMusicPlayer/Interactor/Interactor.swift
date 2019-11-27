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
    
    var playlist: Playlist?
    
    weak var presenter: InteractorViewOutputProtocol?
    
    var timer: Timer?
    
    lazy var playingTack = 0
    lazy var startPlayPosition = 0
    lazy var currentPlayPosition = 0
    lazy var endPlayPosition = playlist!.playlist[playingTack].duration
    
    init() {
        playlist = Playlist()
        
        let dateNow: Date = Date(timeInterval: 0, since: .init())
        let timeInterval: TimeInterval = 1.0
        
        timer = Timer.init(fire: dateNow, interval: timeInterval, repeats: true) { _ in
            print("One sec")
            
        }
        
        timer!.fire()
    }
    
    func startTimer(with start: Int) -> Int{
        
        
                
        
        return
    }
    
    
    func play() {
        let secont = Float(startPlaying())
        presenter?.play(with: secont)
    }
    
    func pause() {
        presenter?.pause(with: 0.5)
    }
    
    func stop() {
        presenter?.stop(with: 0)
    }
    
    func previous() {
        let beforeTrack = playlist?.playlist.index(before: 1)
        
        presenter?.previous(with: beforeTrack!)
    }
    
    func next() {
        let currentTrack = playlist?.playlist.index(after: 0)
        
        presenter?.next(with: currentTrack!)
    }
    
    deinit {
        timer?.invalidate()
    }

}
