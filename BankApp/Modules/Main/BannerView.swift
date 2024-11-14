//
//  BannerView.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit
import SnapKit

class BannerView: UIView {
    
    private let iconImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Const.iconCornerRadius
        return imageView
    }()
    
    private let titleBannerLabel = {
        let label = UILabel()
        label.font = .Text.medium
        label.textColor = .Text.dark
        return label
    }()
    
    private let discriptionBannerLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .Text.dark
        return label
    }()
    
    private let exitBannerButton = {
        let button = UIButton()
        let image = UIImage(named: "exitButton")
        button.setImage(image, for: .normal)
        return button
    }()
    
    init(with data: Banner) {
        super.init(frame: .zero)
        
        setupData(with: data)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(with data: Banner) {
        backgroundColor = data.background
        iconImageView.backgroundColor = data.backgroundIcon
        iconImageView.image = data.iconImage
        titleBannerLabel.text = data.title
        discriptionBannerLabel.text = data.discription
    }
}

extension BannerView {
    func setupUI() {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = Const.cornerRadius
        addSubview(iconImageView)
        addSubview(titleBannerLabel)
        addSubview(discriptionBannerLabel)
        addSubview(exitBannerButton)
    }
    
    func setupLayout() {
        
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(22)
            make.size.equalTo(Const.iconBannerSize)
        }
        
        titleBannerLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().inset(22)
        }
        
        discriptionBannerLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.top.equalTo(titleBannerLabel.snp.bottom)
        }
        
        exitBannerButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(Const.exitButtonSize)
        }
    }
}

private enum Const {
    static let cornerRadius: CGFloat = 30
    static let bannerSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 76)
    static let iconBannerSize: CGSize = CGSize(width: 32, height: 32)
    static let iconCornerRadius: CGFloat = 10
    static let exitButtonSize: CGSize = CGSize(width: 16, height: 16)
}
