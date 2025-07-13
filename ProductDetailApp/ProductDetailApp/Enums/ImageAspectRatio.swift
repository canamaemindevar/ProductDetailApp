//
//  ImageAspectRatio.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import Foundation

enum ImageAspectRatio {
    case standard        // 2:3
    case square          // 1:1
    case golden          // 1:1.618
    case custom(CGFloat) // any custom ratio
    
    var multiplier: CGFloat {
        switch self {
        case .standard:
            return 2.0 / 3.0
        case .square:
            return 1.0
        case .golden:
            return 1.0 / 1.618
        case .custom(let value):
            return value
        }
    }
}
