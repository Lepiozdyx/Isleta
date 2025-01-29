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
        content
            .onAppear {
                viewModel.onAppear()
            }
    }
}

// MARK: - View Components
private extension ContentView {
    @ViewBuilder
    var content: some View {
        switch viewModel.appState {
        case .start:
            LoadingView()
                .transition(.opacity)
        case .welcome:
            welcomeView
                .transition(.opacity)
        case .coordinator:
            CoordinatorView()
                .transition(.opacity)
        }
    }
    
    @ViewBuilder
    var welcomeView: some View {
        if let url = viewModel.networkManager.provenURL {
            WebKitManager(
                url: url,
                networkManager: viewModel.networkManager
            )
        } else {
            WebKitManager(
                url: NetworkManager.targetURL,
                networkManager: viewModel.networkManager
            )
        }
    }
}

// MARK: - Loading View
private struct LoadingView: View {
    var body: some View {
        ZStack {
            BackgroundView(name: .bg2, isBlur: false)
            
            VStack(spacing: 20) {
                Image(.eagle)
                    .resizable()
                    .frame(width: 300, height: 200)
                    .transition(.scale)
                
                Image(.loading)
                    .resizable()
                    .frame(width: 250, height: 40)
                    .transition(.slide)
            }
            .animation(.easeInOut, value: true)
        }
    }
}

#Preview {
    ContentView()
}
