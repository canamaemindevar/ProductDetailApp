//
//  SocialProviderable.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

protocol SocialProviderable {
    func fetchSocial(completion: @escaping (Result<SocialResponse, NetworkErrors>) -> Void)
}
