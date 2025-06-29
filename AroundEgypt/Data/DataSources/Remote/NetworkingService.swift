//
//  NetworkingService.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct NetworkingService {
    func request<T: Decodable>(_ request: URLRequest) async -> Result<T, Error> {
        guard NetworkMonitor.shared.isConnected else {
            return .failure(NetworkError.noInternetConnection)
        }
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
}
