//
//  ViewController.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 10.07.2025.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            hideLoading()
        }
    }


}

