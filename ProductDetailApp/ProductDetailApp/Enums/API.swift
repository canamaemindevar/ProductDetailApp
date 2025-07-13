//
//  API.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//
import Foundation

enum API {
    static var baseURL: String {
        do {
            return try BuildConfiguration.value(for: "BASE_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
