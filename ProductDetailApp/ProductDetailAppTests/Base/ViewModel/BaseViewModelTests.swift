//
//  BaseViewModelTests.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import XCTest
@testable import ProductDetailApp

final class BaseViewModelTests: XCTestCase {
    
    var viewModel: BaseViewModel!
    var mockDelegate: MockBaseViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        viewModel = BaseViewModel()
        mockDelegate = MockBaseViewModelDelegate()
        viewModel.delegate = mockDelegate
    }
    
    override func tearDown() {
        viewModel = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testSetLoadingTrue_CalledFromViewModel() {
        viewModel.setLoading(true)
        //        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertTrue(mockDelegate.didStartLoadingCalled)
        XCTAssertFalse(mockDelegate.didFinishLoadingCalled)
    }
    
    func testSetLoadingFalse_CalledFromViewModel() {
        viewModel.setLoading(false)
        //        XCTAssertTrue(viewModel.isLoading)
        XCTAssertFalse(viewModel.isLoading)
        
        XCTAssertFalse(mockDelegate.didStartLoadingCalled)
        XCTAssertTrue(mockDelegate.didFinishLoadingCalled)
    }
    
    
    // Error case
    
    func testSetError_WhenErrorRecieved() {
        let errorMessage = "Test Error"
        
        viewModel.setError(errorMessage)
        //        XCTAssertFalse(mockDelegate.didReceiveErrorCalled)
        
        XCTAssertTrue(mockDelegate.didReceiveErrorCalled)
        XCTAssertEqual(mockDelegate.receivedErrorMessage, errorMessage)
        XCTAssertEqual(mockDelegate.errorCallCount, 1)
    }
    
    func testClearError_WhenErrorRecieved() {
        let errorMessage = "Test Error"
        
        viewModel.setError(errorMessage)
        
        
        viewModel.clearError()
        
        XCTAssertNil(viewModel.errorMessage)
    }
    
    
    func testSetErrorMultipleTimes_ShouldCallDelegateEachTime() {
        
        let firstError = "First"
        let secondError = "Second"
        
        viewModel.setError(firstError)
        viewModel.setError(secondError)
        
        XCTAssertEqual(mockDelegate.errorCallCount, 2)
        XCTAssertEqual(mockDelegate.receivedErrorMessage, secondError)
    }
    
    
    // Onemli
    func testSetLoadingWithNilDelegate_ShouldNotCrash() {
        // Given
        viewModel.delegate = nil
        
        // When & Then - Crash olmamalı
        XCTAssertNoThrow(viewModel.setLoading(true))
        XCTAssertNoThrow(viewModel.setLoading(false))
    }
    
    func testSetErrorWithNilDelegate_ShouldNotCrash() {
          // Given
          viewModel.delegate = nil
          
          // When & Then - Crash olmamalı
          XCTAssertNoThrow(viewModel.setError("Test error"))
      }
    
    func testInitialState_ShouldHaveCorrectValues() {
        // Given - Yeni bir viewModel
        let newViewModel = BaseViewModel()
        
        // Then
        XCTAssertFalse(newViewModel.isLoading)
        XCTAssertNil(newViewModel.errorMessage)
        XCTAssertNil(newViewModel.delegate)
    }
}


