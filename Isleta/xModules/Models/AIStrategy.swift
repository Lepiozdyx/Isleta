//
//  AIStrategy.swift
//  Isleta
//
//  Created by Alex on 27.01.2025.
//

import Foundation

struct AIStrategy {
    // MARK: - AI Board Setup
    
    /// Выбирает случайную расстановку для AI, исключая выбранную игроком
    static func getAISetup(excluding playerSetupId: Int?) -> BoardSetup {
        // Получаем все доступные сетапы
        let availableSetups = PresetBoardSetups.setups.filter { setup in
            setup.id != playerSetupId
        }
        
        // Выбираем случайный сетап из доступных
        let randomIndex = Int.random(in: 0..<availableSetups.count)
        return availableSetups[randomIndex]
    }
    
    // MARK: - AI Attack Pattern
    
    /// Предопределенная последовательность ходов AI
    private static let attackPattern: [Position] = {
        var pattern: [Position] = []
        
        // Диагональный паттерн
        for i in 0..<10 {
            pattern.append(Position(x: i, y: i))
        }
        
        // Обратная диагональ
        for i in 0..<10 {
            pattern.append(Position(x: i, y: 9 - i))
        }
        
        // Горизонтальный паттерн
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
    
    /// Возвращает следующий ход AI, исключая уже атакованные позиции
    static func nextMove(excluding usedPositions: Set<Position>) -> Position? {
        return attackPattern.first { position in
            !usedPositions.contains(position)
        }
    }
    
    /// Проверяет, доступна ли позиция для атаки
    static func isValidMove(_ position: Position, excluding usedPositions: Set<Position>) -> Bool {
        return !usedPositions.contains(position)
    }
}
