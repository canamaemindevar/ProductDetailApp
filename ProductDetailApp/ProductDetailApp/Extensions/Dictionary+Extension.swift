//
//  Dictionary+Extension.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

extension Dictionary {
    var jsonStringRepresentation: String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
    }
}
