//
//  BaseImageView.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//
import UIKit

class BaseImageView: UIImageView {
    
    // MARK: - Placeholder Properties
    var placeholderImage: UIImage? {
        didSet {
            if image == nil {
                image = placeholderImage
            }
            updatePlaceholderText()
        }
    }
    
    var placeholderText: String? {
        didSet {
            updatePlaceholderText()
        }
    }
    
    private var placeholderLabel: UILabel?
    
    // MARK: - Style Properties
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // MARK: - Aspect Ratio Support
    var aspectRatio: ImageAspectRatio = .standard {
        didSet {
            updateAspectRatioConstraint()
        }
    }
    
    private var aspectRatioConstraint: NSLayoutConstraint?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        updateAspectRatioConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        updateAspectRatioConstraint()
    }
    
    // MARK: - Setup
    private func setupView() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        backgroundColor = UIColor.systemGray6
        image = placeholderImage
        setupPlaceholderLabel()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPlaceholderLabel() {
        placeholderLabel = UILabel()
        placeholderLabel?.textAlignment = .center
        placeholderLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        placeholderLabel?.textColor = UIColor.systemGray2
        placeholderLabel?.numberOfLines = 0
        
        if let label = placeholderLabel {
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: centerXAnchor),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: K.P.p2.negativeValue),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.P.p2.rawValue),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: K.P.p2.negativeValue)
            ])
        }
    }
    
    private func updatePlaceholderText() {
        placeholderLabel?.text = placeholderText
    }
    
    private func updateAspectRatioConstraint() {
        if let existing = aspectRatioConstraint {
            removeConstraint(existing)
        }
        let constraint = heightAnchor.constraint(equalTo: widthAnchor, multiplier: aspectRatio.multiplier)
        constraint.isActive = true
        aspectRatioConstraint = constraint
    }

    // MARK: - Public Methods
    func setPlaceholder() {
        image = placeholderImage
        updatePlaceholderText()
    }
    
    override var image: UIImage? {
        didSet {
            placeholderLabel?.isHidden = ConfigurationManager.environment == .prod
        }
    }
}
