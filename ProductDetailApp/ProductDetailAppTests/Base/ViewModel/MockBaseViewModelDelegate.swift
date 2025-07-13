//
//  MockBaseViewModelDelegate.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//
import XCTest
@testable import ProductDetailApp

class MockBaseViewModelDelegate: BaseViewModelDelegate {
    func viewModelDidReceiveError(_ message: ProductDetailApp.NetworkErrors) {
        
    }
    
    
    var didStartLoadingCalled = false
    var didFinishLoadingCalled = false
    var didReceiveErrorCalled = false
    var receivedErrorMessage: String?
    var errorCallCount = 0
    
    func viewModelDidStartLoading() {
        didStartLoadingCalled = true
    }
    
    func viewModelDidFinishLoading() {
        didFinishLoadingCalled = true
    }
    
    func viewModelDidReceiveError(_ message: String) {
        didReceiveErrorCalled = true
        receivedErrorMessage = message
        errorCallCount += 1
    }
    
    func reset() {
        didStartLoadingCalled = false
        didFinishLoadingCalled = false
        didReceiveErrorCalled = false
        receivedErrorMessage = nil
        errorCallCount = 0
    }
}
