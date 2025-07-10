//
//  Loadable.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 10.07.2025.
//

import UIKit.UIViewController

protocol Loadable: AnyObject {
    func showLoading()
    func hideLoading()
}

extension Loadable where Self: UIViewController {
    
    func showLoading() {
        // Eğer zaten loading tag'i varsa, tekrar oluşturma
        if view.viewWithTag(999) != nil {
            return
        }
        
        // Ana container view oluştur
        let containerView = UIView()
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.tag = 999 // Loading view'ı tanımlamak için tag
        
        // Spinner oluştur
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        // Container'a spinner ekle
        containerView.addSubview(spinner)
        
        // View'a container ekle (en üstte kalması için)
        view.addSubview(containerView)
        view.bringSubviewToFront(containerView)
        
        // Constraints ayarla
        NSLayoutConstraint.activate([
            // Container full screen
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Spinner ortalanmış
            spinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        // User interaction'ı engelle
        containerView.isUserInteractionEnabled = true
    }
    
    func hideLoading() {
        view.viewWithTag(999)?.removeFromSuperview()
    }
}
