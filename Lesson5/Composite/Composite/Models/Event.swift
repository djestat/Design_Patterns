//
//  Event.swift
//  Composite
//
//  Created by Igor on 17.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import Foundation
import UIKit

class Event: Task {
    
    var name: String
    var events: [Task] = []
    
    init(name: String) {
        self.name = name
    }
    
    func description() {
        print("then opening files: \(name)")
        self.events.forEach { $0.description() }
    }
    
    func addEvents(_ event: Task) {
        events.append(event)
    }
}
