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
    
    func fetchSocial(completion: @escaping (Result<SocialResponse, NetworkErrors>) -> Void) {
        let req = AppRequest(method: .get, url: AppServices.Product.social.url)
        manager.request(req, completion: completion)
    }
}
