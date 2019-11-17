//
//  Composite.swift
//  Composite
//
//  Created by Igor on 17.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import Foundation
import UIKit
//Создать приложение со списком задач, где для каждой задачи можно создать подзадачи, у них — еще подзадачи, и так до бесконечности.
//UI приложения: первый экран состоит из списка корневых задач. В navigation bar справа должна быть кнопка + (добавить задачу). Все задачи отображаются в обычной table view. В ячейке укажите название задачи и количество подзадач в ней. По нажатию на ячейку переходим на новый экран, представляющий собой экран этой задачи. На нем отображается список подзадач уже этой задачи. Здесь также есть плюсик в navigation bar для добавления подзадач и все они отображаются в table view. Таким образом, все экраны задач абсолютно одинаковы.
//Реализуйте древовидную иерархию задач, применив паттерн Composite.

protocol Task {
    var name: String { get }
    var events: [Task] { get set}
    
    func description()
    func addEvents(_ event: Task)
}
