//
//  Game.swift
//  Isleta
//
//  Created by Alex on 24.01.2025.
//

import Foundation

// Models/Position.swift
struct Position: Hashable {
    let x: Int
    let y: Int
}

// Models/CellState.swift
enum CellState: Equatable {
    case empty
    case legion(LegionType)
    case hit
    case miss
}

// Models/LegionType.swift
enum LegionType: Int, CaseIterable {
    case large = 5
    case medium = 4
    case small = 3
    case tiny = 2
    
    var count: Int {
        switch self {
        case .large, .medium: return 1
        case .small, .tiny: return 2
        }
    }
    
    var image: ImageResource {
        switch self {
        case .large: return .large
        case .medium: return .medium
        case .small: return .small
        case .tiny: return .tiny
        }
    }
}

// Models/Legion.swift
struct Legion {
    let type: LegionType
    var positions: Set<Position>
    var isDestroyed: Bool {
        positions.isEmpty
    }
}

// Models/BoardSetup.swift
struct BoardSetup: Identifiable {
    let id: Int
    let legions: [Legion]
    var isAvailable: Bool = true
}

// Models/Player.swift
struct Player: Identifiable {
    let id: UUID
    let name: String
    var boardSetup: BoardSetup?
    var hits: Set<Position> = []
    var misses: Set<Position> = []
}
