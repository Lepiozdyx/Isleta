//
//  SettingsViewModel.swift
//  Isleta
//
//  Created by Alex on 28.01.2025.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    @Published private(set) var isMusicEnabled: Bool
    @Published private(set) var isVibrationEnabled: Bool
    
    private let audioManager = AudioManager.shared
    private let storageManager = StorageManager.shared
    
    init() {
        self.isMusicEnabled = storageManager.isMusicEnabled
        self.isVibrationEnabled = storageManager.isVibrationEnabled
    }
    
    func toggleMusic() {
        audioManager.toggleBackgroundMusic()
        isMusicEnabled = storageManager.isMusicEnabled
    }
    
    func toggleVibration() {
        storageManager.isVibrationEnabled.toggle()
        isVibrationEnabled = storageManager.isVibrationEnabled
    }
}
