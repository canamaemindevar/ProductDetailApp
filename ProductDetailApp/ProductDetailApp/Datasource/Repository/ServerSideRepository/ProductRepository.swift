//
//  ProductRepository.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

final class ProductRepository: ProductProviderable {
    
    private let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
    }
    
    func fetchProduct() async throws -> ProductResponse {
        let req = AppRequest(method: .get, url: AppServices.Product.detail.url)
        return try await manager.request(req) 
    }
}
