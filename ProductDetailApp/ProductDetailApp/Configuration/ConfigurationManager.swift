//
//  ConfigurationManager.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 10.07.2025.
//

import Foundation

enum ConfigurationManager {
    enum Environment {
        case dev
        case prod
    }
    
    static var environment: Environment  {
#if DEV
        return .dev
#else
        return .prod
#endif
    }
}

