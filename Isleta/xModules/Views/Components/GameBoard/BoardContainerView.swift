//
//  BoardContainerView.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import SwiftUI

struct BoardContainerView: View {
    let title: String
    let isActive: Bool
    let boardSetup: BoardSetup?
    let hits: Set<Position>
    let misses: Set<Position>
    let mode: GameBoardCell.DisplayMode
    var onCellTap: ((Position) -> Void)?
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(isActive ? .yellow : .white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isActive ? .yellow.opacity(0.2) : .gray.opacity(0.5))
                )
            
            GameBoardView(
                isActive: isActive,
                boardSetup: boardSetup,
                hits: hits,
                misses: misses,
                mode: mode,
                onCellTap: onCellTap
            )
        }
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        BackgoundView(name: .bg2, isBlur: true)
        
        VStack {
            BoardContainerView(
                title: "Your Fleet",
                isActive: true,
                boardSetup: PresetBoardSetups.setups[0],
                hits: [Position(x: 1, y: 1)],
                misses: [Position(x: 0, y: 0)],
                mode: .battle
            )
            
            BoardContainerView(
                title: "Enemy Fleet",
                isActive: false,
                boardSetup: nil,
                hits: [Position(x: 2, y: 2)],
                misses: [Position(x: 3, y: 3)],
                mode: .battle
            )
        }
    }
}
