//
//  TransactionCell.swift
//  BankApp
//
//  Created by noychus on 15.11.2024.
//

import Foundation
import UIKit
import SnapKit

class TransactionCell: UITableViewCell {
    
    var transaction: Transaction? {
        didSet {
            updateData()
        }
    }
    
    private let view = {
        let view = UIView()
        return view
    }()
    
    private let transactionImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let transactionTitleLabel = {
        let label = UILabel()
        label.textColor = .Text.light
        label.font = .Title.h4
        return label
    }()
    
    private let typeLabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .Text.xsmall
        return label
    }()
    
    private let amountLabel = {
        let label = UILabel()
        label.textColor = .Text.light
        label.font = .Title.h4
        return label
    }()
    
    private func updateData() {
        if let transaction = transaction {
            typeLabel.text = transaction.type == .payment ? "Pharmacy" : "Incoming transfer"
            transactionTitleLabel.text = transaction.title
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, yyyy"
            
            if transaction.type == .payment {
                transactionImageView.image = UIImage(named: "pharmacy")
                amountLabel.text = "- $" + transaction.amount
            } else {
                transactionImageView.image = UIImage(named: "incomingTransfer")
                amountLabel.text = "+ $" + transaction.amount
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransactionCell {
    func setupUI() {
        backgroundColor = .clear
        addSubview(view)
        view.addSubview(transactionImageView)
        view.addSubview(transactionTitleLabel)
        view.addSubview(typeLabel)
        view.addSubview(amountLabel)
    }
    
    func setupLayout() {
        view.snp.makeConstraints { make in
            make.height.equalTo(76)
            make.horizontalEdges.equalToSuperview()
        }
        
        transactionImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        transactionTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(transactionImageView.snp.trailing).offset(16)
            make.top.equalTo(transactionImageView.snp.top).offset(-4)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.leading.equalTo(transactionImageView.snp.trailing).offset(16)
            make.top.equalTo(transactionTitleLabel.snp.bottom)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private enum Const {
        static let sizeTransactionImageView: CGSize = CGSize(width: 32, height: 32)
    }
}
