//
//  ErrorPresentable.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 10.07.2025.
//
import UIKit.UIViewController

protocol ErrorPresentable: AnyObject {
    func showErrorAlert(_ error: String?)
}

extension ErrorPresentable where Self: UIViewController {
    func showErrorAlert(_ error: String?) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}
