//
//  Iteractor.swift
//  ViperMusicPlayer
//
//  Created by Igor on 26.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import Foundation

//Реализовывать бизнес-логику.

protocol IteractorViewInput: class {
    //Presenter -> Interactor

    var presenter: IteractorViewOutput? {get set}
    func loadPlaylist()
}


protocol IteractorViewOutput: class {
    //Interactor -> Presenter
    func play(playList: Playlist)
    func pause()
    func stop()
    func previous(index: Int)
    func next(index: Int)
}
 
class Iteractor: IteractorViewInput {
    var presenter: IteractorViewOutput?
    
    func loadPlaylist() {
        var myPlaylist: [MusicTrack] = []
        for i in 0...10 {
            
            let artist = "Artist \(i)"
            let nameSong = "Song \(i) name"
            let duration = Int.random(in: 6...10)
            
            let song = MusicTrack(artist: artist, nameSong: nameSong, duration: duration)
            
            myPlaylist.append(song)
        }
        presenter.
    }
    
}
