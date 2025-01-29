//
//  AppViewModel.swift
//  Isleta
//
//  Created by Alex on 29.01.2025.
//

import Foundation

@MainActor
final class AppViewModel: ObservableObject {
    @Published private(set) var appState: States = .start
    
    let networkManager: any NetworkManaging
    private let stateMachine: AppStateMachine
    
    init(networkManager: any NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
        self.stateMachine = AppStateMachine()
    }
    
    func onAppear() {
        Task {
            await handleAppearance()
        }
    }
}

// MARK: - Private Methods
private extension AppViewModel {
    func handleAppearance() async {
        if networkManager.provenURL != nil {
            transition(to: .welcome)
            return
        }
        
        do {
            let hasValidURL = try await networkManager.checkURL()
            transition(to: hasValidURL ? .welcome : .coordinator)
        } catch {
            transition(to: .coordinator)
        }
    }
    
    func transition(to newState: States) {
        stateMachine.transition(to: newState) { [weak self] state in
            self?.appState = state
        }
    }
}

// MARK: - App State Machine
private final class AppStateMachine {
    private(set) var currentState: States = .start
    
    func transition(to newState: States, completion: @escaping (States) -> Void) {
        let validTransition = validateTransition(from: currentState, to: newState)
        guard validTransition else { return }
        
        currentState = newState
        completion(newState)
    }
    
    private func validateTransition(from currentState: States, to newState: States) -> Bool {
        switch (currentState, newState) {
        case (.start, _):
            return true
        case (.welcome, .coordinator):
            return true
        case (.coordinator, .welcome):
            return true
        default:
            return false
        }
    }
}
