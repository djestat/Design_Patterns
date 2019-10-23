//
//  Game.swift
//  Lesson01
//
//  Created by Igor on 22.10.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

/*
4. Создайте синглтон Game и класс GameSession (не синглтон). У Game создайте опциональное свойство типа GameSession. Когда нажимается кнопка «Играть» и начинается игра, создавайте новый GameSession и передайте его синглтону Game. В GameSession храните всю информацию о ходе текущей игры: сколько вопросов было решено правильно, сколько их всего (дополнительно: какие доступные подсказки остались; сколько юзер выиграет денег, если закончит игру). Всю эту информацию GameSession должен получать через delegate от GameViewController — вью-контроллера, на котором происходит игра и нажимаются кнопки ответов.

5. Когда игра заканчивается, в синглтоне Game посчитайте результат — какой процент от общего числа вопросов получили правильные ответы. Сохраните этот результат в синглтоне (подсказка: нужно отдельное свойство, массив результатов игры) и обнулите у него свойство GameSession, так как игра была завершена.

5. Используя паттерн Memento, сохраняйте результаты на диск, как это было сделано на уроке.
*/

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
        
        let scoreResult = ScoreResult(rightAnswer: gameSession!.rightAnswer, numberOfQuestions: gameSession!.questionsCount, percentRightAnswers: (Double(gameSession!.rightAnswer) / Double(gameSession!.questionsCount)) * 100)
        self.results.append(scoreResult)
    }
    
    func clearGameSession() {
        
    }
}

class GameSession {
    var rightAnswer: Int
    var questionsCount: Int
    
    init(rightAnswer: Int, questionsCount: Int) {
        self.rightAnswer = rightAnswer
        self.questionsCount = questionsCount
    }
}

struct ScoreResult: Codable {
    var rightAnswer: Int
    var numberOfQuestions: Int
    var percentRightAnswers: Double
    
}

struct Question {
    var question: String
    var answersVariants: [String]
    var answer: Int
    var winMoney: Int
}
/*
class Question {
    var question: String
    var answersVariants: [String]
    var answer: Int
    var winMoney: Int
    
    init(question: String, answersVariants: [String], answer: Int, winMoney: Int) {
        self.question = question
        self.answersVariants = answersVariants
        self.answer = answer
        self.winMoney = winMoney
    }

}*/

