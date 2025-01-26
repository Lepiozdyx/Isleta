//
//  PVPGameView.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import SwiftUI

struct PVPGameView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var gameSession: GameSessionViewModel
    
    var body: some View {
        ZStack {
            switch gameSession.gameState {
            case .setup:
                SetupPhaseView()
                    .transition(.opacity)
                
            case .battle:
                BattlePhaseView()
                    .transition(.opacity)
                
            case .finished(let winnerId):
                gameOverView(winnerId: winnerId)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: gameSession.gameState)
    }
    
    @ViewBuilder
    private func gameOverView(winnerId: UUID) -> some View {
        let winner = winnerId == gameSession.player1.id ? gameSession.player1 : gameSession.player2
        
        ZStack {
            BackgoundView(name: .bg1, isBlur: true)
            
            VStack(spacing: 30) {
                Text("Game Over!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.yellow)
                
                Text("\(winner.name) Wins!")
                    .font(.title)
                    .foregroundStyle(.yellow)
                
                Button {
                    coordinator.navigateToMenu()
                } label: {
                    Image(.quadButton)
                        .resizable()
                        .frame(width: 80, height: 80)
                }
            }
        }
    }
}

#Preview {
    PVPGameView()
        .environmentObject(AppCoordinator())
        .environmentObject(GameSessionViewModel())
}
