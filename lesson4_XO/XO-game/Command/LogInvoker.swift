//
//  LogInvoker.swift
//  XO-game
//
//  Created by Igor on 13.11.2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

final class LogInvoker {
    static let shared = LogInvoker()
    
    private let logger = Logger()
    private let batchSize = 1
    private var commands: [LogCommand] = []
    
    func addLogCommand(_ command: LogCommand) {
        self.commands.append(command)
    }
    
    private func executeCommandIfNeeded() {
        guard self.commands.count >= batchSize else { return }
        self.commands.forEach {
            self.logger.writeMessageToLog($0.logMessage)
            self.commands = []
        }
    }
}
