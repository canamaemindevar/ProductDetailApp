//
//  MockBaseViewModel.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//
import XCTest
@testable import ProductDetailApp

class MockBaseViewModel: BaseViewModelProtocol {
    weak var delegate: BaseViewModelDelegate?
    
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                delegate?.viewModelDidStartLoading()
            } else {
                delegate?.viewModelDidFinishLoading()
            }
        }
    }
    
    var errorMessage: String? {
        didSet {
            if let message = errorMessage {
                delegate?.viewModelDidReceiveError(message)
            }
        }
    }
}
