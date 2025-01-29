//
//  MainMenuView.swift
//  Isleta
//
//  Created by Alex on 23.01.2025.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    private let hapticManager = HapticManager.shared
    
    var body: some View {
        ZStack {
            BackgroundView(name: .bg, isBlur: true)
            
            VStack {
                HStack {
                    Button {
                        hapticManager.playMenuFeedback()
                        coordinator.showRules()
                    } label: {
                        Image(.rules)
                            .resizable()
                            .frame(width: 110, height: 110)
                    }
                    .buttonStyle(.borderless)
                    
                    Spacer()
                    
                    Button {
                        hapticManager.playMenuFeedback()
                        coordinator.showSettings()
                    } label: {
                        Image(.settings)
                            .resizable()
                            .frame(width: 110, height: 110)
                    }
                    .buttonStyle(.borderless)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        hapticManager.playMenuFeedback()
                        coordinator.startGame(mode: .pvp)
                    } label: {
                        Image(.pvp)
                            .resizable()
                            .frame(width: 170, height: 120)
                    }
                    .buttonStyle(.borderless)
                    
                    Spacer()
                    
                    Button {
                        hapticManager.playMenuFeedback()
                        coordinator.startGame(mode: .ai)
                    } label: {
                        Image(.pve)
                            .resizable()
                            .frame(width: 130, height: 110)
                    }
                    .buttonStyle(.borderless)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    MainMenuView()
        .environmentObject(AppCoordinator())
}
