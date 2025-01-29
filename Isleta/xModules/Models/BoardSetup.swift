//
//  BoardSetup.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import Foundation

struct PresetBoardSetups {
    static let setups: [BoardSetup] = [
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
        BoardSetup(
            id: 4,
            legions: [
                Legion(type: .large, positions: Set([
                    Position(x: 2, y: 0),
                    Position(x: 3, y: 0),
                    Position(x: 4, y: 0),
                    Position(x: 5, y: 0),
                    Position(x: 6, y: 0)
                ])),
                Legion(type: .medium, positions: Set([
                    Position(x: 8, y: 3),
                    Position(x: 8, y: 4),
                    Position(x: 8, y: 5),
                    Position(x: 8, y: 6)
                ])),
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
