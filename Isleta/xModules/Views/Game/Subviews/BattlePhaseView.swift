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
    
    private var currentPlayer: Player {
        if case .battle(let playerId) = gameSession.gameState {
            return playerId == gameSession.player1.id ? gameSession.player1 : gameSession.player2
        }
        return gameSession.player1 // default return для случаев когда не battle фаза
    }
    
    private var opponentPlayer: Player {
        currentPlayer.id == gameSession.player1.id ? gameSession.player2 : gameSession.player1
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
            Text("Pass the device to \(opponentPlayer.name)")
        }
    }
    
    private var boardsContainer: some View {
        Group {
            // Поле текущего игрока
            BoardContainerView(
                title: "Your Fleet",
                isActive: false,
                boardSetup: nil,
                hits: opponentPlayer.hits,
                misses: opponentPlayer.misses,
                mode: .battle
            )
            
            // Поле противника
            BoardContainerView(
                title: "Enemy Fleet",
                isActive: true,
                boardSetup: nil,
                hits: currentPlayer.hits,
                misses: currentPlayer.misses,
                mode: .battle
            ) { position in
                if gameSession.attack(at: position) {
                    showingPassDeviceAlert = true
                }
            }
        }
    }
}

#Preview {
    BattlePhaseView()
        .environmentObject(GameSessionViewModel())
}
