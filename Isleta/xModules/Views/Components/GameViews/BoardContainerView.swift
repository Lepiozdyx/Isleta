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
        VStack(spacing: 0) {
            Image(.underlay)
                .resizable()
                .frame(width: 200, height: 50)
                .overlay(alignment: .leading) {
                    Image(.player1)
                        .resizable()
                        .scaledToFit()
                        .offset(x: -40, y: 0)
                }
                .overlay {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                }
            
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
                title: "Player 1's Fleet",
                isActive: true,
                boardSetup: PresetBoardSetups.setups[0],
                hits: [Position(x: 1, y: 1)],
                misses: [Position(x: 0, y: 0)],
                mode: .battle
            )
            
            BoardContainerView(
                title: "Player 2's Fleet",
                isActive: false,
                boardSetup: nil,
                hits: [Position(x: 2, y: 2)],
                misses: [Position(x: 3, y: 3)],
                mode: .battle
            )
        }
    }
}
