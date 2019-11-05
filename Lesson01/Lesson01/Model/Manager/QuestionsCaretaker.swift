//
//  QuestionsCaretaker.swift
//  Lesson01
//
//  Created by Igor on 04.11.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

class QuestionsCaretaker {
    
    private let encode = JSONEncoder()
    private let decode = JSONDecoder()
    
    private let key = "question"
    
    func save(scores: [Question]) {
        
        do {
            let data = try self.encode.encode(scores)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retriveQuestions() -> [Question] {
        
        guard let data = UserDefaults.standard.data(forKey: key) else { return addQuestions() }
        
        do {
            return try self.decode.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func addQuestions() -> [Question] {
        
        var questions: [Question] = []
        
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
        
        questions.append(question1)
        questions.append(question2)
        questions.append(question3)
        questions.append(question4)
        questions.append(question5)
        questions.append(question6)
        questions.append(question7)
        questions.append(question8)
        questions.append(question9)
        questions.append(question10)
        
        save(scores: questions)
        
        return questions
    }
}
