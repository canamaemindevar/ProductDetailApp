//
//  ProductDetailViewController.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import UIKit

final class ProductDetailViewController: BaseViewController {
    
    // MARK: - UI Components
    private lazy var productImageView: ProductDetailImageView = {
        let imageView = ProductDetailImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray5
        imageView.placeholderText = "Image here"
        return imageView
    }()
    
    private lazy var productTitleLabel: UILabel = {
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 20, weight: .medium))
            .setTextColor(.label)
            .build()
    }()
    
    private lazy var subtitleLabel: UILabel = {
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 16, weight: .regular))
            .setTextColor(.systemGray)
            .build()
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
        UILabelBuilder()
            .setFont(.systemFont(ofSize: 28, weight: .bold))
            .setTextColor(.label)
            .build()
    }()
    
    private let timerManager = CountdownTimer(duration: 60)
    
    private lazy var timerView: CircularTimerView = {
        let view = CircularTimerView(timer: timerManager)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Stack Views
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = K.P.p4.rawValue
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
        stackView.spacing = K.P.p1.rawValue
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

}

// MARK: - Setup Methods
private extension ProductDetailViewController {
 
    func setupUI() {
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
    
        productImageView.isHidden = true
        ratingView.isHidden = true
        favoriteView.isHidden = true
        timerView.isHidden = true
        
        priceLabel.isHidden = true
        subtitleLabel.isHidden = true
        
        (viewModel as? ProductDetailViewModel)?.fetchProductDetail()
        (viewModel as? ProductDetailViewModel)?.fetchSocial()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: K.P.p4.rawValue),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: K.P.p4.rawValue.negativeValue),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
// MARK: - Private Methods
private extension ProductDetailViewController {
    
    func setViewsWithProduct(detail: ProductResponse) {
        DispatchQueue.main.async {
            self.productTitleLabel.text = detail.name
            self.priceLabel.text = "\(String(detail.price?.value ?? 0)) \(detail.price?.currency ?? "")"
            self.subtitleLabel.text = detail.desc
            self.productImageView.setImage(detail.image)
        }
        productImageView.isHidden = false
        priceLabel.isHidden = false
        subtitleLabel.isHidden = false
    }
    
    func setViewsWithSocial(social: SocialResponse) {
        DispatchQueue.main.async {
            self.favoriteView.configure(count: social.likeCount ?? 0, isFavorited: true)
            self.ratingView.configure(rating: Double(social.commentCounts?.averageRating ?? 0), reviewCount:  social.commentCounts?.totalCommentsCount ?? 0)
           
        }
        
        ratingView.isHidden = false
        favoriteView.isHidden = false
        timerView.isHidden = false
        timerView.resetTimer()
    }
}

// MARK: - CircularTimerViewDelegate
extension ProductDetailViewController: CircularTimerViewDelegate {
    
    func didCountDownFinishCircularTimerView(_ view: CircularTimerView) {
        (viewModel as? ProductDetailViewModel)?.fetchSocial()
    }
}

// MARK: - ProductDetailViewModelInterface
extension ProductDetailViewController: ProductDetailViewModelInterface {
    
    func didProductFetch(detail: ProductResponse) {
        setViewsWithProduct(detail: detail)
    }
    
    func didSocialtFetch(social: SocialResponse) {
        setViewsWithSocial(social: social)
    }
}

