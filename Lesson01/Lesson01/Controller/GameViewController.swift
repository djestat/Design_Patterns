//
//  GameViewController.swift
//  Lesson01
//
//  Created by Igor on 22.10.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func didFinishGame(withScore score: GameSession)
}

class GameViewController: UIViewController {

    @IBOutlet weak var questionOutlet: UITextView!
    
    @IBOutlet weak var buttonAOutlet: UIButton!
    @IBOutlet weak var buttonBOutlet: UIButton!
    @IBOutlet weak var buttonCOutlet: UIButton!
    @IBOutlet weak var buttonDOutlet: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionsScoreLabel: UILabel!
    
    weak var delegate: GameViewControllerDelegate?
    
    let gameSession = GameSession(rightAnswer: 0, questionsCount: 0)
    var questions: [Question] = Game.shared.getQuestions()
    // TODO: Here
    var score: Int = 0
    var numberOfQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newQuestion()
        gameSession.questionsCount = questions.count
        
        questionsScoreLabel.text = "0% / \(questions.count)"
        checkDifficulty()
        gameSession.rightAnswer.addObserver(self, options: [.new], closure: {
            [weak self] rightAnswer, _ in
            let percentRightAnswers = (Double(rightAnswer) / Double(self!.questions.count)) * 100
            print("Percent Right Answers => \(percentRightAnswers)")

            self!.questionsScoreLabel.text = "\(String(format: "%.2f", percentRightAnswers))% / \(self!.questions.count)"
            print("Value => NEW \(rightAnswer)")
        })
    }
    
    func newQuestion () {
        
        if numberOfQuestion == questions.count - 1 {
            self.delegate?.didFinishGame(withScore: gameSession)
            self.dismiss(animated: true, completion: nil)
        }
        
        questionOutlet.text = questions[numberOfQuestion].question
        buttonAOutlet.setTitle(questions[numberOfQuestion].answersVariants[0], for: .normal)
        buttonAOutlet.titleLabel?.adjustsFontSizeToFitWidth = true
        buttonBOutlet.setTitle(questions[numberOfQuestion].answersVariants[1], for: .normal)
        buttonBOutlet.titleLabel?.adjustsFontSizeToFitWidth = true
        buttonCOutlet.setTitle(questions[numberOfQuestion].answersVariants[2], for: .normal)
        buttonCOutlet.titleLabel?.adjustsFontSizeToFitWidth = true
        buttonDOutlet.setTitle(questions[numberOfQuestion].answersVariants[3], for: .normal)
        buttonDOutlet.titleLabel?.adjustsFontSizeToFitWidth = true
        scoreLabel.text = String("\(questions[numberOfQuestion].winMoney)")
        
    }
    
    func checkAnswer (_ answerNumber: Int) {
        
        if answerNumber == questions[numberOfQuestion].answer {
            numberOfQuestion = numberOfQuestion + 1
            newQuestion()
        } else {
            self.delegate?.didFinishGame(withScore: gameSession)
            self.dismiss(animated: true, completion: nil)
        }
        gameSession.rightAnswer.value = numberOfQuestion
    }
    
    func checkDifficulty() {
        if Game.shared.difficulty == .inseries {
            print("🗯 \(Game.shared.difficulty)")
            print("🗯 \(Game.shared.getQuestions())")
        } else if Game.shared.difficulty == .random {
            print("🗯 \(Game.shared.difficulty)")
            print("🗯 \(Game.shared.getQuestions())")
        }
    }


    // MARK: - Navigation

    @IBAction func buttonAAction(_ sender: Any) {
        let answer = 1
        checkAnswer(answer)
    }
    
    @IBAction func buttonBAction(_ sender: Any) {
        let answer = 2
        checkAnswer(answer)
    }
    
    @IBAction func buttonCAction(_ sender: Any) {
        let answer = 3
        checkAnswer(answer)
    }
    
    @IBAction func buttonDAction(_ sender: Any) {
        let answer = 4
        checkAnswer(answer)
    }
    
}
