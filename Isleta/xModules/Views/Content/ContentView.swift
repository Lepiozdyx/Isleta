//
//  ContentView.swift
//  Isleta
//
//  Created by Alex on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AppViewModel()
    
    var body: some View {
        Group {
            switch viewModel.appState {
            case .start:
                StartView()
            case .welcome:
                if let url = viewModel.networkManager.provenURL {
                    WebKitManager(
                        url: url,
                        networkManager: viewModel.networkManager
                    )
                }
                else {
                    WebKitManager(
                        url: NetworkManager.url,
                        networkManager: viewModel.networkManager
                    )
                }
            case .coordinator:
                CoordinatorView()
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    ContentView()
}
