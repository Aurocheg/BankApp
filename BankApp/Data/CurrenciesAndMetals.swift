//
//  CurrenciesAndMetals.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit

struct CurrenciesAndMetals {
    var currenciesLabel: String
    var buyLabel: String
    var sellLabel: String
    var items: [Quotes]
    
    static func generateQuotes() -> [CurrenciesAndMetals] {
        [
            .init(currenciesLabel: "Currencie", buyLabel: "Buy", sellLabel: "Sell", items: [
                .init(name: "USD", buyPrice: "$ 78,92", sellPrice: "$ 78,92", logoImage: UIImage(named: "dollar")),
                .init(name: "EUR", buyPrice: "$ 78,92", sellPrice: "$ 78,92", logoImage: UIImage(named: "euro"))
            ]),
            .init(currenciesLabel: "Metals", buyLabel: "Buy", sellLabel: "Sell", items: [
                .init(name: "Gold", buyPrice: "$ 78,92", sellPrice: "$ 78,92", logoImage: UIImage(named: "metalsIcon")),
                .init(name: "Silver", buyPrice: "$ 78,92", sellPrice: "$ 78,92", logoImage: UIImage(named: "metalsIcon"))
            ])
        ]
    }
}
