//
//  ProductDetailViewModel.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import Foundation

protocol ProductDetailViewModelInterface: AnyObject {
    func didProductFetch(detail: ProductResponse)
    func didSocialtFetch(social: SocialResponse)
}

final class ProductDetailViewModel: BaseViewModel {

    weak var localDelegate: ProductDetailViewModelInterface?

    private var socialRepository: SocialProviderable
    private var productRepository: ProductProviderable
    
    init(socialRepository: SocialProviderable, productRepository: ProductProviderable) {
        self.socialRepository = socialRepository
        self.productRepository = productRepository
    }
    
}

extension ProductDetailViewModel {
    
    func fetchProductDetail() {
        setLoading(true)
        
        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            
            do {
                let result = try await productRepository.fetchProduct()
                self.localDelegate?.didProductFetch(detail: result)
            } catch let error as NetworkErrors {
                self.setError(error.errorString)
            }
            self.setLoading(false)
        }
    }
    
    func fetchSocial() {
        setLoading(true)
        
        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            
            do {
                let result = try await socialRepository.fetchSocial()
                self.localDelegate?.didSocialtFetch(social: result)
            } catch let error as NetworkErrors {
                self.setError(error.errorString)
            }
            self.setLoading(false)
        }
    }
}
