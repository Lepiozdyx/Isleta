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
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func onAppear() {
        Task {
            if networkManager.provenURL != nil {
                appState = .welcome
                return
            }
            
            do {
                if try await networkManager.checkURL() {
                    appState = .welcome
                }
                else {
                    appState = .coordinator
                }
            }
            catch {
                appState = .coordinator
            }
        }
    }
}
