//
//  BaseViewModel.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 10.07.2025.
//

import Foundation


protocol BaseViewModelDelegate: AnyObject {
    func viewModelDidStartLoading()
    func viewModelDidFinishLoading()
    func viewModelDidReceiveError(_ message: String)
    func viewModelDidReceiveError(_ message: NetworkErrors)
}

protocol BaseViewModelProtocol: AnyObject {
    var delegate: BaseViewModelDelegate? { get set }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
}

class BaseViewModel: BaseViewModelProtocol {
    weak var delegate: BaseViewModelDelegate?
    
    private(set) var isLoading: Bool = false {
        didSet {
            if isLoading {
                delegate?.viewModelDidStartLoading()
            } else {
                delegate?.viewModelDidFinishLoading()
            }
        }
    }
    
    private(set) var errorMessage: String? {
        didSet {
            if let message = errorMessage {
                delegate?.viewModelDidReceiveError(message)
            }
        }
    }
    
    func setLoading(_ loading: Bool) {
        DispatchQueue.main.async {
            self.isLoading = loading
        }
    }
    
    func setError(_ message: String?) {
        DispatchQueue.main.async {
            self.errorMessage = message
        }
    }
    
    func clearError() {
        DispatchQueue.main.async {
            self.errorMessage = nil
        }
    }
}
