//
//  ProductMockRepository.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//
import Foundation

final class ProductMockRepository: ProductProviderable {
    
    private let manager: LocalNetworkManager
    
    init(manager: LocalNetworkManager = LocalNetworkManager()) {
        self.manager = manager
    }
    
    func fetchProduct() async throws -> ProductResponse {
        let result: Result<ProductResponse, NetworkErrors> = manager.load(from: "product", type: ProductResponse.self)
        switch result {
         case .success(let response):
             return response
         case .failure(let error):
             throw error
         }
    }
}
