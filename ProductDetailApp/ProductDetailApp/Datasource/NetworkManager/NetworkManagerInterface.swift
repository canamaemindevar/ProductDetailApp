//
//  NetworkManagerInterface.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

protocol NetworkManagerInterface {
    func request<T: Decodable>(_ endpoint: AppRequest) async throws -> T where T: Decodable
}
