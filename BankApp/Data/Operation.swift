//
//  Operation.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit

struct Operation {
    let number: String
    let sum: String
    let rate: String
    let date: String
    let image: UIImage?
    let iconBackground: UIColor?
    
    static func generateOperation() -> [Operation] {
        [
            .init(number: "Account № 3874825", sum: "$ 78,92", rate: "Rate 3.5%", date: "Expires 12/22/2023", image: UIImage(named: "operationIcon"), iconBackground: .Accent.mint),
            .init(number: "Account № 3874824", sum: "$ 55,98", rate: "Rate 3.5%", date: "Expires 12/21/2023", image: UIImage(named: "operationIcon"), iconBackground: .Accent.lilac),
            .init(number: "Account № 3874823", sum: "$ 20,22", rate: "Rate 3.5%", date: "Expires 12/20/2023", image: UIImage(named: "operationIcon"), iconBackground: .Accent.yellow),
            .init(number: "Account № 3874823", sum: "$ 20,22", rate: "Rate 3.5%", date: "Expires 12/20/2023", image: UIImage(named: "operationIcon"), iconBackground: .Accent.yellow)
        ]
    }
}
