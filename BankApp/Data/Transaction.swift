//
//  Transaction.swift
//  BankApp
//
//  Created by noychus on 15.11.2024.
//

import Foundation

struct Transaction {
    enum TransactionType: String {
        case replenishment = "Incoming transfer"
        case payment = "Pharmacy"
    }
    
    let type: TransactionType
    let amount: String
    let date: Date
    let title: String
}
