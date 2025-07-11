//
//  AppCoordinator.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showProductDetail()
    }
    
    private func showProductDetail() {
        let productCoordinator = ProductCoordinator(navigationController: navigationController)
        addChild(productCoordinator)
        productCoordinator.start()
    }
}
