//
//  ProductResponse.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

struct ProductResponse: Codable {
    
    let id: Int?
    let name, desc: String?
    let image: String?
    let price: Price?
}

struct Price: Codable {
    let value: Int?
    let currency: String?
}
