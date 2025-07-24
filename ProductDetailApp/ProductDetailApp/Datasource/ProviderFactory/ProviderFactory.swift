//
//  ProviderFactory.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

final class ProviderFactory {
    func fetchProductProviderable() -> ProductProviderable {
        if ConfigurationManager.environment == .prod {
//            return ProductRepository()
            return ProductMockRepository()
        } else {
            return ProductMockRepository()
        }
    }
    
    func fetchSocialProviderable() -> SocialProviderable {
        if ConfigurationManager.environment == .prod {
//            return SocialRepository()
            return SocialMockRepository()
        } else {
            return SocialMockRepository()
        }
    }
}
