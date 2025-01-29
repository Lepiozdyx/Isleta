//
//  BackgroundView.swift
//  Isleta
//
//  Created by Alex on 23.01.2025.
//

import SwiftUI

struct BackgroundView: View {
    let name: ImageResource
    var isBlur = false
    
    var body: some View {
        Image(name)
            .resizable()
            .ignoresSafeArea()
            .blur(radius: isBlur ? 5 : 0, opaque: true)
    }
}

#Preview {
    BackgroundView(name: .bg1)
}
