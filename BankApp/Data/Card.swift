//
//  Card.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit

struct Card {
    let paymentSystemImage: UIImage?
    let title: String
    let balance: String
    let owner: String
    let expirationDate: String
    let cardNumber: String
    let color: UIColor
    let transactions: [Transaction]
    
    var maskedCardNumber: String {
        guard cardNumber.count == 16 else { return cardNumber }
        let masked = String(repeating: "•", count: 12) + cardNumber.suffix(4)
        var formattedNumber = ""
        for (index, character) in masked.enumerated() {
            if index > 0 && index % 4 == 0 {
                formattedNumber.append(" ")
            }
            formattedNumber.append(character)
        }
        
        return formattedNumber
    }
    
    static func generateCards() -> [Card] {
        [
            .init(paymentSystemImage: UIImage(named: "logoVisa"), title: "Salary", balance: "$ 2,230", owner: "Andrey Karetnikov", expirationDate: "08/27", cardNumber: "4276839157462034", color: .Accent.mint, transactions: [
                Transaction(type: .replenishment, amount: "1000", date: Date(), title: "Transfer"),
                Transaction(type: .payment, amount: "1000", date: Date(), title: "Health"),
                
                // Для вчерашней даты
                Transaction(type: .payment, amount: "320", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "320", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 15 дней назад
                Transaction(type: .payment, amount: "600", date: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "600", date: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, title: "Transfer"),
                
                // Для 2 месяцев назад
                Transaction(type: .payment, amount: "2200", date: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "2200", date: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, title: "Transfer"),
                
                // Для 5 месяцев назад
                Transaction(type: .payment, amount: "8000", date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "8000", date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!, title: "Transfer"),
                
                // Для 1 года назад
                Transaction(type: .payment, amount: "-100", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "1100", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 1 года назад (другая дата)
                Transaction(type: .payment, amount: "7500", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "7500", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 2 лет назад
                Transaction(type: .payment, amount: "3500", date: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "3500", date: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, title: "Transfer" ),
                
                // Для 3 лет назад
                Transaction(type: .payment, amount: "1500", date: Calendar.current.date(byAdding: .year, value: -3, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "1500", date: Calendar.current.date(byAdding: .year, value: -3, to: Date())!, title: "Transfer"),
                
            ]),
            .init(paymentSystemImage: UIImage(named: "logoVisa"), title: "Savings account", balance: "$ 5,566", owner: "Maxim Zacepin", expirationDate: "06/25", cardNumber: "5291672394851167", color: .Accent.yellow, transactions: [
                Transaction(type: .replenishment, amount: "1000", date: Date(), title: "Transfer"),
                Transaction(type: .payment, amount: "1000", date: Date(), title: "Health"),
                
                // Для вчерашней даты
                Transaction(type: .payment, amount: "320", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "320", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 15 дней назад
                Transaction(type: .payment, amount: "600", date: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "600", date: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, title: "Transfer"),
                
                // Для 2 месяцев назад
                Transaction(type: .payment, amount: "2200", date: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "2200", date: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, title: "Transfer"),
                
                // Для 5 месяцев назад
                Transaction(type: .payment, amount: "8000", date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "8000", date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!, title: "Transfer"),
                
                // Для 1 года назад
                Transaction(type: .payment, amount: "1100", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "1100", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 1 года назад (другая дата)
                Transaction(type: .payment, amount: "7500", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "7500", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 2 лет назад
                Transaction(type: .payment, amount: "3500", date: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "3500", date: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, title: "Transfer" ),
                
                // Для 3 лет назад
                Transaction(type: .payment, amount: "1500", date: Calendar.current.date(byAdding: .year, value: -3, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "1500", date: Calendar.current.date(byAdding: .year, value: -3, to: Date())!, title: "Transfer"),
            ]),
            .init(paymentSystemImage: UIImage(named: "logoVisa"), title: "Savings account", balance: "$ 5,566", owner: "Ashot Nikalayan", expirationDate: "11/30", cardNumber: "3746218904568723", color: .Accent.lilac, transactions: [
                Transaction(type: .replenishment, amount: "1000", date: Date(), title: "Transfer"),
                Transaction(type: .payment, amount: "1000", date: Date(), title: "Health"),
                
                // Для вчерашней даты
                Transaction(type: .payment, amount: "320", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "320", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 15 дней назад
                Transaction(type: .payment, amount: "600", date: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "600", date: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, title: "Transfer"),
                
                // Для 2 месяцев назад
                Transaction(type: .payment, amount: "2200", date: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "2200", date: Calendar.current.date(byAdding: .month, value: -2, to: Date())!, title: "Transfer"),
                
                // Для 5 месяцев назад
                Transaction(type: .payment, amount: "8000", date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "8000", date: Calendar.current.date(byAdding: .month, value: -5, to: Date())!, title: "Transfer"),
                
                // Для 1 года назад
                Transaction(type: .payment, amount: "1100", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "1100", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 1 года назад (другая дата)
                Transaction(type: .payment, amount: "7500", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "7500", date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, title: "Transfer"),
                
                // Для 2 лет назад
                Transaction(type: .payment, amount: "3500", date: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "3500", date: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, title: "Transfer" ),
                
                // Для 3 лет назад
                Transaction(type: .payment, amount: "1500", date: Calendar.current.date(byAdding: .year, value: -3, to: Date())!, title: "Health"),
                Transaction(type: .replenishment, amount: "1500", date: Calendar.current.date(byAdding: .year, value: -3, to: Date())!, title: "Transfer"),
            ])
        ]
    }
}
