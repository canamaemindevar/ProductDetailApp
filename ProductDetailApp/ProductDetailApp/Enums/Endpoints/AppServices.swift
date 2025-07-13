//
//  AppServices.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

enum AppServices {
    case baseUrl
    
    var rawValue: String {
        switch self {
        case .baseUrl:
            return API.baseURL
        }
    }
}

