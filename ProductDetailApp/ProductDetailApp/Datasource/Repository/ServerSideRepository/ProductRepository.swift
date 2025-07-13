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
    
    func fetchProduct(completion: @escaping (Result<ProductResponse, NetworkErrors>) -> Void) {
        let req = AppRequest(method: .get, url: AppServices.Product.detail.url)
        manager.request(req, completion: completion)
    }
}
