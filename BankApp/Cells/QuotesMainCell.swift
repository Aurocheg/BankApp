//
//  QuotesMainCell.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit
import SnapKit

class QuotesMainCell: UITableViewCell {
    static let identifier = "QuotesMainCell"
    
    private let itemIconView = {
        let view = UIView()
        view.backgroundColor = .Accent.mint
        view.layer.cornerRadius = 7
        return view
    }()
    
    private let itemLogoImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .Accent.mint
        return imageView
    }()
    
    private let itemNameLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let itemBuyLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let itemSellLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
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
    
    func setupData(with data: Quotes) {
        itemNameLabel.text = data.name
        itemBuyLabel.text = data.buyPrice
        itemSellLabel.text = data.sellPrice
        itemLogoImageView.image = data.logoImage
    }
}

extension QuotesMainCell {
    private func setupUI() {
        
        addSubview(itemIconView)
        itemIconView.addSubview(itemLogoImageView)
        addSubview(itemNameLabel)
        addSubview(itemBuyLabel)
        addSubview(itemSellLabel)
    }
    
    private func setupLayout() {
        itemIconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalToSuperview()
        }
        
        itemLogoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 10, height: 10))
            make.centerY.equalToSuperview()
        }
        
        itemNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(itemIconView.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
        }
        
        itemBuyLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(100)
            make.centerY.equalToSuperview()
        }
        
        itemSellLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
}
