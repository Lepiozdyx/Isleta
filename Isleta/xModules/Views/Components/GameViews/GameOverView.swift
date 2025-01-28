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
    
    private let hapticManager = HapticManager.shared
    
    var body: some View {
        ZStack {
            BackgoundView(name: .bg2, isBlur: true)
            
            Image(.bigUnderlay)
                .resizable()
                .frame(width: 250, height: 250)
                .overlay(alignment: .bottom) {
                    VStack(spacing: 30) {
                        Text("\(winner.name) Wins!")
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundStyle(.purple)
                            .shadow(color: .yellow, radius: 2, x: 1, y: 1)
                            
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
        .onAppear {
            hapticManager.playGameOverFeedback()
        }
    }
}

#Preview {
    GameOverView(winner: Player(id: UUID(), name: "Player 1"))
        .environmentObject(AppCoordinator())
        .environmentObject(GameSessionViewModel())
}
