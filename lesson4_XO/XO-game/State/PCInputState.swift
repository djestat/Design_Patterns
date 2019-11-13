//
//  PCInputState.swift
//  XO-game
//
//  Created by Igor on 13.11.2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import Foundation

public class PCInputState: GameState {
    
    public private(set) var isCompleted = false
    
    public let player: Player
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    init(player: Player, gameViewController: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
        self.player = player
        self.gameViewController = gameViewController
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    public func begin() {
        switch self.player {
        case .first:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = false
            self.gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = true
            self.gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        self.gameViewController?.winnerLabel.isHidden = true
    }
    
    public func addMark(at position: GameboardPosition) {
        Log(.playerInput(player: self.player, position: position))
        guard let gameboardView = self.gameboardView
            , gameboardView.canPlaceMarkView(at: position)
            else { return }
        
        let markView: MarkView
        switch self.player {
        case .first:
            markView = XView()
        case .second:
            markView = OView()
        }
        
        if player == .first {
            self.gameboard?.setPlayer(self.player, at: position)
        } else if player == .second {
            var position: GameboardPosition
            repeat {
                let column = Int.random(in: 1...3)
                let row = Int.random(in: 1...3)
                position = GameboardPosition(column: column, row: row)
            } while !(self.gameboard?.contains(player: player, at: position))!
            self.gameboard?.setPlayer(self.player, at: position)
            
        }
        self.gameboardView?.placeMarkView(markView, at: position)
        self.isCompleted = true
    }
    
}
