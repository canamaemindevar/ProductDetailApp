//
//  SocialRepository.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//
import Foundation

final class SocialRepository: SocialProviderable {
    
    private let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
    }
    
    func fetchSocial() async throws -> SocialResponse {
            let req = AppRequest(method: .get, url: AppServices.Product.social.url)
            return try await manager.request(req) 
        }
}
