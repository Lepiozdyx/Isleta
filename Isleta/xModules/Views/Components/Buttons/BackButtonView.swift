//
//  BackButtonView.swift
//  Isleta
//
//  Created by Alex on 27.01.2025.
//

import SwiftUI

struct BackButtonView: View {
    let action: () -> ()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    action()
                } label: {
                    Image(.backButton)
                        .resizable()
                        .frame(width: 50, height: 50)
                }

                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    BackButtonView(action: {})
}
