//
//  NetworkManager.swift
//  Isleta
//
//  Created by Alex on 29.01.2025.
//

import UIKit

final class NetworkManager: ObservableObject {
    @Published private(set) var provenURL: URL?
    
    static let url = URL(string: StringConstants.url)!
    
    private let storage: UserDefaults
    private var savedURL = false
    
    init(storage: UserDefaults = .standard) {
        self.storage = storage
        loadProvenURL()
    }
    
    func proveURL(_ url: URL) {
        if savedURL { return }
        guard !isBadURL(url) else { return }
        storage.set(url.absoluteString, forKey: StringConstants.saved_url)
        provenURL = url
        savedURL = true
    }
    
    func getUserAgent(forWebView: Bool = false) -> String {
        if forWebView {
            return "Mozilla/5.0 (iPhone; CPU iPhone OS \(UIDevice.current.systemVersion.replacingOccurrences(of: ".", with: "_")) like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1"
        } else {
            return "TestRequest/1.0 CFNetwork/1410.0.3 Darwin/22.4.0"
        }
    }
    
    func checkURL() async throws -> Bool {
        do {
            var request = URLRequest(url: Self.url)
            request.setValue(getUserAgent(forWebView: false), forHTTPHeaderField: "User-Agent")
            let (_, resp) = try await URLSession.shared.data(for: request)
            guard let httpResponse = resp as? HTTPURLResponse else { return false }
            guard (200...299).contains(httpResponse.statusCode) else { return false }
            guard let finalURL = httpResponse.url else { return false }
            if finalURL.host?.contains(StringConstants.test_request) == true { return false }
            return true
        } catch {
            return false
        }
    }
    
    private func loadProvenURL() {
        if let urlString = storage.string(forKey: StringConstants.saved_url) {
            if let url = URL(string: urlString) {
                provenURL = url
                savedURL = true
            }
        }
    }
    
    private func isBadURL(_ url: URL) -> Bool {
        let invalidURLs = ["about:blank", "about:srcdoc"]
        if invalidURLs.contains(url.absoluteString) { return true }
        if url.host?.contains(StringConstants.test_request) == true { return true }
        return false
    }
}
