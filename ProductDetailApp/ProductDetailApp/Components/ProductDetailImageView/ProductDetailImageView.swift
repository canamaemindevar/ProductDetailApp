//
//  ProductDetailImageView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//
import UIKit

class ProductDetailImageView: BaseImageView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProductDetailView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupProductDetailView()
    }
    
    override var intrinsicContentSize: CGSize {
          return CGSize(width: UIView.noIntrinsicMetric, height: 150)
      }
    
    // MARK: - Setup
    private func setupProductDetailView() {
      
        cornerRadius = 12
        borderWidth = 1
        borderColor = UIColor.systemGray5
//        placeholderImage = UIImage(systemName: "photo")
        placeholderText = "Ürün Görseli"
        
       
        backgroundColor = UIColor.systemGray6
    }
}
