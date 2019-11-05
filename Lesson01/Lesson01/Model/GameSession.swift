//
//  GameSession.swift
//  Lesson01
//
//  Created by Igor on 06.11.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

class GameSession {
    public var rightAnswer: Observable<Int>
    var questionsCount: Int
    
    public init(rightAnswer: Int, questionsCount: Int) {
        self.rightAnswer = Observable(rightAnswer)
        self.questionsCount = questionsCount
    }
}
