//
//  EndpointProtocol.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

protocol EndpointProtocol {
    var method: HTTPMethod { get }
    var url: URL? { get }
    var bodyParameters: [String: Any]? { get }
    var urlString: String { get }
    var header: [String: String]? { get }
    var timeoutInterval: TimeInterval { get }
    var encodedParameters: Data? { get }
    func request() -> URLRequest?
}
