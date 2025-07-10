//
//  SuccessPresentable.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 10.07.2025.
//

import UIKit.UIViewController

protocol SuccessPresentable: AnyObject {
    func showSuccessAlert(_ message: String)
}

extension SuccessPresentable where Self: UIViewController {
    func showSuccessAlert(_ message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
