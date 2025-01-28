//
//  SwitchButtonView.swift
//  Isleta
//
//  Created by Alex on 28.01.2025.
//

import SwiftUI

struct SwitchButtonView: View {
    let isOn: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Image(.switchFrame)
                .resizable()
                .frame(width: 100, height: 50)
                .overlay(alignment: isOn ? .leading : .trailing) {
                    Image(.switchButton)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SwitchButtonView(isOn: true, action: {})
}
