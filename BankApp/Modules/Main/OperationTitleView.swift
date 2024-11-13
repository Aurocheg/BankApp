//
//  OperationTitleView.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit
import SnapKit

class OperationTitleView: UIView {
    private let loansArrowButton = {
        let button = UIButton()
        return button
    }()
    
    private let loansLabel = {
        let label = UILabel()
        label.font = .Text.xxsmall
        label.textColor = .Text.light
        return label
    }()
    
    init(with data: OperationTitle) {
        super.init(frame: .zero)
        
        setupData(with: data)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(with data: OperationTitle) {
        loansLabel.text = data.title.uppercased()
        loansArrowButton.setImage(data.buttonImage, for: .normal)
    }
    
    func setupUI() {
        addSubview(loansArrowButton)
        addSubview(loansLabel)
    }
    
    func setupLayout() {
        loansArrowButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(26)
            make.width.height.equalTo(20)
        }
        
        loansLabel.snp.makeConstraints { make in
            make.leading.equalTo(loansArrowButton.snp.trailing).offset(8)
            make.top.equalToSuperview().inset(30)
        }
    }
}
