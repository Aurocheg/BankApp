//
//  OperationCollectionCell.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit
import SnapKit

class OperationCollectionCell: UICollectionViewCell {
    
    private let iconOperationImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let numberOperationLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let dateOperationLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .gray
        return label
    }()
    
    private let sumOperationLabel = {
        let label = UILabel()
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let rateCreditOperationLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .gray
        return label
    }()
    
    func setupData(with data: Operation) {
        iconOperationImageView.backgroundColor = data.iconBackground
        iconOperationImageView.image = data.image
        iconOperationImageView.layer.cornerRadius = Const.iconCornerRadius
        numberOperationLabel.text = data.number
        dateOperationLabel.text = data.date
        sumOperationLabel.text = data.sum
        rateCreditOperationLabel.text = data.rate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var reuseIdentifier: String { String(describing: self)}
}

extension OperationCollectionCell {
    func setupUI() {
        backgroundColor = .black
        layer.cornerRadius = Const.CornerRadius
        
        addSubview(iconOperationImageView)
        addSubview(numberOperationLabel)
        addSubview(dateOperationLabel)
        addSubview(sumOperationLabel)
        addSubview(rateCreditOperationLabel)
    }
    
    func setupLayout() {
        
        iconOperationImageView.snp.makeConstraints { make in
            make.size.equalTo(Const.IconSize)
            make.verticalEdges.equalToSuperview().inset(22)
            make.leading.equalToSuperview().inset(20)
        }
        
        numberOperationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.leading.equalTo(iconOperationImageView.snp.trailing).offset(8)
        }
        dateOperationLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOperationLabel.snp.bottom).offset(2)
            make.leading.equalTo(iconOperationImageView.snp.trailing).offset(8)
        }
        
        sumOperationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.trailing.equalToSuperview().inset(20)
        }
        
        rateCreditOperationLabel.snp.makeConstraints { make in
            make.top.equalTo(sumOperationLabel.snp.bottom).offset(2)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}

private enum Const {
    static let IconSize: CGSize = CGSize(width: 32, height: 32)
    static let iconCornerRadius: CGFloat = 10
    static let CornerRadius: CGFloat = 30
}
