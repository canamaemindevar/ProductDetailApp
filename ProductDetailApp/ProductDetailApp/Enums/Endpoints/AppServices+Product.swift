//
//  AppServices+Product.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

extension AppServices {

    enum Product {
        case base
        case detail
        case social
        var url: String {
            switch self {
            case .base:
                baseUrl.rawValue + "products/"
            case .detail:
                Product.base.url + "detail"
            case .social:
                Product.base.url + "social"
            }
        }
    }
}
