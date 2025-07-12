//
//  ProductDetailViewController.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import UIKit

final class ProductDetailViewController: BaseViewController {
    
    // MARK: - UI Components
    private var productImageView: ProductDetailImageView {
        let imageView = ProductDetailImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray5
        imageView.placeholderText = "Ürün Görseli"
        return imageView
    }
    
    private lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Abercrombie & Fitch"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sweatshirt"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var favoriteView: FavoriteView = {
        let view = FavoriteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ratingView: RatingView = {
        let view = RatingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "180.0 $"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    let timerManager = CountdownTimer(duration: 10)
    
    private lazy var timerView: CircularTimerView = {
        let view = CircularTimerView(timer: timerManager)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var installmentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "18"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Stack Views
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(productImageView)
        let mock = UIView()
        mock.backgroundColor = .clear
        
        mainStackView.addArrangedSubview(headerStackView)
        
        headerStackView.addArrangedSubview(titleStackView)
        
        titleStackView.addArrangedSubview(productTitleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        
        headerStackView.addArrangedSubview(favoriteView)
        
        mainStackView.addArrangedSubview(ratingView)
        mainStackView.addArrangedSubview(priceStackView)
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(timerView)
        
        mainStackView.addArrangedSubview(mock)
        
        
        
        // Setup components
        favoriteView.configure(count: 129, isFavorited: true)
        ratingView.configure(rating: 5.0, reviewCount: 26)
        timerView.startTimer()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // MainStack View
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Public Methods
    func configureWith(imageURL: String?) {
        productImageView.setImage(imageURL)
    }
    
}
extension ProductDetailViewController: CircularTimerViewDelegate {
    
    func didCountDownFinishCircularTimerView(_ view: CircularTimerView) {
        //
        showErrorAlert("done")
    }
    
}
