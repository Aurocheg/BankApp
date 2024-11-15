//
//  DetailCardViewController.swift
//  BankApp
//
//  Created by noychus on 14.11.2024.
//

import Foundation
import UIKit
import SnapKit

class DetailCardViewController: UIViewController {
    
    var card: Card? = Card.generateCards().first
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.black
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView = UIView()
    
    private let transactionsView = {
        let view = UIView()
        view.backgroundColor = .Blocks.gray
        view.layer.cornerRadius = Const.transactionsCornerRadius
        return view
    }()
    
    private let cardView = {
        let view = UIView()
        view.layer.cornerRadius = Const.cornerRadiusCard
        return view
    }()
    
    private let paymentSystemImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let ownerLabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .Text.xxsmall
        return label
    }()
    
    private let balanceLabel = {
        let label = UILabel()
        label.textColor = .Text.dark
        label.font = .Title.h2
        return label
    }()
    
    private let chipImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "chip")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let numberCardLabel = {
        let label = UILabel()
        label.textColor = .Text.dark
        label.font = .Title.h4
        return label
    }()
    
    private let validthruLabel = {
        let label = UILabel()
        label.text = "valid thru".uppercased()
        label.textColor = .gray
        label.font = .Text.xxsmall
        return label
    }()
    
    private let expirationDateLabel = {
        let label = UILabel()
        label.textColor = .Text.dark
        label.font = .Title.h4
        return label
    }()
    
    private let transactionsLabel = {
        let label = UILabel()
        label.text = "Transactions"
        label.font = .Title.h1
        label.textColor = .Text.light
        return label
    }()
    
    private lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    
    private var groupedTransactions: [TransactionSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        setupData()
    }
    
    func setupData() {
        if let card = card {
            cardView.backgroundColor = card.color
            paymentSystemImageView.image = card.paymentSystemImage ?? UIImage(named: "default_image")
            balanceLabel.text = card.balance
            numberCardLabel.text = card.maskedCardNumber
            ownerLabel.text = card.owner.uppercased()
            expirationDateLabel.text = card.expirationDate
            title = card.title
            groupTransactionsByDate(transactions: card.transactions)
            transactionsTableView.reloadData()
        }
    }
}

extension DetailCardViewController {
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(cardView)
        cardView.addSubview(paymentSystemImageView)
        cardView.addSubview(balanceLabel)
        cardView.addSubview(chipImageView)
        cardView.addSubview(numberCardLabel)
        cardView.addSubview(ownerLabel)
        cardView.addSubview(expirationDateLabel)
        cardView.addSubview(validthruLabel)
        contentView.addSubview(transactionsView)
        transactionsView.addSubview(transactionsLabel)
        transactionsView.addSubview(transactionsTableView)
    }
    
    func setupLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.bottom.equalTo(transactionsView.snp.bottom).offset(20)
        }
        
        cardView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.horizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(Const.heightCard)
        }
        
        paymentSystemImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(36)
            make.leading.equalToSuperview().inset(32)
            make.size.equalTo(Const.sizePaymentSystem)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(36)
            make.trailing.equalToSuperview().inset(30)
        }
        
        chipImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(balanceLabel.snp.bottom).offset(20)
            make.size.equalTo(Const.sizeChipImage)
        }
        
        numberCardLabel.snp.makeConstraints { make in
            make.top.equalTo(chipImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(30)
        }
        
        ownerLabel.snp.makeConstraints { make in
            make.top.equalTo(numberCardLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(30)
        }
        
        expirationDateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.top.equalTo(chipImageView.snp.bottom).offset(8)
        }
        
        validthruLabel.snp.makeConstraints { make in
            make.bottom.equalTo(expirationDateLabel.snp.top).offset(2)
            make.trailing.equalToSuperview().inset(30)
        }
        
        transactionsView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(cardView.snp.bottom).offset(60)
            make.height.equalTo(1800)
        }
        
        transactionsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(32)
        }
        
        transactionsTableView.snp.makeConstraints { make in
            make.top.equalTo(transactionsLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension DetailCardViewController {
    func groupTransactionsByDate(transactions: [Transaction]) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let sortedTransactions = transactions.sorted { $0.date > $1.date }
        
        var sections: [String: [Transaction]] = [:]
        
        for transaction in sortedTransactions {
            let dateString = formatter.string(from: transaction.date)
            
            if sections[dateString] == nil {
                sections[dateString] = []
            }
            sections[dateString]?.append(transaction)
        }
        
        groupedTransactions = sections.map { section in
            guard let date = formatter.date(from: section.key) else {
                return TransactionSection(title: "", transactions: [])
            }
            
            let sectionTitle: String
            let currentDate = Date()
            
            if Calendar.current.isDateInToday(date) {
                sectionTitle = "Today"
            } else if Calendar.current.isDateInYesterday(date) {
                sectionTitle = "Yesterday"
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd, yyyy"
                sectionTitle = dateFormatter.string(from: date)
            }
            
            return TransactionSection(title: sectionTitle, transactions: section.value)
        }
        
        groupedTransactions.sort { (section1, section2) -> Bool in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            
            let date1 = dateFormatter.date(from: section1.title) ?? Date.distantPast
            let date2 = dateFormatter.date(from: section2.title) ?? Date.distantPast
            
            if section1.title == "Today" { return true }
            if section2.title == "Today" { return false }
            
            if section1.title == "Yesterday" { return true }
            if section2.title == "Yesterday" { return false }
            
            return date1 > date2
        }
        
        
        print("Grouped Transactions Sections (after sorting): \(groupedTransactions)")
    }
}

extension DetailCardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedTransactions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedTransactions[section].transactions.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupedTransactions[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = groupedTransactions[indexPath.section].transactions[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        
        cell.transaction = transaction
        
        return cell
    }
}

extension DetailCardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let label = UILabel()
        label.text = groupedTransactions[section].title
        label.font = .Text.large
        label.textColor = .Text.light
        label.frame = CGRect(x: 16, y: 0, width: tableView.frame.width - 48, height: 20)
        
        headerView.addSubview(label)
        return headerView
    }
}

private enum Const {
    //Card
    static let heightCard: CGFloat = 184
    static let cornerRadiusCard: CGFloat = 30
    
    //PaymentSystem
    static let sizePaymentSystem: CGSize = CGSize(width: 48, height: 24)
    
    //ChipImage
    static let sizeChipImage: CGSize = CGSize(width: 28, height: 20)
    
    //TransactionsView
    static let transactionsCornerRadius: CGFloat = 30
}
