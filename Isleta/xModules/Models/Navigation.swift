//
//  Navigation.swift
//  Isleta
//
//  Created by Alex on 25.01.2025.
//

import Foundation

enum Screen: Equatable {
    case menu
    case game(GameMode)
    case rules
    case settings
}

enum GameMode: Equatable {
    case pvp
    case ai
}
