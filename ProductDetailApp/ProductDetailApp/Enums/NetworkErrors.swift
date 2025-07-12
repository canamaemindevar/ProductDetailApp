//
//  NetworkErrors.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import Foundation

enum NetworkErrors: Error, Equatable {
    case invalidUrl
    case noData
    case invalidRequest
    case generalError
    case parsingError
    case responseError
    case custom(message: String?)
    case emptyResponse
    case clientError(code: Int)
    case serverError(code: Int)
    case unexpectedStatusCode(code: Int)
  
    case localJsonParseError
    case localJsonEmptyError
    
    private var errorDescription: String? {
        switch self {
        case .serverError(let code):
            return "serverError" + "HTTP Code: \(code)"
        case .parsingError:
            return "Veri formatında hata oluştu"
        case .emptyResponse:
            return "Sunucudan boş yanıt alındı"
        case .invalidUrl:
            return "invalidUrl"
        case .noData:
            return "noData"
        case .invalidRequest:
            return "invalidRequest"
        case .generalError:
            return "generalError"
        case .responseError:
            return "responseError"
        case .custom(message: let message):
            return message
        case .clientError(code: let code):
            return "clientError" + "HTTP Code: \(code)"
        case .unexpectedStatusCode(code: let code):
            return "unexpectedStatusCode" + "HTTP Code: \(code)"
        case .localJsonParseError:
            return "LocalDBParseError"
        case .localJsonEmptyError:
            return "StorageFailure"
        }
    }
    
    private var displayableError: String? {
        switch self {
        case .serverError:
            return "Sunucuda bir sorun oluştu. Lütfen daha sonra tekrar deneyin."
        case .parsingError:
            return "Beklenmeyen bir veri hatası oluştu. Lütfen uygulamayı yeniden başlatın."
        case .emptyResponse:
            return "Sunucudan geçerli bir yanıt alınamadı."
        case .invalidUrl:
            return "İstek hatalı bir adrese gönderildi."
        case .noData:
            return "İstenen bilgiye ulaşılamadı."
        case .invalidRequest:
            return "İstek geçersiz. Lütfen işlemi tekrar deneyin."
        case .generalError:
            return "Bir hata oluştu. Lütfen tekrar deneyin."
        case .responseError:
            return "İşlem sırasında bir hata oluştu. Lütfen yeniden deneyin."
        case .custom(let message):
            return message
        case .clientError:
            return "İsteğiniz işlenemedi. Lütfen tekrar deneyin."
        case .unexpectedStatusCode:
            return "Sunucudan beklenmeyen bir yanıt alındı."
        case .localJsonParseError:
            return "Kayıtlı veriler okunurken hata oluştu."
        case .localJsonEmptyError:
            return "Kayıtlı veri bulunamadı."
        }
    }
    
    var errorString: String? {
        if ConfigurationManager.environment == .dev {
            return errorDescription
        } else {
            return displayableError
        }
    }
    
}
