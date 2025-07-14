//
//  UILabelBuilder.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 14.07.2025.
//

import UIKit

final class UILabelBuilder {
    private var font: UIFont = .systemFont(ofSize: 17)
    private var textColor: UIColor = .label
    private var alignment: NSTextAlignment = .natural
    private var numberOfLines: Int = 1
    private var lineBreakMode: NSLineBreakMode = .byTruncatingTail
    private var text: String? = nil

    func setFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }

    func setTextColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }

    func setTextAlignment(_ alignment: NSTextAlignment) -> Self {
        self.alignment = alignment
        return self
    }

    func setNumberOfLines(_ lines: Int) -> Self {
        self.numberOfLines = lines
        return self
    }

    func setLineBreakMode(_ mode: NSLineBreakMode) -> Self {
        self.lineBreakMode = mode
        return self
    }

    func setText(_ text: String?) -> Self {
        self.text = text
        return self
    }

    func build() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = textColor
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.text = text
        return label
    }
}
