//
//  Strategy.swift
//  Lesson01
//
//  Created by Igor on 04.11.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

protocol QuestionsStrategy {
    func orderOfQuestion() -> [Question]
}
