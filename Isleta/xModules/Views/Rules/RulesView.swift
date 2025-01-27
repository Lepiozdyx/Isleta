//
//  RulesView.swift
//  Isleta
//
//  Created by Alex on 27.01.2025.
//

import SwiftUI

struct RulesView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            BackgoundView(name: .bg3, isBlur: true)
            
            BackButtonView { coordinator.navigateToMenu() }
                .padding()
            
            Image(.bigUnderlay)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    ScrollView(.vertical) {
                        VStack(spacing: 30) {
                            Image(.underlay)
                                .resizable()
                                .frame(width: 150, height: 40)
                                .overlay {
                                    Text("RULES")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundStyle(.purple)
                                        .shadow(color: .yellow, radius: 1, x: 1, y: 1)
                                }
                            
                            Text("In ''Isleta Games'', two players take turns placing their eagle legions on hidden grids and attempt to destroy their opponent's legions by attacking squares on their grid. Each turn, a player chooses a coordinate to attack to hit the opponent's legions. The one who first destroys all the enemy legions using strategy wins.")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.yellow)
                                .shadow(color: .black, radius: 1, x: 1, y: 1)
                            
                            VStack {
                                Image(.pvp)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                
                                Text("By pressing this button in the menu, you will start the game mode against the second player.")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(.yellow)
                                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                            }
                            
                            VStack {
                                Image(.pve)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120)
                                
                                Text("By pressing this button in the menu, you will start the game mode against the Ai. Great for times when you don't have a friend nearby to play together")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(.yellow)
                                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                }
                .padding(.top, 80)
                .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    RulesView()
        .environmentObject(AppCoordinator())
}
