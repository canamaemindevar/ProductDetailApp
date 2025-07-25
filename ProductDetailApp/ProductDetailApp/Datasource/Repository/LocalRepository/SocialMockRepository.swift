//
//  SocialMockRepository.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

final class SocialMockRepository: SocialProviderable {
    
    private let manager: LocalNetworkManager
    
    init(manager: LocalNetworkManager = LocalNetworkManager()) {
        self.manager = manager
    }
    
    func fetchSocial() async throws -> SocialResponse {
        let result: Result<SocialResponse, NetworkErrors> = manager.load(from: "social", type: SocialResponse.self)
        switch result {
         case .success(let response):
             return response
         case .failure(let error):
             throw error
         }
    }
}
