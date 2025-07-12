//
//  SocialProviderable.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

protocol SocialProviderable {
    func social(request: String, completion: @escaping (Result<SocialResponse, NetworkErrors>) -> Void)
}
