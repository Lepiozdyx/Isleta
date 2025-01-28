//
//  AIStrategy.swift
//  Isleta
//
//  Created by Alex on 27.01.2025.
//

import Foundation

struct AIStrategy {
    // MARK: - AI Board Setup
    /// Selects a random formation for the AI, excluding the player's chosen formation
    static func getAISetup(excluding playerSetupId: Int?) -> BoardSetup {
        // Getting all the available sets
        let availableSetups = PresetBoardSetups.setups.filter { setup in
            setup.id != playerSetupId
        }
        
        // Choose a random set from the available setups
        let randomIndex = Int.random(in: 0..<availableSetups.count)
        return availableSetups[randomIndex]
    }
    
    // MARK: - AI Attack Pattern
    /// Predefined sequence of moves
    private static let attackPattern: [Position] = {
        var pattern: [Position] = []
        
        // Diagonal pattern
        for i in 0..<10 {
            pattern.append(Position(x: i, y: i))
        }
        
        // Reverse diagonal
        for i in 0..<10 {
            pattern.append(Position(x: i, y: 9 - i))
        }
        
        // Horizontal pattern
        for y in 0..<10 {
            for x in 0..<10 {
                let pos = Position(x: x, y: y)
                if !pattern.contains(pos) {
                    pattern.append(pos)
                }
            }
        }
        
        return pattern
    }()
    
    /// Returns the next AI move, excluding already attacked positions
    static func nextMove(excluding usedPositions: Set<Position>) -> Position? {
        return attackPattern.first { position in
            !usedPositions.contains(position)
        }
    }
    
    /// Checks if the position is available for attack
    static func isValidMove(_ position: Position, excluding usedPositions: Set<Position>) -> Bool {
        return !usedPositions.contains(position)
    }
}
