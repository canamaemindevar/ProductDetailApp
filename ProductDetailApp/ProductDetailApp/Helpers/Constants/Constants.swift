//
//  Constants.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import Foundation

enum K {
    
    enum P: CGFloat {
        case p1 = 4
        case p2 = 8
        case p3 = 16
        case p4 = 20
        case p5 = 24
        case p6 = 32
    }
    
    enum Texts {
       
    }
}

extension K.P {
    var negativeValue: CGFloat {
        -self.rawValue
    }
}
