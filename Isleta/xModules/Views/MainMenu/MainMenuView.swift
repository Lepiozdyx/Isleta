//
//  MainMenuView.swift
//  Isleta
//
//  Created by Alex on 23.01.2025.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            BackgoundView(name: .bg)
            
            VStack {
                HStack {
                    Button {
                        coordinator.showRules()
                    } label: {
                        Image(.rules)
                            .resizable()
                            .frame(width: 120, height: 120)
                    }
                    .buttonStyle(.borderless)
                    
                    Spacer()
                    
                    Button {
                        coordinator.showSettings()
                    } label: {
                        Image(.settings)
                            .resizable()
                            .frame(width: 120, height: 120)
                    }
                    .buttonStyle(.borderless)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        coordinator.startGame(mode: .pvp)
                    } label: {
                        Image(.pvp)
                            .resizable()
                            .frame(width: 170, height: 120)
                    }
                    .buttonStyle(.borderless)
                    
                    Spacer()
                    
                    Button {
                        coordinator.startGame(mode: .ai)
                    } label: {
                        Image(.pve)
                            .resizable()
                            .frame(width: 130, height: 120)
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
