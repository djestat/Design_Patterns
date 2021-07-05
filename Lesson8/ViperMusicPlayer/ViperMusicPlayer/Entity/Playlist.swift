//
//  Playlist.swift
//  ViperMusicPlayer
//
//  Created by Igor on 25.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import Foundation

class Playlist {
    let playlist: [MusicTrack]
    
    init() {        
        var myPlaylist: [MusicTrack] = []
        for i in 0...10 {
            
            let artist = "Artist \(i)"
            let nameSong = "Song \(i) name"
            let duration = Int.random(in: 6...10)
            
            let song = MusicTrack(artist: artist, nameSong: nameSong, duration: duration)
            
            myPlaylist.append(song)
        }
        self.playlist = myPlaylist
    }
}

