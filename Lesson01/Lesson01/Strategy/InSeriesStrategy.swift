//
//  InSeriesStrategy.swift
//  Lesson01
//
//  Created by Igor on 05.11.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

final class InSeriesStrategy: QuestionsStrategy {
    func orderOfQuestion() -> [Question] {
        var questions: [Question] = []
        let data = QuestionsCaretaker()
        questions = data.retriveQuestions()
        return questions
    }
}
