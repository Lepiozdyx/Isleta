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
                        // TODO: Implement AIGameView
                        Text("AI Game View")
                            .environmentObject(coordinator)
                            .environmentObject(gameSession)
                    }
                }
                
            case .rules:
                // TODO: Implement RulesView
                Text("Rules View")
                    .environmentObject(coordinator)
                
            case .settings:
                // TODO: Implement SettingsView
                Text("Settings View")
                    .environmentObject(coordinator)
            }
        }
    }
}

#Preview {
    CoordinatorView()
}
