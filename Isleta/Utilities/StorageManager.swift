//
//  StorageManager.swift
//  Isleta
//
//  Created by Alex on 28.01.2025.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    
    private enum Keys: String {
        case isMusicEnabled
        case isVibrationEnabled
    }
    
    private init() {
        if defaults.object(forKey: Keys.isMusicEnabled.rawValue) == nil {
            defaults.set(true, forKey: Keys.isMusicEnabled.rawValue)
        }
        if defaults.object(forKey: Keys.isVibrationEnabled.rawValue) == nil {
            defaults.set(true, forKey: Keys.isVibrationEnabled.rawValue)
        }
    }
    
    var isMusicEnabled: Bool {
        get {
            defaults.bool(forKey: Keys.isMusicEnabled.rawValue)
        }
        set {
            defaults.set(newValue, forKey: Keys.isMusicEnabled.rawValue)
        }
    }
    
    var isVibrationEnabled: Bool {
        get {
            defaults.bool(forKey: Keys.isVibrationEnabled.rawValue)
        }
        set {
            defaults.set(newValue, forKey: Keys.isVibrationEnabled.rawValue)
        }
    }
}
