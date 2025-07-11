//
//  BaseViewControllerTests.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import XCTest
@testable import ProductDetailApp

final class BaseViewControllerTests: XCTestCase {
    
    var viewController: TestableBaseViewController!
    var mockViewModel: MockBaseViewModel!
    
    override func setUp() {
        super.setUp()
        mockViewModel = MockBaseViewModel()
        viewController = TestableBaseViewController()
    }
    
    override func tearDown() {
        viewController = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    // vm ile olustur crash var mi, vm in delegate i vc mi?
    
    func testInit_WhenWithViewModel() {
        let vc = TestableBaseViewController(viewModel: mockViewModel)
        
        XCTAssertNotNil(vc.viewModel)
        XCTAssertNoThrow(vc.viewModel)
        //        XCTAssertNil(vc.viewModel?.delegate) //patlamali
        
        XCTAssertTrue(vc.viewModel === mockViewModel)
        XCTAssertTrue(mockViewModel.delegate === vc)
        
    }
    
    func testViewModelDidSet_ShouldSetDelegate() {
        viewController.viewModel = mockViewModel
        XCTAssertTrue(mockViewModel.delegate === viewController)
    }
    
    func testInt_WhenWithoutViewModel() {
        let vc = TestableBaseViewController()
        
        XCTAssertNil(vc.viewModel)
    }
    
    func testViewModelDidSetToNil_ShouldNotCrash() {
        viewController.viewModel = mockViewModel
        XCTAssertNoThrow(viewController.viewModel = nil)
    }
    
    func testConformsToLoadable() {
        XCTAssertTrue(viewController is Loadable)
    }
    
    func testConformsToErrorPresentable() {
        XCTAssertTrue(viewController is ErrorPresentable)
    }
    
    func testConformsToSuccessPresentable() {
        XCTAssertTrue(viewController is SuccessPresentable)
    }
    
    func testConformsToBaseViewModelDelegate() {
        XCTAssertTrue(viewController is BaseViewModelDelegate)
    }
}
