//
//  MockSocialRepository.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import XCTest
@testable import ProductDetailApp


class MockSocialRepository: SocialProviderable {

    var shouldReturnSuccess = true
    var mockSocialResponse: SocialResponse?
    var fetchSocialCallCount = 0
    
    func fetchSocial(completion: @escaping (Result<SocialResponse, NetworkErrors>) -> Void) {
        fetchSocialCallCount += 1
        
        if shouldReturnSuccess {
            let social = mockSocialResponse ?? SocialResponse(
                likeCount: 25,
                commentCounts: CommentCounts(
                    averageRating: 4, anonymousCommentsCount: 12,
                    memberCommentsCount: 100
                )
            )
            completion(.success(social))
        } else {
            completion(.failure(.custom(message: "Test Error")))
        }
    }
}

class MockProductRepository: ProductProviderable {
    var shouldReturnSuccess = true
    var mockProductResponse: ProductResponse?
    var fetchProductCallCount = 0
    
    func fetchProduct(completion: @escaping (Result<ProductResponse, NetworkErrors>) -> Void) {
        fetchProductCallCount += 1
        
        if shouldReturnSuccess {
            let product = mockProductResponse ?? ProductResponse(
                id: 1, name: "Test Product",
                desc: "Test Description",
                image: "test_image.jpg",
                price: Price(value: 99, currency: "USD")
            )
            completion(.success(product))
        } else {
            completion(.failure(.custom(message: "Test Error")))
        }
    }
}

class MockProductDetailViewModelInterface: ProductDetailViewModelInterface {
    var didProductFetchCallCount = 0
    var didSocialFetchCallCount = 0
    var lastProductDetail: ProductResponse?
    var lastSocialDetail: SocialResponse?
    
    func didProductFetch(detail: ProductResponse) {
        didProductFetchCallCount += 1
        lastProductDetail = detail
    }
    
    func didSocialtFetch(social: SocialResponse) {
        didSocialFetchCallCount += 1
        lastSocialDetail = social
    }
}
