//
//  UIButton+Extensions.swift
//  SneakerStore
//
//  Created by Admin  on 16.12.2023.
//

import Foundation
import UIKit

extension UIButton {
    static func cornered(titleText: String, backgroundColor: UIColor = .black, titleTextFontSize: CGFloat = 17, textColor: UIColor = .white) -> UIButton {
        let btn = UIButton()
        btn.layer.cornerRadius = 28
        btn.backgroundColor = backgroundColor
        btn.setTitle(titleText, for: .normal)
        btn.titleLabel?.textColor = textColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: titleTextFontSize, weight: .bold)
        return btn
    }
}
