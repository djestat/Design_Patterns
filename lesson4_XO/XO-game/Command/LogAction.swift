//
//  LogAction.swift
//  XO-game
//
//  Created by Igor on 13.11.2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

public enum LogAction {
    case playerInput(player: Player, position: GameboardPosition)
    case gameFinish(winner: Player?)
    case restartGame
}

public func Log(_ action: LogAction) {
    let command = LogCommand(action: action)
    LogInvoker.shared.addLogCommand(command)
}
