//
//  CategoryCollectionCell.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit
import SnapKit

class CategoryCollectionCell: UICollectionViewCell {
    
    private let iconView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let iconBackgroundView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .Text.light
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
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
    
    func setupData(with category: Category) {
        backgroundColor = category.color
        iconView.image = category.image
        titleLabel.text = category.title
        iconBackgroundView.backgroundColor = category.imageColor
    }
    
    static var reuseIdentifier: String { String(describing: self)}
}

private extension CategoryCollectionCell {
    func setupUI() {
        layer.cornerRadius = Const.cornerRadius
        iconBackgroundView.layer.cornerRadius = Const.cornerRadiusIcon
        
        contentView.addSubview(iconBackgroundView)
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
    }
    
    func setupLayout() {
        iconBackgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
            make.size.equalTo(Const.sizeImageColor)
        }
        
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(20)
            make.size.equalTo(Const.sizeIcon)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(iconBackgroundView.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(16)
        }
    }
}

private enum Const {
    static let cornerRadius: CGFloat = 30
    static let sizeIcon: CGSize = CGSize(width: 24, height: 24)
    static let sizeImageColor: CGSize = CGSize(width: 32, height: 32)
    static let cornerRadiusIcon: CGFloat = 10
}