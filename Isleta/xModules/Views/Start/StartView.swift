//
//  StartView.swift
//  Isleta
//
//  Created by Alex on 29.01.2025.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            BackgroundView(name: .bg2, isBlur: false)
            
            VStack {
                Image(.eagle)
                    .resizable()
                    .frame(width: 300, height: 200)
                
                Image(.loading)
                    .resizable()
                    .frame(width: 250, height: 40)
            }
        }
    }
}

#Preview {
    StartView()
}
