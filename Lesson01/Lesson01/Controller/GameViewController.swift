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
    
    weak var delegate: GameViewControllerDelegate?
    
    let gameSession = GameSession(rightAnswer: 0, questionsCount: 0)
    var questions: [Question] = []
    var score: Int = 0
    var numberOfQuestion = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addQuestions()
        newQuestion()
        gameSession.questionsCount = questions.count
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
        gameSession.rightAnswer = numberOfQuestion
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
    
    func addQuestions() {
        let question1 = Question(question: "Что растёт в огороде?", answersVariants: ["A: Лук","B: Пистолет","C: Пулемёт","D: Ракета СС-20"], answer: 1, winMoney: 1_000)
        let question2 = Question(question: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?", answersVariants: ["A: Рейсовка","B: Путёвка","C: Курсовка","D: Маршрутка"], answer: 4, winMoney: 5_000)
        let question3 = Question(question: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен» ?", answersVariants: ["A: Дым Отечества","B: Дух купечества","C: Дар пророчества","D: Пыл девичества"], answer: 1, winMoney: 10_000)
        let question4 = Question(question: "Какого персонажа нет в известной считалке «На золотом крыльце сидели» ?", answersVariants: ["A: Сапожника","B: Кузнеца","C: Короля","D: Портного"], answer: 2, winMoney: 25_000)
        let question5 = Question(question: "Какой специалист занимается изучением неопознанных летающих объектов?", answersVariants: ["A: Кинолог","B: Уфолог","C: Сексопатолог","D: Психиатр"], answer: 2, winMoney: 50_000)
        let question6 = Question(question: "Как называется разновидность воды, в которой атом водорода замещён его изотопом дейтерием?", answersVariants: ["A: Лёгкая","B: Средняя","C: Тяжёлая","D: Невесомая"], answer: 3, winMoney: 100_000)
        let question7 = Question(question: "Что такое десница?", answersVariants: ["A: Бровь","B: Глаз","C: Шея","D: Рука"], answer: 4, winMoney: 125_000)
        let question8 = Question(question: "В какое море впадает река Урал?", answersVariants: ["A: Азовское","B: Чёрное","C: Средиземное","D: Каспийское"], answer: 4, winMoney: 250_000)
        let question9 = Question(question: "Какое животное имеет второе название — кугуар?", answersVariants: ["A: Оцелот","B: Леопард","C: Пума","D: Пантера"], answer: 3, winMoney: 500_000)
        let question10 = Question(question: "Что в России 19 века делали в дортуаре?", answersVariants: ["A: Ели","B: Спали","C: Ездили верхом","D: Купались"], answer: 2, winMoney: 1_000_000)
        
        self.questions.append(question1)
        self.questions.append(question2)
        self.questions.append(question3)
        self.questions.append(question4)
        self.questions.append(question5)
        self.questions.append(question6)
        self.questions.append(question7)
        self.questions.append(question8)
        self.questions.append(question9)
        self.questions.append(question10)
    }
}
