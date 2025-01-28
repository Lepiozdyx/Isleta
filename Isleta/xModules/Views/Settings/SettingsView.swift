//
//  SettingsView.swift
//  Isleta
//
//  Created by Alex on 28.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            BackgoundView(name: .bg3, isBlur: true)
            
            BackButtonView { coordinator.navigateToMenu() }
                .padding()
            
            Image(.bigUnderlay)
                .resizable()
                .frame(width: 300, height: 300)
                .overlay(alignment: .top) {
                    Image(.settingsFrame)
                        .resizable()
                        .frame(width: 150, height: 70)
                        .offset(x: 0, y: -35)
                }
            
            VStack(spacing: 25) {
                HStack(alignment: .bottom, spacing: 50) {
                    Image(.music)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack {
                        Text("ON    OFF")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.purple)
                            .shadow(color: .yellow, radius: 1, x: 1, y: 1)
                        
                        SwitchButtonView(isOn: viewModel.isMusicEnabled) {
                            viewModel.toggleMusic()
                        }
                    }
                }
                
                HStack(spacing: 50) {
                    Image(.vibro)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    SwitchButtonView(isOn: viewModel.isVibrationEnabled) {
                        viewModel.toggleVibration()
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(AppCoordinator())
}
