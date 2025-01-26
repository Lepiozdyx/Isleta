//
//  PVPGameStartView.swift
//  Isleta
//
//  Created by Alex on 26.01.2025.
//

import SwiftUI

struct PVPGameStartView: View {
    var body: some View {
        ZStack {
            BackgoundView(name: .bg1, isBlur: false)
            
            HStack {
                Image(.p1Card)
                    .resizable()
                    .scaledToFit()
                
                Image(.p2Card)
                    .resizable()
                    .scaledToFit()
            }
            .padding()
            
            Image(.vs)
                .resizable()
                .frame(width: 100, height: 70)
        }
    }
}

#Preview {
    PVPGameStartView()
}
