//
//  UIImageView+Extension.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ url: String?) {
        guard let urlStr = url, let wrappedUrl = URL(string: urlStr) else {
            return
        }
        self.kf.setImage(with: wrappedUrl)
    }
}


