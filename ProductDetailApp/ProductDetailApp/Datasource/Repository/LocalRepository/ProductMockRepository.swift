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
    
    func fetchProduct(completion: @escaping (Result<ProductResponse, NetworkErrors>) -> Void) {
        let result: Result<ProductResponse, NetworkErrors> = manager.load(from: "product", type: ProductResponse.self)
        completion(result)
    }
}
