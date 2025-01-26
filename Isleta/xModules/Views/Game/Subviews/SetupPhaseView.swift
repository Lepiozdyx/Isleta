//
//  SetupPhaseView.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import SwiftUI

struct SetupPhaseView: View {
    @EnvironmentObject var gameSession: GameSessionViewModel
    @State private var showingPassDeviceAlert = false
    
    private var currentPlayer: Player {
        if case .setup(let playerId) = gameSession.gameState {
            return playerId == gameSession.player1.id ? gameSession.player1 : gameSession.player2
        }
        return gameSession.player1
    }
    
    private var playerName: String {
        currentPlayer.id == gameSession.player1.id ? "Player 1" : "Player 2"
    }
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            ZStack {
                BackgoundView(name: .bg3, isBlur: true)
                
                if isLandscape {
                    HStack {
                        boardPreview
                        setupControls
                    }
                } else {
                    VStack {
                        boardPreview
                        setupControls
                    }
                }
            }
        }
        .alert("\(playerName)'s Turn", isPresented: $showingPassDeviceAlert) {
            Button("OK") {
                showingPassDeviceAlert = false
            }
        } message: {
            Text("Pass the device to \(playerName)")
        }
    }
    
    private var boardPreview: some View {
        VStack(spacing: 0) {
            Text("\(playerName), place your fleet")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.yellow)
                .shadow(color: .purple, radius: 1, x: 1, y: 1)
            
            GameBoardView(
                isActive: true,
                boardSetup: gameSession.currentSetup,
                hits: [],
                misses: [],
                mode: .setup
            )
        }
        .padding()
    }
    
    private var setupControls: some View {
        HStack {
            legionsSetup
            .opacity(gameSession.currentSetup == nil ? 1 : 0.5)
            
            Spacer()
            
            VStack(spacing: 20) {
                VStack {
                    Button {
                        gameSession.nextSetup()
                    } label: {
                        Image(.switch)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    
                    Text("Generate")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.yellow)
                        .shadow(color: .purple, radius: 1, x: 1, y: 1)
                }
                
                Button {
                    // Сначала меняем состояние
                    gameSession.confirmCurrentSetup()
                    // Проверяем, всё ещё ли мы в фазе setup
                    if case .setup = gameSession.gameState {
                        showingPassDeviceAlert = true
                    }
                } label: {
                    Image(.quadButton)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .overlay {
                            Image(systemName: "checkmark")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundStyle(.green)
                        }
                }
                .opacity(gameSession.currentSetup == nil ? 0.5 : 1)
                .disabled(gameSession.currentSetup == nil)
            }
        }
        .padding()
    }
    
    private var legionsSetup: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(0..<5) { _ in
                    Image(.large)
                        .resizable()
                        .frame(width: 30, height: 50)
                }
            }
            
            HStack {
                ForEach(0..<4) { _ in
                    Image(.medium)
                        .resizable()
                        .frame(width: 30, height: 45)
                }
            }
            
            HStack {
                ForEach(0..<3) { _ in
                    Image(.small)
                        .resizable()
                        .frame(width: 25, height: 45)
                }
                Text("x2")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.yellow)
                    .shadow(color: .purple, radius: 1, x: 1, y: 1)
            }
            
            HStack {
                ForEach(0..<2) { _ in
                    Image(.tiny)
                        .resizable()
                        .frame(width: 30, height: 45)
                }
                Text("x2")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.yellow)
                    .shadow(color: .purple, radius: 1, x: 1, y: 1)
            }
        }
    }
}

#Preview {
    SetupPhaseView()
        .environmentObject(GameSessionViewModel())
}
