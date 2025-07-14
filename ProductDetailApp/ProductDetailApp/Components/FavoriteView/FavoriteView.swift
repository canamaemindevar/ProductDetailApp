//
//  FavoriteView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import UIKit

class FavoriteView: UIView {
    
    private enum Constants {
        static var heartFillImage =  UIImage(systemName: "heart.fill")
        static var heartImage =  UIImage(systemName: "heart")
    }
    
    private let heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.heartFillImage, for: .normal)
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
            heartButton.widthAnchor.constraint(equalToConstant: K.P.p5.rawValue),
            heartButton.heightAnchor.constraint(equalToConstant: K.P.p6.rawValue),
            
            countLabel.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: K.P.p1.rawValue),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(count: Int, isFavorited: Bool) {
        countLabel.text = count.safeString
        heartButton.setImage(isFavorited ? Constants.heartFillImage : Constants.heartImage, for: .normal)
        heartButton.tintColor = isFavorited ? .systemRed : .systemGray
    }
}
