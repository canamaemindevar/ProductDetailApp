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

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    
    static func value<T>(for key: String) throws ->  T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
        case let string as String:
            guard let value = T(string)  else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
    
}

enum API {
    static var baseURL: String {
        do {
            return try BuildConfiguration.value(for: "BASE_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
