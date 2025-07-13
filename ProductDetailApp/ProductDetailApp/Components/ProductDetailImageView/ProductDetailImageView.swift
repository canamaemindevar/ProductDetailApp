//
//  ProductDetailImageView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//
import UIKit

class ProductDetailImageView: BaseImageView {
    
    init(aspectRatio: ImageAspectRatio = .standard) {
        super.init(frame: .zero)
        self.aspectRatio = aspectRatio
        setupProductDetailView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.aspectRatio = .standard
        setupProductDetailView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.aspectRatio = .standard
        setupProductDetailView()
    }
    
    private func setupProductDetailView() {
        cornerRadius = 12
        borderWidth = 1
        borderColor = UIColor.systemGray5
        placeholderText = "Prodcut Image"
        backgroundColor = UIColor.systemGray6
    }
}
