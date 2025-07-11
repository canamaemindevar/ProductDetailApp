//
//  TestableBaseViewController.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//
import XCTest
@testable import ProductDetailApp

class TestableBaseViewController: BaseViewController {
    
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showErrorAlertCalled = false
    var receivedErrorMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
        func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
    
    func showErrorAlert(_ message: String) {
        showErrorAlertCalled = true
        receivedErrorMessage = message
    }
    
    func reset() {
        showLoadingCalled = false
        hideLoadingCalled = false
        showErrorAlertCalled = false
        receivedErrorMessage = nil
    }

}

