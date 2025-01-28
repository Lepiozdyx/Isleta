//
//  CoordinatorView.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        Group {
            switch coordinator.currentScreen {
            case .menu:
                MainMenuView()
                    .environmentObject(coordinator)
                
            case .game(let mode):
                if let gameSession = coordinator.gameSession {
                    switch mode {
                    case .pvp:
                        PVPGameView()
                            .environmentObject(coordinator)
                            .environmentObject(gameSession)
                    case .ai:
                        AIGameView()
                            .environmentObject(coordinator)
                            .environmentObject(gameSession)
                    }
                }
                
            case .rules:
                RulesView()
                    .environmentObject(coordinator)
                
            case .settings:
                SettingsView()
                    .environmentObject(coordinator)
            }
        }
        .onAppear {
            AudioManager.shared.playBackgroundMusic()
        }
    }
}

#Preview {
    CoordinatorView()
}
