//
//  Card.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit

struct Card {
    let image: UIImage?
    let title: String
    let value: String
    let lastDigitsText: String
    let color: UIColor
    
    static func generateCards() -> [Card] {
        [
            .init(image: UIImage(named: "visa"), title: "Salary", value: "$ 2,230", lastDigitsText: "** 6917", color: .Accent.mint),
            .init(image: UIImage(named: "visa"), title: "Savings account", value: "$ 5,566", lastDigitsText: "** 4552", color: .Accent.yellow),
            .init(image: UIImage(named: "visa"), title: "Savings account", value: "$ 5,566", lastDigitsText: "** 4552", color: .Accent.lilac)
        ]
    }
}
