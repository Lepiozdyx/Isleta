//
//  GameSessionViewModel.swift
//  Isleta
//
//  Created by Alex on 24.01.2025.
//

import Foundation

@MainActor
final class GameSessionViewModel: ObservableObject {
    enum GameState: Equatable {
        case setup(currentPlayer: UUID)
        case battle(currentPlayer: UUID)
        case finished(winner: UUID)
    }
    
    @Published private(set) var player1: Player
    @Published private(set) var player2: Player
    @Published private(set) var gameState: GameState
    @Published private(set) var currentSetup: BoardSetup?
    
    private var availableSetups: [BoardSetup]
    
    init() {
        let player1Id = UUID()
        let player2Id = UUID()
        
        self.player1 = Player(id: player1Id, name: "Player 1")
        self.player2 = Player(id: player2Id, name: "Player 2")
        self.gameState = .setup(currentPlayer: player1Id)
        self.availableSetups = PresetBoardSetups.setups
        self.currentSetup = nil
    }
    
    func restart() {
        let player1Id = UUID()
        let player2Id = UUID()
        
        self.player1 = Player(id: player1Id, name: "Player 1")
        self.player2 = Player(id: player2Id, name: "Player 2")
        self.gameState = .setup(currentPlayer: player1Id)
        self.availableSetups = PresetBoardSetups.setups
        self.currentSetup = nil
    }
    
    func nextSetup() {
        let availableSetups = self.availableSetups.filter { setup in
            setup.id != player1.boardSetup?.id && setup.id != player2.boardSetup?.id
        }
        
        if availableSetups.isEmpty { return }
        
        if let current = currentSetup,
           let currentIndex = availableSetups.firstIndex(where: { $0.id == current.id }) {
            let nextIndex = (currentIndex + 1) % availableSetups.count
            currentSetup = availableSetups[nextIndex]
        } else {
            currentSetup = availableSetups.first
        }
    }
    
    func confirmCurrentSetup() {
        guard case .setup(let currentPlayerId) = gameState,
              let setup = currentSetup else { return }
        
        if currentPlayerId == player1.id {
            player1.boardSetup = setup
            if player2.boardSetup == nil {
                gameState = .setup(currentPlayer: player2.id)
            } else {
                gameState = .battle(currentPlayer: player1.id)
            }
        } else {
            player2.boardSetup = setup
            if player1.boardSetup == nil {
                gameState = .setup(currentPlayer: player1.id)
            } else {
                gameState = .battle(currentPlayer: player1.id)
            }
        }
        
        currentSetup = nil
    }
    
    func attack(at position: Position) -> Bool {
        guard case .battle(let currentPlayer) = gameState,
              position.x >= 0 && position.x < 10 && position.y >= 0 && position.y < 10 else {
            return false
        }
        
        let attackingPlayer: Player
        let defendingPlayer: Player
        
        if currentPlayer == player1.id {
            attackingPlayer = player1
            defendingPlayer = player2
        } else {
            attackingPlayer = player2
            defendingPlayer = player1
        }
        
        if attackingPlayer.hits.contains(position) || attackingPlayer.misses.contains(position) {
            return false
        }
        
        if let _ = defendingPlayer.boardSetup?.legions.first(where: { $0.positions.contains(position) }) {
            var updatedPlayer = attackingPlayer
            updatedPlayer.hits.insert(position)
            
            if currentPlayer == player1.id {
                player1 = updatedPlayer
            } else {
                player2 = updatedPlayer
            }
            
            if checkForVictory(attackingPlayer: updatedPlayer, defendingPlayer: defendingPlayer) {
                gameState = .finished(winner: updatedPlayer.id)
            } else {
                gameState = .battle(currentPlayer: defendingPlayer.id)
            }
        } else {
            var updatedPlayer = attackingPlayer
            updatedPlayer.misses.insert(position)
            
            if currentPlayer == player1.id {
                player1 = updatedPlayer
            } else {
                player2 = updatedPlayer
            }
            
            gameState = .battle(currentPlayer: defendingPlayer.id)
        }
        
        return true
    }
    
    private func checkForVictory(attackingPlayer: Player, defendingPlayer: Player) -> Bool {
        guard let defenderSetup = defendingPlayer.boardSetup else { return false }
        
        // Проходим по всем легионам и проверяем, попали ли по всем их позициям
        for legion in defenderSetup.legions {
            if !legion.positions.isSubset(of: attackingPlayer.hits) {
                return false
            }
        }
        
        return true
    }
}
