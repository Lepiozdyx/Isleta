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
    @State private var shouldShowBattle = false
    
    var body: some View {
        ZStack {
            switch gameSession.gameState {
            case .setup:
                SetupPhaseView { coordinator.navigateToMenu() }
                    .transition(.opacity)
                
            case .battle:
                if shouldShowBattle {
                    BattlePhaseView { coordinator.navigateToMenu() }
                        .transition(.opacity)
                } else {
                    PVPGameStartView()
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                withAnimation {
                                    shouldShowBattle = true
                                }
                            }
                        }
                }
                
            case .finished(let winnerId):
                let winner = winnerId == gameSession.player1.id ? gameSession.player1 : gameSession.player2
                GameOverView(winner: winner)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: gameSession.gameState)
        .onChange(of: gameSession.gameState) { newValue in
            if case .setup = newValue {
                shouldShowBattle = false
            }
        }
    }
}

#Preview {
    PVPGameView()
        .environmentObject(AppCoordinator())
        .environmentObject(GameSessionViewModel())
}
