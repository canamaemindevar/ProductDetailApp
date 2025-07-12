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
    
    var productDetail: ProductResponse?
    var socialDetail: SocialResponse?
    
    init(socialRepository: SocialProviderable, productRepository: ProductProviderable) {
        self.socialRepository = socialRepository
        self.productRepository = productRepository
    }
    
}

extension ProductDetailViewModel {
    
    func fetchProductDetail() {
        setLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.productRepository.fetchProduct { [weak self] response in
                switch response {
                case .success(let success):
                    self?.productDetail = success
                    self?.localDelegate?.didProductFetch(detail: success)
                case .failure(let failure):
                    self?.setError(failure.errorString ?? "")
                }
                self?.setLoading(false)
            }
        }
    }
    
    func fetchSocial() {
        setLoading(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.socialRepository.fetchSocial { [weak self] response in
                switch response {
                case .success(let success):
                    self?.socialDetail = success
                    self?.localDelegate?.didSocialtFetch(social: success)
                case .failure(let failure):
                    self?.setError(failure.errorString ?? "")
                }
                self?.setLoading(false)
            }
        }
   
    }
}
