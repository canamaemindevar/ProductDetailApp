//
//  RatingView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import UIKit

class RatingView: UIView {
    
    private lazy var ratingLabel: UILabel = {
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 14, weight: .medium))
            .setTextColor(.systemOrange)
            .build()
    }()
    
    private let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var reviewCountLabel: UILabel = {
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 14, weight: .regular))
            .setTextColor(.systemOrange)
            .build()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(ratingLabel)
        addSubview(starsStackView)
        addSubview(reviewCountLabel)
        
        setupStars()
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            starsStackView.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: K.P.p2.rawValue),
            starsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            reviewCountLabel.leadingAnchor.constraint(equalTo: starsStackView.trailingAnchor, constant: K.P.p2.rawValue),
            reviewCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            reviewCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            heightAnchor.constraint(equalToConstant: K.P.p4.rawValue)
        ])
    }
    
    private func setupStars() {
        for _ in 0..<5 {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
            starImageView.tintColor = .systemOrange
            starImageView.contentMode = .scaleAspectFit
            starsStackView.addArrangedSubview(starImageView)
            starImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
            starImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        }
    }
    
    func configure(rating: Double, reviewCount: Int) {
        ratingLabel.text = String(format: "%.1f", rating)
        reviewCountLabel.text = "(\(reviewCount) Reviews)"
        updateStars(rating: rating)
    }
    
    private func updateStars(rating: Double) {
        let fullStars = Int(rating)
        let hasHalfStar = rating - Double(fullStars) >= 0.5
        
        for (index, arrangedSubview) in starsStackView.arrangedSubviews.enumerated() {
            guard let starImageView = arrangedSubview as? UIImageView else { continue }
            
            if index < fullStars {
                // Dolu yıldız
                starImageView.image = UIImage(systemName: "star.fill")
                starImageView.tintColor = .systemOrange
            } else if index == fullStars && hasHalfStar {
                // Yarım yıldız
                starImageView.image = UIImage(systemName: "star.leadinghalf.filled")
                starImageView.tintColor = .systemOrange
            } else {
                // Boş yıldız
                starImageView.image = UIImage(systemName: "star")
                starImageView.tintColor = .systemGray3
            }
        }
    }
}
