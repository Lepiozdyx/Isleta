//
//  PVPGameStartView.swift
//  Isleta
//
//  Created by Alex on 26.01.2025.
//

import SwiftUI

struct PVPGameStartView: View {
    @EnvironmentObject var gameSession: GameSessionViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(name: .bg1, isBlur: false)
            
            HStack {
                Image(.p1Card)
                    .resizable()
                    .scaledToFit()
                
                Image(gameSession.isAIGame ? .pve : .p2Card)
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .bottom) {
                        if gameSession.isAIGame {
                            Text("AI")
                                .font(.system(size: 36, weight: .heavy, design: .rounded))
                                .foregroundStyle(.yellow)
                                .shadow(color: .purple, radius: 1)
                                .offset(x: 0, y: 20)
                        }
                    }
            }
            .padding()
            
            Image(.vs)
                .resizable()
                .frame(width: 100, height: 70)
        }
    }
}

#Preview("PvP Mode") {
    PVPGameStartView()
        .environmentObject(GameSessionViewModel(isAIGame: false))
}

#Preview("AI Mode") {
    PVPGameStartView()
        .environmentObject(GameSessionViewModel(isAIGame: true))
}
