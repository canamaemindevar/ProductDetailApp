//
//  CircularTimerConfiguration.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 11.07.2025.
//

import UIKit.UIKitCore


struct CountdownConfig {
    let duration: Int
    let ringColor: UIColor
    let textColor: UIColor
    let lineWidth: CGFloat
    
    init(
        duration: Int = 10,
        ringColor: UIColor = .orange,
        textColor: UIColor = .black,
        lineWidth: CGFloat = 10
    ) {
        self.duration = duration
        self.ringColor = ringColor
        self.textColor = textColor
        self.lineWidth = lineWidth
    }
}
