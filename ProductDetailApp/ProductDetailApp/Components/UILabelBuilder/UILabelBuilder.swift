//
//  UILabelBuilder.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import UIKit

final class UILabelBuilder {
    private let label: UILabel

    init() {
        self.label = UILabel()
        self.label.translatesAutoresizingMaskIntoConstraints = false
    }

    @discardableResult
    func setFont(_ font: UIFont) -> Self {
        label.font = font
        return self
    }

    @discardableResult
    func setTextColor(_ color: UIColor) -> Self {
        label.textColor = color
        return self
    }

    @discardableResult
    func setTextAlignment(_ alignment: NSTextAlignment) -> Self {
        label.textAlignment = alignment
        return self
    }

    @discardableResult
    func setNumberOfLines(_ lines: Int) -> Self {
        label.numberOfLines = lines
        return self
    }

    @discardableResult
    func setLineBreakMode(_ mode: NSLineBreakMode) -> Self {
        label.lineBreakMode = mode
        return self
    }

    @discardableResult
    func setText(_ text: String?) -> Self {
        label.text = text
        return self
    }

    func build() -> UILabel {
        return label
    }
}
