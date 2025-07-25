//
//  NetworkManager.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

class NetworkManager: NetworkManagerInterface {
    
    func request<T: Decodable>(_ endpoint: AppRequest) async throws -> T where T: Decodable {
        
        guard let req = endpoint.request() else { throw NetworkErrors.invalidRequest }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: req)
            guard let httpResponse = (response as? HTTPURLResponse) else { throw NetworkErrors.generalError }
            
            switch httpResponse.statusCode {
            case 200...299:
                break
            case 400...499:
                throw NetworkErrors.clientError(code: httpResponse.statusCode)
            case 500...599:
                throw NetworkErrors.serverError(code: httpResponse.statusCode)
            default:
                throw NetworkErrors.unexpectedStatusCode(code: httpResponse.statusCode)
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                Logger.shared.debug("Yanıt: \(responseString)")
            }
            
            return try await handleResponse(data: data)
            
        } catch  {
            throw error
        }
        
    }
}

extension NetworkManager {
    
    fileprivate func handleResponse<T: Decodable>(data: Data) async throws -> T {
        do {
            let successData = try JSONDecoder().decode(T.self, from: data)
            return successData
        } catch {
            Logger.shared.error(error.localizedDescription)
            throw NetworkErrors.parsingError
        }
    }
}
