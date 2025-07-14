//
//  ProductDetailViewModelTests.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import XCTest
@testable import ProductDetailApp

class ProductDetailViewModelTests: XCTestCase {
    
    var viewModel: ProductDetailViewModel!
    var mockSocialRepository: MockSocialRepository!
    var mockProductRepository: MockProductRepository!
    var mockDelegate: MockProductDetailViewModelInterface!
    
    override func setUp() {
        super.setUp()
        mockSocialRepository = MockSocialRepository()
        mockProductRepository = MockProductRepository()
        mockDelegate = MockProductDetailViewModelInterface()
        
        viewModel = ProductDetailViewModel(
            socialRepository: mockSocialRepository,
            productRepository: mockProductRepository
        )
        viewModel.localDelegate = mockDelegate
    }
    
    override func tearDown() {
        viewModel = nil
        mockSocialRepository = nil
        mockProductRepository = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    // MARK: - fetchProductDetail Tests
    
    func testFetchProductDetail_Success() {
        // Given
        let expectedProduct = ProductResponse(
            id: 1, name: "iPhone 15",
            desc: "Latest iPhone model",
            image: "iphone15.jpg",
            price: Price(value: 9999, currency: "USD")
        )
        mockProductRepository.mockProductResponse = expectedProduct
        mockProductRepository.shouldReturnSuccess = true
        
        let expectation = XCTestExpectation(description: "Product fetch completion")
        
        // When
        viewModel.fetchProductDetail()
        
        // Wait for async operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        
        // Then
        XCTAssertEqual(mockProductRepository.fetchProductCallCount, 1)
        XCTAssertEqual(mockDelegate.didProductFetchCallCount, 1)
        XCTAssertEqual(mockDelegate.lastProductDetail?.name, expectedProduct.name)
        XCTAssertEqual(mockDelegate.lastProductDetail?.desc, expectedProduct.desc)
        XCTAssertEqual(mockDelegate.lastProductDetail?.price?.value, expectedProduct.price?.value)
    }
    
    func testFetchProductDetail_Failure() {
        // Given
        mockProductRepository.shouldReturnSuccess = false
        
        let expectation = XCTestExpectation(description: "Product fetch failure")
        
        // When
        viewModel.fetchProductDetail()
        
        // Wait for async operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        
        // Then
        XCTAssertEqual(mockProductRepository.fetchProductCallCount, 1)
        XCTAssertEqual(mockDelegate.didProductFetchCallCount, 0)
        // Error handling would be tested if BaseViewModel's setError method is accessible
    }
    
    // MARK: - fetchSocial Tests
    
    func testFetchSocial_Success() {
        // Given
        let expectedSocial = SocialResponse(
            likeCount: 150,
            commentCounts: CommentCounts(
                averageRating: 4, anonymousCommentsCount: 12,
                memberCommentsCount: 250
            )
        )
        mockSocialRepository.mockSocialResponse = expectedSocial
        mockSocialRepository.shouldReturnSuccess = true
        
        let expectation = XCTestExpectation(description: "Social fetch completion")
        
        // When
        viewModel.fetchSocial()
        
        // Wait for async operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        
        // Then
        XCTAssertEqual(mockSocialRepository.fetchSocialCallCount, 1)
        XCTAssertEqual(mockDelegate.didSocialFetchCallCount, 1)
        XCTAssertEqual(mockDelegate.lastSocialDetail?.likeCount, expectedSocial.likeCount)
        XCTAssertEqual(mockDelegate.lastSocialDetail?.commentCounts?.averageRating, expectedSocial.commentCounts?.averageRating)
        XCTAssertEqual(mockDelegate.lastSocialDetail?.commentCounts?.totalCommentsCount, expectedSocial.commentCounts?.totalCommentsCount)
    }
    
    func testFetchSocial_Failure() {
        // Given
        mockSocialRepository.shouldReturnSuccess = false
        
        let expectation = XCTestExpectation(description: "Social fetch failure")
        
        // When
        viewModel.fetchSocial()
        
        // Wait for async operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        
        // Then
        XCTAssertEqual(mockSocialRepository.fetchSocialCallCount, 1)
        XCTAssertEqual(mockDelegate.didSocialFetchCallCount, 0)
    }
    
    func testMultipleFetchSocialCalls() {
        // Given
        mockSocialRepository.shouldReturnSuccess = true
        
        let expectation = XCTestExpectation(description: "Multiple social fetch")
        
        // When
        viewModel.fetchSocial()
        viewModel.fetchSocial()
        
        // Wait for async operations
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        
        // Then
        XCTAssertEqual(mockSocialRepository.fetchSocialCallCount, 2)
        XCTAssertEqual(mockDelegate.didSocialFetchCallCount, 2)
    }
}
