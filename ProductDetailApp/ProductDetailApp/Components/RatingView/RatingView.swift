//
//  RatingView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import UIKit

final class RatingView: UIView {
    
    private lazy var ratingLabel: UILabel = {
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 14, weight: .medium))
            .setTextColor(.systemOrange)
            .build()
    }()
    
    private lazy var starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = K.P.p1.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var reviewCountLabel: UILabel = {
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 14, weight: .regular))
            .setTextColor(.systemOrange)
            .build()
    }()
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = K.P.p2.rawValue
        stack.alignment = .center
        stack.distribution = .fill // işte burası kritik!
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        addSubview(horizontalStack)
        
        setupStars()
        
        horizontalStack.addArrangedSubview(ratingLabel)
        horizontalStack.addArrangedSubview(starsStackView)
        horizontalStack.addArrangedSubview(reviewCountLabel)
        
        NSLayoutConstraint.activate([
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStack.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            horizontalStack.topAnchor.constraint(equalTo: topAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            heightAnchor.constraint(equalToConstant: K.P.p4.rawValue)
        ])
    }
    
    private func setupStars() {
        for _ in 0..<5 {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
            starImageView.tintColor = .systemOrange
            starImageView.contentMode = .scaleAspectFit
            starsStackView.addArrangedSubview(starImageView)
            
            NSLayoutConstraint.activate([
                starImageView.widthAnchor.constraint(equalToConstant: 14),
                starImageView.heightAnchor.constraint(equalToConstant: 14)
            ])
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
                starImageView.image = UIImage(systemName: "star.fill")
                starImageView.tintColor = .systemOrange
            } else if index == fullStars && hasHalfStar {
                starImageView.image = UIImage(systemName: "star.leadinghalf.filled")
                starImageView.tintColor = .systemOrange
            } else {
                starImageView.image = UIImage(systemName: "star")
                starImageView.tintColor = .systemGray3
            }
        }
    }
}
