//
//  UIImageView+Extension.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//

import UIKit
//import SDWebImage
extension UIImageView {
    func setImage(_ url:String?) {
           
           guard let urlStr = url else {
//               self.image = UIImage(named: "appHotNews")
               return
           }
           let wrappedUrl = URL(string: urlStr)
//           self.sd_setImage(with: wrappedUrl)
        self.image = nil
       }
}


