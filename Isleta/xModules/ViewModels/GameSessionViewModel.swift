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
    
    func nextSetup() {
        let availableSetups = self.availableSetups.filter { setup in
            // Сетап не должен быть выбран ни одним из игроков
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
        
        // Проверяем, не был ли уже сделан ход в эту клетку
        if attackingPlayer.hits.contains(position) || attackingPlayer.misses.contains(position) {
            return false
        }
        
        // Проверяем попадание в легион
        if let _ = defendingPlayer.boardSetup?.legions.first(where: { $0.positions.contains(position) }) {
            // Register hit
            var updatedPlayer = attackingPlayer
            updatedPlayer.hits.insert(position)
            
            if currentPlayer == player1.id {
                player1 = updatedPlayer
            } else {
                player2 = updatedPlayer
            }
            
            // Проверяем условие победы
            if checkForVictory(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer) {
                gameState = .finished(winner: attackingPlayer.id)
            } else {
                gameState = .battle(currentPlayer: defendingPlayer.id)
            }
        } else {
            // Register miss
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
        
        // Проверяем каждый легион
        for legion in defenderSetup.legions {
            // Если есть хотя бы одна позиция легиона, по которой не попали - легион жив
            if !legion.positions.allSatisfy({ attackingPlayer.hits.contains($0) }) {
                return false
            }
        }
        
        // Если все позиции всех легионов поражены - победа
        return true
    }
}
