//
//  CardCollectionCell.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit
import SnapKit

class CardCollectionCell: UICollectionViewCell {
    private let iconView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var textStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        view.axis = .vertical
        view.spacing = 2
        return view
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .Text.dark
        return label
    }()
    
    private let valueLabel = {
        let label = UILabel()
        label.font = .Title.h2
        label.textColor = .Text.dark
        return label
    }()
    
    private let lastFourDigitsLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .Text.dark
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(with card: Card) {
        backgroundColor = card.color
        iconView.image = card.image
        titleLabel.text = card.title
        valueLabel.text = card.value
        lastFourDigitsLabel.text = card.lastDigitsText
    }
    
    static var reuseIdentifier: String { String(describing: self)}
}


private extension CardCollectionCell {
    func setupUI() {
        layer.cornerRadius = Const.cornerRadius
        
        contentView.addSubview(iconView)
        contentView.addSubview(textStackView)
        contentView.addSubview(lastFourDigitsLabel)
    }
    
    func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(16)
            make.size.equalTo(Const.iconSize)
        }
        
        textStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(iconView.snp.bottom).offset(30)
        }
        
        lastFourDigitsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

private enum Const {
    static let cornerRadius: CGFloat = 30
    static let iconSize = CGSize(width: 40, height: 20)
}
