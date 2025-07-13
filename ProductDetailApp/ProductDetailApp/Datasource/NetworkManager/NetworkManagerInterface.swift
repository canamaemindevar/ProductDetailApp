//
//  NetworkManagerInterface.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

protocol NetworkManagerInterface {
    func request<T: Decodable>(_ endpoint: AppRequest, completion: @escaping (Result<T, NetworkErrors>) -> Void)
}
