//
//  AudioManager.swift
//  Isleta
//
//  Created by Alex on 28.01.2025.
//

import AVFoundation
//import Foundation

final class AudioManager {
    static let shared = AudioManager()
    
    private var audioPlayer: AVAudioPlayer?
    private let storageManager = StorageManager.shared
    
    private init() {
        setupAudioSession()
        prepareBackgroundMusic()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to setup audio session:", error)
        }
    }
    
    private func prepareBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else {
            print("Background music file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
        } catch {
            print("Failed to create audio player:", error)
        }
    }
    
    func playBackgroundMusic() {
        guard storageManager.isMusicEnabled else { return }
        audioPlayer?.play()
    }
    
    func stopBackgroundMusic() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
    
    func toggleBackgroundMusic() {
        if audioPlayer?.isPlaying == true {
            stopBackgroundMusic()
            storageManager.isMusicEnabled = false
        } else {
            storageManager.isMusicEnabled = true
            playBackgroundMusic()
        }
    }
    
    var isMusicEnabled: Bool {
        storageManager.isMusicEnabled
    }
}
