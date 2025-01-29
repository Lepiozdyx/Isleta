//
//  GameOverView.swift
//  Isleta
//
//  Created by Alex on 26.01.2025.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var gameSession: GameSessionViewModel
    let winner: Player
    
    private var isAIWin: Bool {
        gameSession.isAIGame && winner.name == "AI"
    }
    
    private let hapticManager = HapticManager.shared
    
    var body: some View {
        ZStack {
            BackgroundView(name: .bg2, isBlur: true)
            
            Image(.bigUnderlay)
                .resizable()
                .frame(width: 250, height: 260)
                .overlay(alignment: .bottom) {
                    VStack(spacing: 10) {
                        VStack(spacing: 4) {
                            Text("\(winner.name) Wins!")
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .foregroundStyle(.purple)
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .yellow, radius: 2)
                            
                            HStack(alignment: .bottom, spacing: 2) {
                                Image(.star)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                                Image(.star)
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                
                                Image(.star)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                        }
                            
                        HStack(spacing: 40) {
                            Button {
                                hapticManager.playMenuFeedback()
                                gameSession.restart()
                            } label: {
                                VStack {
                                    Image(.quadButton)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .overlay {
                                            Image(.restart)
                                                .resizable()
                                                .scaledToFit()
                                                .padding(10)
                                        }
                                }
                            }
                            
                            Button {
                                hapticManager.playMenuFeedback()
                                coordinator.navigateToMenu()
                            } label: {
                                VStack {
                                    Image(.quadButton)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .overlay {
                                            Image(.home)
                                                .resizable()
                                                .scaledToFit()
                                                .padding(10)
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .overlay(alignment: .top) {
                    if isAIWin {
                        Image(.tryAgainBanner)
                            .resizable()
                            .frame(width: 120, height: 70)
                            .overlay(alignment: .bottom) {
                                Image(.sad)
                                    .resizable()
                                    .frame(width: 75, height: 70)
                                    .offset(x: 0, y: 50)
                            }
                            .offset(x: 0, y: -40)
                    } else {
                        Image(.win)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .overlay(alignment: .bottom) {
                                Image(.congratulation)
                                    .resizable()
                                    .frame(width: 220, height: 120)
                                    .offset(x: 0, y: 20)
                            }
                            .offset(x: 0, y: -60)
                    }
                }
        }
        .onAppear {
            hapticManager.playGameOverFeedback()
        }
    }
}

#Preview("Player vs Player") {
    GameOverView(winner: Player(id: UUID(), name: "Player 1"))
        .environmentObject(AppCoordinator())
        .environmentObject(GameSessionViewModel(isAIGame: false))
}

#Preview("AI Wins") {
    GameOverView(winner: Player(id: UUID(), name: "AI"))
        .environmentObject(AppCoordinator())
        .environmentObject(GameSessionViewModel(isAIGame: true))
}
