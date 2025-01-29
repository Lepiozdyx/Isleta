//
//  NetworkManager.swift
//  Isleta
//
//  Created by Alex on 29.01.2025.
//

import UIKit

protocol NetworkManaging: ObservableObject {
    var provenURL: URL? { get }
    func proveURL(_ url: URL)
    func checkURL() async throws -> Bool
    func getUserAgent(forWebView: Bool) -> String
}

final class NetworkManager: NetworkManaging {
    @Published private(set) var provenURL: URL?
    
    static let targetURL = URL(string: StringConstants.url)!
    
    private enum StorageKey {
        static let savedURL = StringConstants.saved_url
        static let invalidURLs = ["about:blank", "about:srcdoc"]
    }
    
    private let storage: UserDefaults
    private let systemVersion: String
    private var hasStoredURL: Bool = false
    
    init(storage: UserDefaults = .standard, systemVersion: String = UIDevice.current.systemVersion) {
        self.storage = storage
        self.systemVersion = systemVersion
        loadSavedURL()
    }
    
    func proveURL(_ url: URL) {
        guard !hasStoredURL, isURLValid(url) else { return }
        
        storage.set(url.absoluteString, forKey: StorageKey.savedURL)
        provenURL = url
        hasStoredURL = true
    }
    
    func getUserAgent(forWebView: Bool) -> String {
        forWebView ? webViewUserAgent : networkUserAgent
    }
    
    func checkURL() async throws -> Bool {
        let request = URLRequest(url: Self.targetURL, userAgent: networkUserAgent)
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            return validateResponse(response)
        } catch {
            return false
        }
    }
}

// MARK: - Private Methods
private extension NetworkManager {
    var webViewUserAgent: String {
        """
        Mozilla/5.0 (iPhone; CPU iPhone OS \(systemVersion.replacingOccurrences(of: ".", with: "_")) \
        like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1
        """
    }
    
    var networkUserAgent: String {
        "TestRequest/1.0 CFNetwork/1410.0.3 Darwin/22.4.0"
    }
    
    func loadSavedURL() {
        guard let urlString = storage.string(forKey: StorageKey.savedURL),
              let url = URL(string: urlString) else { return }
        
        provenURL = url
        hasStoredURL = true
    }
    
    func isURLValid(_ url: URL) -> Bool {
        guard !StorageKey.invalidURLs.contains(url.absoluteString) else { return false }
        guard let host = url.host else { return false }
        return !host.contains(StringConstants.test_request)
    }
    
    func validateResponse(_ response: URLResponse) -> Bool {
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode),
              let finalURL = httpResponse.url,
              let host = finalURL.host else { return false }
        
        return !host.contains(StringConstants.test_request)
    }
}

private extension URLRequest {
    init(url: URL, userAgent: String) {
        self.init(url: url)
        setValue(userAgent, forHTTPHeaderField: "User-Agent")
    }
}
