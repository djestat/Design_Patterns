//
//  MusicTrack.swift
//  ViperMusicPlayer
//
//  Created by Igor on 25.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import Foundation

class MusicTrack {
    let artist: String
    let nameSong: String
    let duration: Int
    
    init(artist: String, nameSong: String, duration: Int) {
        self.artist = artist
        self.nameSong = nameSong
        self.duration = duration
    }
}
