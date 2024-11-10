//
//  UIFont+.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit

extension UIFont {
    enum Title {
        // bold 25
        static let h1: UIFont = .systemFont(ofSize: 25, weight: .bold)
        // semibold 21
        static let h2: UIFont = .systemFont(ofSize: 21, weight: .semibold)
        // regular 21
        static let h3: UIFont = .systemFont(ofSize: 21, weight: .regular)
        // bold 17
        static let h4: UIFont = .systemFont(ofSize: 17, weight: .bold)
    }
    
    enum Text {
        // medium 17
        static let large: UIFont = .systemFont(ofSize: 17, weight: .medium)
        // medium 16
        static let medium: UIFont = .systemFont(ofSize: 16, weight: .medium)
        // regular 16
        static let regular: UIFont = .systemFont(ofSize: 16)
        // semibold 15
        static let small: UIFont = .systemFont(ofSize: 15, weight: .semibold)
        // regular 15
        static let xsmall: UIFont = .systemFont(ofSize: 15)
        // medium 11
        static let xxsmall: UIFont = .systemFont(ofSize: 11, weight: .medium)
        // medium 10
        static let xxxsmall: UIFont = .systemFont(ofSize: 10, weight: .medium)
    }
}
