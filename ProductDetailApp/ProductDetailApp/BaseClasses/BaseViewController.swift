//
//  BaseViewController.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 10.07.2025.
//

import UIKit

class BaseViewController: UIViewController {
    
    var viewModel: BaseViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(viewModel: BaseViewModelProtocol) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel?.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension BaseViewController: Loadable {}
extension BaseViewController: ErrorPresentable {}
extension BaseViewController: SuccessPresentable {}

extension BaseViewController: BaseViewModelDelegate {
    func viewModelDidStartLoading() {
        showLoading()
    }
    
    func viewModelDidFinishLoading() {
        hideLoading()
    }
    
    func viewModelDidReceiveError(_ message: String) {
        showErrorAlert(message)
    }
    
}
