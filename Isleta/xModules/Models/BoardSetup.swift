//
//  BoardSetup.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import Foundation

struct PresetBoardSetups {
    static let setups: [BoardSetup] = [
        // TODO: Delete tests setups
        // Тестовый сетап #1
        BoardSetup(
            id: 11,
            legions: [
                // Большой легион (5 клеток) горизонтально, начиная с 0:0
                Legion(type: .large, positions: Set([
                    Position(x: 0, y: 0),
                    Position(x: 1, y: 0),
                    Position(x: 2, y: 0),
                    Position(x: 3, y: 0),
                    Position(x: 4, y: 0)
                ])),
                // Средний легион (4 клетки) горизонтально в следующей строке
                Legion(type: .medium, positions: Set([
                    Position(x: 0, y: 1),
                    Position(x: 1, y: 1),
                    Position(x: 2, y: 1),
                    Position(x: 3, y: 1)
                ])),
                // Первый малый легион (3 клетки)
                Legion(type: .small, positions: Set([
                    Position(x: 0, y: 2),
                    Position(x: 1, y: 2),
                    Position(x: 2, y: 2)
                ])),
                // Второй малый легион (3 клетки)
                Legion(type: .small, positions: Set([
                    Position(x: 0, y: 3),
                    Position(x: 1, y: 3),
                    Position(x: 2, y: 3)
                ])),
                // Первая орлиная стая (2 клетки)
                Legion(type: .tiny, positions: Set([
                    Position(x: 0, y: 4),
                    Position(x: 1, y: 4)
                ])),
                // Вторая орлиная стая (2 клетки)
                Legion(type: .tiny, positions: Set([
                    Position(x: 0, y: 5),
                    Position(x: 1, y: 5)
                ]))
            ]
        ),
        
        // Тестовый сетап #2
        BoardSetup(
            id: 12,
            legions: [
                // Большой легион (5 клеток) горизонтально, заканчивая на 9:9
                Legion(type: .large, positions: Set([
                    Position(x: 5, y: 9),
                    Position(x: 6, y: 9),
                    Position(x: 7, y: 9),
                    Position(x: 8, y: 9),
                    Position(x: 9, y: 9)
                ])),
                // Средний легион (4 клетки) горизонтально
                Legion(type: .medium, positions: Set([
                    Position(x: 6, y: 8),
                    Position(x: 7, y: 8),
                    Position(x: 8, y: 8),
                    Position(x: 9, y: 8)
                ])),
                // Первый малый легион (3 клетки)
                Legion(type: .small, positions: Set([
                    Position(x: 7, y: 7),
                    Position(x: 8, y: 7),
                    Position(x: 9, y: 7)
                ])),
                // Второй малый легион (3 клетки)
                Legion(type: .small, positions: Set([
                    Position(x: 7, y: 6),
                    Position(x: 8, y: 6),
                    Position(x: 9, y: 6)
                ])),
                // Первая орлиная стая (2 клетки)
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 5),
                    Position(x: 9, y: 5)
                ])),
                // Вторая орлиная стая (2 клетки)
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 4),
                    Position(x: 9, y: 4)
                ]))
            ]
        ),
        
        // Сетап #1: "Классический"
        BoardSetup(
            id: 1,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 2, y: 1),
                    Position(x: 3, y: 1),
                    Position(x: 4, y: 1),
                    Position(x: 5, y: 1),
                    Position(x: 6, y: 1)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 1, y: 3),
                    Position(x: 1, y: 4),
                    Position(x: 1, y: 5),
                    Position(x: 1, y: 6)
                ])),
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
                Legion(type: .large, positions: Set([
                    Position(x: 5, y: 3),
                    Position(x: 5, y: 4),
                    Position(x: 5, y: 5),
                    Position(x: 5, y: 6),
                    Position(x: 5, y: 7)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 1, y: 9),
                    Position(x: 2, y: 9),
                    Position(x: 3, y: 9),
                    Position(x: 4, y: 9)
                ])),
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
                Legion(type: .tiny, positions: Set([
                    Position(x: 1, y: 5),
                    Position(x: 2, y: 5)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 5),
                    Position(x: 9, y: 5)
                ]))
            ]
        ),
        
        // Сетап #3: "Периметр"
        BoardSetup(
            id: 3,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 0, y: 0),
                    Position(x: 0, y: 1),
                    Position(x: 0, y: 2),
                    Position(x: 0, y: 3),
                    Position(x: 0, y: 4)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 9, y: 5),
                    Position(x: 9, y: 6),
                    Position(x: 9, y: 7),
                    Position(x: 9, y: 8)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 2, y: 9),
                    Position(x: 3, y: 9),
                    Position(x: 4, y: 9)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 6, y: 0),
                    Position(x: 7, y: 0),
                    Position(x: 8, y: 0)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 2, y: 6),
                    Position(x: 2, y: 7)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 5, y: 3),
                    Position(x: 5, y: 4)
                ]))
            ]
        ),
        
        // Сетап #4: "Решетка"
        BoardSetup(
            id: 4,
            legions: [
                // Большой легион горизонтально вверху
                Legion(type: .large, positions: Set([
                    Position(x: 2, y: 0),
                    Position(x: 3, y: 0),
                    Position(x: 4, y: 0),
                    Position(x: 5, y: 0),
                    Position(x: 6, y: 0)
                ])),
                // Средний легион вертикально справа
                Legion(type: .medium, positions: Set([
                    Position(x: 8, y: 3),
                    Position(x: 8, y: 4),
                    Position(x: 8, y: 5),
                    Position(x: 8, y: 6)
                ])),
                // Малые легионы горизонтально в центре
                Legion(type: .small, positions: Set([
                    Position(x: 1, y: 4),
                    Position(x: 2, y: 4),
                    Position(x: 3, y: 4)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 5, y: 4),
                    Position(x: 6, y: 4),
                    Position(x: 7, y: 4)
                ])),
                // Орлиные стаи вертикально слева
                Legion(type: .tiny, positions: Set([
                    Position(x: 0, y: 7),
                    Position(x: 0, y: 8)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 0, y: 2),
                    Position(x: 0, y: 3)
                ]))
            ]
        ),
        
        // Сетап #5: "Крепость"
        BoardSetup(
            id: 5,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 4, y: 4),
                    Position(x: 4, y: 5),
                    Position(x: 4, y: 6),
                    Position(x: 4, y: 7),
                    Position(x: 4, y: 8)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 5, y: 4),
                    Position(x: 6, y: 4),
                    Position(x: 7, y: 4),
                    Position(x: 8, y: 4)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 1, y: 1),
                    Position(x: 1, y: 2),
                    Position(x: 1, y: 3)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 8, y: 8),
                    Position(x: 8, y: 7),
                    Position(x: 8, y: 6)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 1, y: 8),
                    Position(x: 2, y: 8)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 1),
                    Position(x: 7, y: 1)
                ]))
            ]
        ),
        
        // Сетап #6: "Молот"
        BoardSetup(
            id: 6,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 4, y: 0),
                    Position(x: 4, y: 1),
                    Position(x: 4, y: 2),
                    Position(x: 4, y: 3),
                    Position(x: 4, y: 4)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 3, y: 4),
                    Position(x: 4, y: 4),
                    Position(x: 5, y: 4),
                    Position(x: 6, y: 4)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 0, y: 7),
                    Position(x: 1, y: 7),
                    Position(x: 2, y: 7)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 7, y: 7),
                    Position(x: 8, y: 7),
                    Position(x: 9, y: 7)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 2, y: 9),
                    Position(x: 3, y: 9)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 6, y: 9),
                    Position(x: 7, y: 9)
                ]))
            ]
        ),
        
        // Сетап #7: "Зигзаг"
        BoardSetup(
            id: 7,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 0, y: 0),
                    Position(x: 1, y: 0),
                    Position(x: 2, y: 0),
                    Position(x: 3, y: 0),
                    Position(x: 4, y: 0)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 4, y: 2),
                    Position(x: 5, y: 2),
                    Position(x: 6, y: 2),
                    Position(x: 7, y: 2)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 7, y: 4),
                    Position(x: 8, y: 4),
                    Position(x: 9, y: 4)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 2, y: 6),
                    Position(x: 3, y: 6),
                    Position(x: 4, y: 6)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 0, y: 8),
                    Position(x: 1, y: 8)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 8),
                    Position(x: 9, y: 8)
                ]))
            ]
        ),
        
        // Сетап #8: "Щит"
        BoardSetup(
            id: 8,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 2, y: 8),
                    Position(x: 3, y: 8),
                    Position(x: 4, y: 8),
                    Position(x: 5, y: 8),
                    Position(x: 6, y: 8)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 3, y: 6),
                    Position(x: 4, y: 6),
                    Position(x: 5, y: 6),
                    Position(x: 6, y: 6)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 4, y: 4),
                    Position(x: 5, y: 4),
                    Position(x: 6, y: 4)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 5, y: 2),
                    Position(x: 6, y: 2),
                    Position(x: 7, y: 2)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 0, y: 0),
                    Position(x: 1, y: 0)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 0),
                    Position(x: 9, y: 0)
                ]))
            ]
        ),
        
        // Сетап #9: "Крест"
        BoardSetup(
            id: 9,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 4, y: 2),
                    Position(x: 4, y: 3),
                    Position(x: 4, y: 4),
                    Position(x: 4, y: 5),
                    Position(x: 4, y: 6)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 2, y: 4),
                    Position(x: 3, y: 4),
                    Position(x: 5, y: 4),
                    Position(x: 6, y: 4)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 0, y: 0),
                    Position(x: 0, y: 1),
                    Position(x: 0, y: 2)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 8, y: 8),
                    Position(x: 8, y: 7),
                    Position(x: 8, y: 6)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 0, y: 8),
                    Position(x: 0, y: 7)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 8, y: 0),
                    Position(x: 8, y: 1)
                ]))
            ]
        ),
        
        // Сетап #10: "Бастион"
        BoardSetup(
            id: 10,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 1, y: 1),
                    Position(x: 2, y: 1),
                    Position(x: 3, y: 1),
                    Position(x: 4, y: 1),
                    Position(x: 5, y: 1)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 1, y: 3),
                    Position(x: 2, y: 3),
                    Position(x: 3, y: 3),
                    Position(x: 4, y: 3)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 1, y: 5),
                    Position(x: 2, y: 5),
                    Position(x: 3, y: 5)
                ])),
                Legion(type: .small, positions: Set([
                    Position(x: 7, y: 5),
                    Position(x: 8, y: 5),
                    Position(x: 9, y: 5)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 7, y: 8),
                    Position(x: 8, y: 8)
                ])),
                Legion(type: .tiny, positions: Set([
                    Position(x: 7, y: 2),
                    Position(x: 8, y: 2)
                ]))
            ]
        )
    ]
}
