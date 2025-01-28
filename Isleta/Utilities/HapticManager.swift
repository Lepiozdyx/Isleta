//
//  HapticManager.swift
//  Isleta
//
//  Created by Alex on 28.01.2025.
//

import UIKit

final class HapticManager {
    static let shared = HapticManager()
    
    private let lightGenerator = UIImpactFeedbackGenerator(style: .light)
    private let mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let notificationGenerator = UINotificationFeedbackGenerator()
    
    private let storageManager = StorageManager.shared
    
    private init() {
        lightGenerator.prepare()
        mediumGenerator.prepare()
        notificationGenerator.prepare()
    }
    
    func playMenuFeedback() {
        guard storageManager.isVibrationEnabled else { return }
        lightGenerator.impactOccurred()
    }
    
    func playAttackFeedback() {
        guard storageManager.isVibrationEnabled else { return }
        mediumGenerator.impactOccurred()
    }
    
    func playGameOverFeedback() {
        guard storageManager.isVibrationEnabled else { return }
        notificationGenerator.notificationOccurred(.success)
    }
}
