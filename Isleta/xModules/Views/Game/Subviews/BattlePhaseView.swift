//
//  BattlePhaseView.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import SwiftUI

struct BattlePhaseView: View {
    @EnvironmentObject var gameSession: GameSessionViewModel
    @State private var showingPassDeviceAlert = false
    
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
                BackgoundView(name: .bg2, isBlur: true)
                
                VStack {
                    Text("\(currentPlayer.name)'s Turn")
                        .font(.title.bold())
                        .foregroundStyle(.yellow)
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
        .alert("Switch Turn", isPresented: $showingPassDeviceAlert) {
            Button("OK") {
                showingPassDeviceAlert = false
            }
        } message: {
            Text("Pass the device to \(currentPlayerId == gameSession.player1.id ? gameSession.player2.name : gameSession.player1.name)")
        }
    }
    
    private var boardsContainer: some View {
        Group {
            // Player 1's board (always on left/top)
            BoardContainerView(
                title: "Player 1's Fleet",
                isActive: currentPlayerId == gameSession.player2.id,
                boardSetup: gameSession.player1.boardSetup,
                hits: gameSession.player2.hits,
                misses: gameSession.player2.misses,
                mode: .battle,
                onCellTap: currentPlayerId == gameSession.player2.id ? { position in
                    if gameSession.attack(at: position) {
                        showingPassDeviceAlert = true
                    }
                } : nil
            )
            
            // Player 2's board (always on right/bottom)
            BoardContainerView(
                title: "Player 2's Fleet",
                isActive: currentPlayerId == gameSession.player1.id,
                boardSetup: gameSession.player2.boardSetup,
                hits: gameSession.player1.hits,
                misses: gameSession.player1.misses,
                mode: .battle,
                onCellTap: currentPlayerId == gameSession.player1.id ? { position in
                    if gameSession.attack(at: position) {
                        showingPassDeviceAlert = true
                    }
                } : nil
            )
        }
    }
}

#Preview {
    BattlePhaseView()
        .environmentObject(GameSessionViewModel())
}
