//
//  BoardSetup.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import Foundation
    
struct PresetBoardSetups {
    static let setups: [BoardSetup] = [
        // Сетап #1: "Классический"
        BoardSetup(
            id: 1,
            legions: [
                // Большой легион (5 клеток) - горизонтально в верхней части
                Legion(type: .large, positions: Set([
                    Position(x: 2, y: 1),
                    Position(x: 3, y: 1),
                    Position(x: 4, y: 1),
                    Position(x: 5, y: 1),
                    Position(x: 6, y: 1)
                ])),
                
                // Средний легион (4 клетки) - вертикально слева
                Legion(type: .medium, positions: Set([
                    Position(x: 1, y: 3),
                    Position(x: 1, y: 4),
                    Position(x: 1, y: 5),
                    Position(x: 1, y: 6)
                ])),
                
                // Малые легионы (3 клетки) - по диагонали в центре
                Legion(type: .small, positions: Set([
                    Position(x: 4, y: 4),
                    Position(x: 5, y: 4),
                    Position(x: 6, y: 4)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 4, y: 7),
                    Position(x: 5, y: 7),
                    Position(x: 6, y: 7)
                ])),
                
                // Орлиные стаи (2 клетки) - по краям
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 2),
                    Position(x: 9, y: 2)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 8),
                    Position(x: 9, y: 8)
                ]))
            ]
        ),
        
        // Сетап #2: "Защитный"
        BoardSetup(
            id: 2,
            legions: [
                // Большой легион (5 клеток) - вертикально в центре
                Legion(type: .large, positions: Set([
                    Position(x: 5, y: 3),
                    Position(x: 5, y: 4),
                    Position(x: 5, y: 5),
                    Position(x: 5, y: 6),
                    Position(x: 5, y: 7)
                ])),
                
                // Средний легион (4 клетки) - горизонтально внизу
                Legion(type: .medium, positions: Set([
                    Position(x: 1, y: 9),
                    Position(x: 2, y: 9),
                    Position(x: 3, y: 9),
                    Position(x: 4, y: 9)
                ])),
                
                // Малые легионы (3 клетки) - по углам
                Legion(type: .small, positions: Set([
                    Position(x: 1, y: 1),
                    Position(x: 2, y: 1),
                    Position(x: 3, y: 1)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 7, y: 1),
                    Position(x: 8, y: 1),
                    Position(x: 9, y: 1)
                ])),
                
                // Орлиные стаи (2 клетки) - по бокам
                Legion(type: .tiny, positions: Set([
                    Position(x: 1, y: 5),
                    Position(x: 2, y: 5)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 5),
                    Position(x: 9, y: 5)
                ]))
            ]
        )
    ]
}
