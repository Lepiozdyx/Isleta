//
//  AIBattlePhaseView.swift
//  Isleta
//
//  Created by Alex on 27.01.2025.
//

import SwiftUI

struct AIBattlePhaseView: View {
    @EnvironmentObject var gameSession: GameSessionViewModel
    let onExit: () -> ()
    
    private var currentPlayerId: UUID {
        if case .battle(let playerId) = gameSession.gameState {
            return playerId
        }
        return gameSession.player1.id
    }
    
    private var currentPlayer: Player {
        currentPlayerId == gameSession.player1.id ? gameSession.player1 : gameSession.player2
    }
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            ZStack {
                BackgroundView(name: .bg2, isBlur: true)
                
                BackButtonView { onExit() }
                    .padding()
                
                VStack {
                    Text(currentPlayerId == gameSession.player1.id ? "Your Turn" : "AI's Turn")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.yellow)
                        .shadow(color: .purple, radius: 1, x: 1, y: 1)
                        .padding(.top)
                    
                    if isLandscape {
                        HStack {
                            boardsContainer
                        }
                    } else {
                        VStack {
                            boardsContainer
                        }
                    }
                }
            }
        }
    }
    
    private var boardsContainer: some View {
        Group {
            // Player's board (always on left/top)
            BoardContainerView(
                title: "Your Fleet",
                isActive: currentPlayerId == gameSession.player2.id,
                boardSetup: gameSession.player1.boardSetup,
                hits: gameSession.player2.hits,
                misses: gameSession.player2.misses,
                mode: .battle
            )
            .scaleEffect(currentPlayerId == gameSession.player2.id ? 1.05 : 0.95)
            .animation(.spring(response: 0.3), value: currentPlayerId)
            
            // AI's board (always on right/bottom)
            BoardContainerView(
                title: "AI's Fleet",
                isActive: currentPlayerId == gameSession.player1.id,
                boardSetup: gameSession.player2.boardSetup,
                hits: gameSession.player1.hits,
                misses: gameSession.player1.misses,
                mode: .battle,
                onCellTap: currentPlayerId == gameSession.player1.id ? { position in
                    _ = gameSession.attack(at: position)
                } : nil
            )
            .scaleEffect(currentPlayerId == gameSession.player1.id ? 1.05 : 0.95)
            .animation(.spring(response: 0.3), value: currentPlayerId)
        }
    }
}

#Preview {
    AIBattlePhaseView(onExit: {})
        .environmentObject(GameSessionViewModel(isAIGame: true))
}
