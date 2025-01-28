//
//  GameBoardCell.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import SwiftUI

struct GameBoardCell: View {
    enum DisplayMode {
        case setup
        case battle
    }
    
    let position: Position
    let state: CellState
    let mode: DisplayMode
    let isHit: Bool
    let isMiss: Bool
    var onTap: (() -> Void)?
    
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0
    @State private var showLightning = false
    
    private let hapticManager = HapticManager.shared
    
    var body: some View {
        Button {
            if mode == .battle {
                hapticManager.playAttackFeedback()
                
                withAnimation(.easeInOut(duration: 0.2)) {
                    showLightning = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showLightning = false
                    }
                }
            }
            onTap?()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundStyle(.yellow.opacity(0.1))
                    .border(.yellow, width: 2)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                
                if case .legion(let type) = state, mode == .setup {
                    Image(type.image)
                        .resizable()
                        .scaledToFit()
                        .padding(4)
                }
                
                if isHit {
                    Image(.star)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .padding(4)
                }
                
                if isMiss {
                    Image(.dot)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .padding(6)
                }
                
                if showLightning {
                    Image(.bolt)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .transition(.opacity)
                }
            }
            .scaleEffect(scale)
            .animation(.spring(response: 0.3), value: scale)
            .onChange(of: isHit || isMiss) { newValue in
                if newValue {
                    withAnimation(.easeInOut(duration: 0.3).repeatCount(1)) {
                        isAnimating = true
                    }
                    withAnimation(.spring(response: 0.3)) {
                        scale = 1.1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            isAnimating = false
                            scale = 1.0
                        }
                    }
                }
            }
        }
        .buttonStyle(.borderless)
        .disabled(isHit || isMiss)
    }
}

#Preview {
    ZStack {
        BackgoundView(name: .bg2, isBlur: true)
        
        VStack {
            Text("Setup Mode")
                .foregroundStyle(.yellow)
            
            HStack {
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .empty,
                    mode: .setup,
                    isHit: false,
                    isMiss: false
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .legion(.large),
                    mode: .setup,
                    isHit: false,
                    isMiss: false
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .legion(.medium),
                    mode: .setup,
                    isHit: false,
                    isMiss: false
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .legion(.small),
                    mode: .setup,
                    isHit: false,
                    isMiss: false
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .legion(.tiny),
                    mode: .setup,
                    isHit: false,
                    isMiss: false
                )
            }
            .frame(height: 60)
            
            // Battle mode
            HStack {
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .empty,
                    mode: .battle,
                    isHit: false,
                    isMiss: false
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .empty,
                    mode: .setup,
                    isHit: false,
                    isMiss: false
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .legion(.large),
                    mode: .battle,
                    isHit: true,
                    isMiss: false
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .empty,
                    mode: .battle,
                    isHit: false,
                    isMiss: true
                )
                
                GameBoardCell(
                    position: Position(x: 0, y: 0),
                    state: .empty,
                    mode: .setup,
                    isHit: false,
                    isMiss: false
                )
            }
            .frame(height: 60)
        }
        .padding()
    }
}
