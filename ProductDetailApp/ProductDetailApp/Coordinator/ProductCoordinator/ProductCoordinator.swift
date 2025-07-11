//
//  ProductCoordinator.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import UIKit


class ProductCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let productDetailViewModel = ProductDetailViewModel()
        let productDetailVC = ProductDetailViewController(viewModel: productDetailViewModel)
        productDetailVC.coordinator = self
        navigationController.pushViewController(productDetailVC, animated: true)
    }
}
