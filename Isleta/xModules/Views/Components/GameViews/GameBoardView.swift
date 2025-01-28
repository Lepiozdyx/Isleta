//
//  GameBoardView.swift
//  Isleta
//
//  Created by Alex on 23.01.2025.
//

import SwiftUI

struct GameBoardView: View {
    let isActive: Bool
    let boardSetup: BoardSetup?
    let hits: Set<Position>
    let misses: Set<Position>
    let mode: GameBoardCell.DisplayMode
    var onCellTap: ((Position) -> Void)?
    
    private let rows = 10
    private let columns = 10
    
    private func stateForPosition(_ position: Position) -> CellState {
        if let setup = boardSetup,
           let legion = setup.legions.first(where: { $0.positions.contains(position) }) {
            return .legion(legion.type)
        }
        return .empty
    }
    
    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width
            let availableHeight = geometry.size.height
            let boardSize = min(availableWidth, availableHeight) * 0.9
            let cellSize = boardSize / CGFloat(max(rows, columns))
            
            VStack {
                Spacer()
                
                LazyVGrid(
                    columns: Array(repeating: GridItem(.fixed(cellSize), spacing: 2), count: columns),
                    spacing: 2
                ) {
                    ForEach(0..<rows, id: \.self) { row in
                        ForEach(0..<columns, id: \.self) { column in
                            let position = Position(x: column, y: row)
                            
                            GameBoardCell(
                                position: position,
                                state: stateForPosition(position),
                                mode: mode,
                                isHit: hits.contains(position),
                                isMiss: misses.contains(position)
                            ) {
                                if isActive || mode == .setup {
                                    onCellTap?(position)
                                }
                            }
                            .frame(width: cellSize, height: cellSize)
                        }
                    }
                }
                .frame(width: boardSize + cellSize, height: boardSize)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        BackgoundView(name: .bg2, isBlur: true)
        
        GameBoardView(
            isActive: true,
            boardSetup: PresetBoardSetups.setups[0],
            hits: [Position(x: 1, y: 1)],
            misses: [Position(x: 0, y: 0)],
            mode: .battle
        )
    }
}
