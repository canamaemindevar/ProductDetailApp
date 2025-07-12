//
//  ProductProviderable.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

protocol ProductProviderable {
    func product(request: String, completion: @escaping (Result<ProductResponse, NetworkErrors>) -> Void)
}
