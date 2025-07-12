//
//  LocalNetworkManager.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

final class LocalNetworkManager {
    
    func load<T: Decodable>(from fileName: String, type: T.Type) -> Result<T, NetworkErrors> {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return .failure(.fileNotFound)
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return .success(decoded)
        } catch {
            return .failure(.localJsonParseError)
        }
    }
}
