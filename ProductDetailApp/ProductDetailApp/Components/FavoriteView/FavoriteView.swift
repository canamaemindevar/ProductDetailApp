//
//  FavoriteView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import UIKit

class FavoriteView: UIView {
    
    private let heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var countLabel: UILabel = {
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 14, weight: .regular))
            .setTextColor(.systemGray)
            .setTextAlignment(.center)
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
        
        addSubview(heartButton)
        addSubview(countLabel)
        
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: topAnchor),
            heartButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartButton.widthAnchor.constraint(equalToConstant: 24),
            heartButton.heightAnchor.constraint(equalToConstant: 30),
            
            countLabel.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(count: Int, isFavorited: Bool) {
        countLabel.text = "\(count)"
        let heartImageName = isFavorited ? "heart.fill" : "heart"
        heartButton.setImage(UIImage(systemName: heartImageName), for: .normal)
        heartButton.tintColor = isFavorited ? .systemRed : .systemGray
    }
}
