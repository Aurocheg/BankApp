//
//  Category.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit

struct Category {
    let image: UIImage?
    let title: String
    let color: UIColor?
    let imageColor: UIColor
    
    static func generateCategory() -> [Category] {
        [
            .init(image: UIImage(named: "star"), title: "My bonuses", color: .Category.gray, imageColor: .Accent.mint),
            .init(image: UIImage(named: "wallet"), title: "My budget", color: .Category.gray, imageColor: .Accent.yellow),
            .init(image: UIImage(named: "schedule"), title: "Finance analysis", color: .Category.gray, imageColor: .Accent.lilac),
            .init(image: UIImage(named: "star"), title: "Finance analysis", color: .Category.gray, imageColor: .Accent.mint)
        ]
    }
}
