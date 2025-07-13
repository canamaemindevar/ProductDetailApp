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
    
    func fetchSocial(completion: @escaping (Result<SocialResponse, NetworkErrors>) -> Void) {
        let result: Result<SocialResponse, NetworkErrors> = manager.load(from: "social", type: SocialResponse.self)
        completion(result)
    }
}
