//
//  ScoreCaretaker.swift
//  Lesson01
//
//  Created by Igor on 23.10.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

class ScoreCaretaker {
    
    private let encode = JSONEncoder()
    private let decode = JSONDecoder()
    
    private let key = "scores"
    
    func save(scores: [ScoreResult]) {
        
        do {
            let data = try self.encode.encode(scores)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retriveScoress() -> [ScoreResult] {
        
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try self.decode.decode([ScoreResult].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
