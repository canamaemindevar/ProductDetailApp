//
//  ProductProviderable.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

protocol ProductProviderable {
    func fetchProduct() async throws -> ProductResponse
}
