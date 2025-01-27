//
//  AppCoordinator.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import Foundation

@MainActor
final class AppCoordinator: ObservableObject {
    @Published private(set) var currentScreen: Screen = .menu
    @Published private(set) var gameSession: GameSessionViewModel?
    
    func start() {
        navigateToMenu()
    }
    
    func navigateToMenu() {
        gameSession = nil
        currentScreen = .menu
    }
    
    func startGame(mode: GameMode) {
        gameSession = GameSessionViewModel(isAIGame: mode == .ai)
        currentScreen = .game(mode)
    }
    
    func showRules() {
        currentScreen = .rules
    }
    
    func showSettings() {
        currentScreen = .settings
    }
}
