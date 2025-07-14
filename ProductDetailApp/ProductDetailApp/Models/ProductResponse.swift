//
//  ProductResponse.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

struct ProductResponse: Decodable {
    
    let id: Int?
    let name, desc: String?
    let image: String?
    let price: Price?
}

struct Price: Decodable {
    let value: Int?
    let currency: String?
}
