//
//  Question.swift
//  Lesson01
//
//  Created by Igor on 06.11.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import Foundation

struct Question: Codable {
    var question: String
    var answersVariants: [String]
    var answer: Int
    var winMoney: Int
}
