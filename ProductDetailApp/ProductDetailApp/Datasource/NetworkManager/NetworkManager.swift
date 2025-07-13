//
//  NetworkManager.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

class NetworkManager: NetworkManagerInterface {
        
    func request<T: Decodable>(_ endpoint: AppRequest, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        
        guard let req = endpoint.request() else {
            DispatchQueue.main.async {
                completion(.failure(.invalidRequest))
            }
            return
        }
        
        Logger.shared.debug(endpoint.debugDescription)
        
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            
            if let error = error {
                Logger.shared.error("Hata oluştu: \(error.localizedDescription)")
                completion(.failure(.generalError))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                Logger.shared.debug("HTTP Durum Kodu: \(httpResponse.statusCode)")
                
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400...499:
                    completion(.failure(.clientError(code: httpResponse.statusCode)))
                    return
                case 500...599:
                    completion(.failure(.serverError(code: httpResponse.statusCode)))
                    return
                default:
                    completion(.failure(.unexpectedStatusCode(code: httpResponse.statusCode)))
                    return
                }
            } else {
                completion(.failure(.generalError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                Logger.shared.debug("Yanıt: \(responseString)")
            }
            
            self.handleResponse(data: data) { response in
                completion(response)
            }
        }
        
        task.resume()
    }
}

extension NetworkManager {
    
    fileprivate func handleResponse<T: Decodable>(data: Data, compeltion: @escaping( (Result<T,NetworkErrors>)-> () ) ) {
        
        do {
            let succesData =  try JSONDecoder().decode(T.self, from: data)
            compeltion(.success(succesData))
        } catch  {
            Logger.shared.error(error.localizedDescription)
            compeltion(.failure(.parsingError))
        }
        
    }
}
