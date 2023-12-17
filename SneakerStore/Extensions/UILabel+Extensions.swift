//
//  UILabelExtensions.swift
//  SneakerStore
//
//  Created by Zhantore on 13.12.2023.
//

import Foundation
import UIKit

extension UILabel {
    static func regular(text: String, textAlign: NSTextAlignment = .center, size: CGFloat = 16, color: UIColor = .black) -> UILabel {
        return .init({
            $0.text = text
            $0.numberOfLines = 0
            $0.textColor = color
            $0.textAlignment = textAlign
            $0.font = UIFont.systemFont(ofSize: size)
        })
    }

    static func bold(text: String, textAlign: NSTextAlignment = .center, color: UIColor = .black, size: CGFloat = 16) -> UILabel {
        return .init({
            $0.text = text
            $0.numberOfLines = 0
            $0.textAlignment = textAlign
            $0.textColor = color
            $0.font = UIFont.systemFont(ofSize: size, weight: .bold)
        })
    }
}
