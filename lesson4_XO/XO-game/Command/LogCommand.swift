//
//  LogCommand.swift
//  XO-game
//
//  Created by Igor on 12.11.2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

final class LogCommand {
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        switch self.action {
        case .playerInput(let player, let position):
            return "Player - \(player), move to => \(position)"
        case .gameFinish(let winner):
            if let winner = winner {
                return "\(winner) win"
            } else {
                return "no winner"
            }
        case .restartGame:
            return "Game restarted"
        }
    }
}
