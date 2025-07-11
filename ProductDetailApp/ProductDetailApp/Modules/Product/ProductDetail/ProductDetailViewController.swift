//
//  ProductDetailViewController.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import UIKit

class ProductDetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            hideLoading()
        }
    }
}
