//
//  QuotesHeaderCell.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit
import SnapKit

class QuotesHeaderCell: UITableViewCell {
    static let identifier = "QuotesHeaderCell"
    
    private let currenciesLabel  = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .gray
        return label
    }()
    
    private let buyLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .gray
        return label
    }()
    
    private let sellLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(with data: CurrenciesAndMetals) {
        currenciesLabel.text = data.currenciesLabel
        buyLabel.text = data.buyLabel
        sellLabel.text = data.sellLabel
    }
}

extension QuotesHeaderCell {
    private func setupUI() {
        addSubview(currenciesLabel)
        addSubview(buyLabel)
        addSubview(sellLabel)
    }
    
    private func setupLayout() {
        currenciesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
        }
        
        buyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(100)
        }
        
        sellLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
