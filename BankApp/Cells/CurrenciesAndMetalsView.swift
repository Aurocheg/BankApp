//
//  CurrenciesAndMetalsView.swift
//  BankApp
//
//  Created by noychus on 11.11.2024.
//

import Foundation
import UIKit
import SnapKit

class CurrenciesAndMetalsView: UIView {

    private let backgroundView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = Const.blocksCornerRadius
        return view
    }()

    private let currenciesLabel = {
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

    private let itemOneIconView = {
        let view = UIView()
        view.backgroundColor = .Accent.mint
        view.layer.cornerRadius = 7
        return view
    }()
    
    private let itemOneLogoView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let itemTwoIconView = {
        let view = UIView()
        view.backgroundColor = .Accent.mint
        view.layer.cornerRadius = 7
        return view
    }()
    
    private let itemTwoLogoView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let itemOneNameLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let itemTwoNameLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let itemOneBuyLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let itemOneSellLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let itemTwoBuyLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let itemTwoSellLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()

    init(with data: CurrenciesAndMetals) {
        super.init(frame: .zero)

        setupData(with: data)
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupData(with data: CurrenciesAndMetals) {
        currenciesLabel.text = data.currenciesLabel
        buyLabel.text = data.buyLabel
        sellLabel.text = data.sellLabel
        itemOneNameLabel.text = data.itemOne
        itemOneBuyLabel.text = data.itemOneBuy
        itemOneSellLabel.text = data.itemOneSell
        itemTwoNameLabel.text = data.itemTwo
        itemTwoBuyLabel.text = data.itemTwoBuy
        itemTwoSellLabel.text = data.itemTwoSell
        itemOneLogoView.image = data.itemOneImage
        itemTwoLogoView.image = data.itemTwoImage
    }
    
    private func setupUI() {
        addSubview(backgroundView)
        backgroundView.addSubview(currenciesLabel)
        backgroundView.addSubview(buyLabel)
        backgroundView.addSubview(sellLabel)
        backgroundView.addSubview(itemOneIconView)
        itemOneIconView.addSubview(itemOneLogoView)
        backgroundView.addSubview(itemTwoIconView)
        itemTwoIconView.addSubview(itemTwoLogoView)
        backgroundView.addSubview(itemOneNameLabel)
        backgroundView.addSubview(itemTwoNameLabel)
        backgroundView.addSubview(itemOneBuyLabel)
        backgroundView.addSubview(itemOneSellLabel)
        backgroundView.addSubview(itemTwoBuyLabel)
        backgroundView.addSubview(itemTwoSellLabel)
    }

    private func setupLayout() {
        backgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(Const.currenciesAndMetalsSize)
        }
        
        currenciesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(backgroundView.snp.leading).inset(20)
        }
        
        buyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(100)
        }
        
        sellLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        itemOneIconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(currenciesLabel.snp.bottom).offset(12)
            make.size.equalTo(Const.currenciesIcon)
        }
        
        itemOneLogoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(Const.currenciesLogo)
        }
        
        itemTwoIconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(itemOneIconView.snp.bottom).offset(12)
            make.size.equalTo(Const.currenciesIcon)
        }

        itemTwoLogoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(Const.currenciesLogo)
        }
        
        itemOneNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(itemOneIconView.snp.trailing).offset(12)
            make.top.equalTo(currenciesLabel.snp.bottom).offset(12)
        }

        itemTwoNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(itemTwoIconView.snp.trailing).offset(12)
            make.top.equalTo(itemOneNameLabel.snp.bottom).offset(12)
        }
        
        itemOneBuyLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(100)
            make.top.equalTo(sellLabel.snp.bottom).offset(12)
        }

        itemOneSellLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(buyLabel.snp.bottom).offset(12)
        }

        itemTwoBuyLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(100)
            make.top.equalTo(itemOneBuyLabel.snp.bottom).offset(12)
        }

        itemTwoSellLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(itemOneSellLabel.snp.bottom).offset(12)
        }
    }
}

private enum Const {
    static let currenciesLogo: CGSize = CGSize(width: 10, height: 10)
    static let currenciesIcon: CGSize = CGSize(width: 20, height: 20)
    static let currenciesAndMetalsSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 116)
    static let blocksCornerRadius: CGFloat = 30
}


