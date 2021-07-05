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
    }
    
    func play() {

        if nil == timer {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {  [weak self] timer in
                
                if self!.currentPlayPosition == self!.endPlayPosition {
                    self!.currentPlayPosition = 0
                    if self!.playingTack == (self!.playlist?.playlist.count)! - 1 {
                        self!.playingTack = 0
                    } else {
                        self!.playingTack += 1
                    }
                    self!.endPlayPosition = (self!.playlist?.playlist[self!.playingTack].duration)!
                } else {
                    self!.currentPlayPosition += 1
                }
                
                let second = Float(self!.currentPlayPosition) / Float(self!.endPlayPosition)
                let artist = self!.playlist?.playlist[self!.playingTack].artist
                let song = self!.playlist?.playlist[self!.playingTack].nameSong
                
                self!.presenter?.play(with: second, artist: artist!, song: song!)
                
                //            print("currentPlayPosition: \(self!.currentPlayPosition)")
                //            print("endPlayPosition: \(self!.endPlayPosition)")
                //            print("playingTack: \(self!.playingTack)")
                //            print("Timer sec: \(second)")
            })
        }
        
        print("Interactor: InteractorViewInputProtocol")
    }
    
    func pause() {
        let second = Float(self.currentPlayPosition) / Float(self.endPlayPosition)
        presenter?.pause(with: second)
        
        if nil != timer {
            if timer!.isValid {
                timer?.invalidate()
                timer = nil
            } else if !timer!.isValid {
                play()
            }
        }
        
    }
    
    func stop() {
        presenter?.stop(with: 0)
        currentPlayPosition = 0
        timer?.invalidate()
        timer = nil
    }
    
    func previous() {
        let beforeTrack = playlist?.playlist.index(before: 1)
        
        presenter?.previous(with: beforeTrack!)
    }
    
    func next() {

    }
    
    deinit {
        timer?.invalidate()
    }

}
