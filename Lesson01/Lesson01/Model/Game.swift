//
//  Game.swift
//  Lesson01
//
//  Created by Igor on 22.10.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

final class Game {
    static let shared = Game()
    var gameSession: GameSession?
    
    
    private let scoreCaretaker = ScoreCaretaker()
    
    private(set) var results: [ScoreResult] {
        didSet {
            scoreCaretaker.save(scores: self.results)
        }
    }
        
    private init() {
        self.results = self.scoreCaretaker.retriveScoress()
    }
    
    func addResult() {
        
        let scoreResult = ScoreResult(rightAnswer: gameSession!.rightAnswer.value, numberOfQuestions: gameSession!.questionsCount, percentRightAnswers: (Double(gameSession!.rightAnswer.value) / Double(gameSession!.questionsCount)) * 100)
        self.results.append(scoreResult)
    }
    
    func clearGameSession() {
        gameSession = nil
    }
    
    // Startegy
    var difficulty: Difficulty = .inseries
    
    private lazy var questionsStrategy: QuestionsStrategy = {
        switch self.difficulty {
        case .inseries:
            let questions = InSeriesStrategy()
            return questions
        case .random:
            let questions = RandomStrategy()
            return questions
        }
    }()
    
    func getQuestions() -> [Question] {
        return questionsStrategy.orderOfQuestion()
    }
}

struct ScoreResult: Codable {
    var rightAnswer: Int
    var numberOfQuestions: Int
    var percentRightAnswers: Double
    
}

