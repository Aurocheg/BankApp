//
//  MainViewController.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit
import SnapKit

class MainViewController: UIViewController {
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.black
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView = UIView()
    
    private let quotes: [CurrenciesAndMetals] = CurrenciesAndMetals.generateQuotes()
    
    private let cards: [Card] = Card.generateCards()
    
    private let categories: [Category] = Category.generateCategory()
    
    private let operations: [Operation] = Operation.generateOperation()
    
    private let leftBarItemButton = {
        let view = UIImageView()
        view.image = UIImage(named: "avatar")
        view.contentMode = .scaleToFill
        let button = UIBarButtonItem(customView: view)
        return button
    }()
    
    private let titleImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let balanceStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private let balanceLabel = {
        let label = UILabel()
        label.text = "Your balance"
        label.font = .Text.xsmall
        label.textColor = .Text.light
        return label
    }()
    
    private let moneyStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    private let moneyLabel = {
        let label = UILabel()
        label.text = "$ 7.896"
        label.font = .Title.h1
        label.textColor = .Text.light
        return label
    }()
    
    private let searchButton = {
        let button = UIButton()
        let image = UIImage(named: "search")
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let titleCategoryLabel = {
        let label = UILabel()
        label.text = "FINANCE"
        label.font = .Text.xxsmall
        label.textColor = .Text.light
        return label
    }()
    
    private lazy var cardsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Const.cardLineSpacing
        layout.itemSize = Const.cardSize
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.register(CardCollectionCell.self, forCellWithReuseIdentifier: CardCollectionCell.reuseIdentifier)
        return view
    }()
    
    private lazy var categoryCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Const.cardLineSpacing
        layout.itemSize = Const.categorySize
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.reuseIdentifier)
        return view
    }()
    
    private lazy var operationCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Const.operationLineSpacing
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 76)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.register(OperationCollectionCell.self, forCellWithReuseIdentifier: OperationCollectionCell.reuseIdentifier)
        return view
    }()
    
    private lazy var headerTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 36
        tableView.isScrollEnabled = false
        tableView.register(QuotesHeaderCell.self, forCellReuseIdentifier: QuotesHeaderCell.identifier)
        return tableView
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40
        tableView.showsVerticalScrollIndicator = false
        tableView.register(QuotesMainCell.self, forCellReuseIdentifier: QuotesMainCell.identifier)
        return tableView
    }()
    
    private lazy var verticalTableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.layer.cornerRadius = 30
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    private let blocksView = {
        let view = UIView()
        view.backgroundColor = .Blocks.gray
        view.layer.cornerRadius = Const.blocksCornerRadius
        return view
    }()
    
    private let currentLoansView = OperationTitleView(with: OperationTitle(buttonImage: UIImage(named: "chevronLeft"), title: "Current loans"))
    
    private let loansPlusButton = PlusButton()
    
    private let startInvestingBanner = BannerView(with: Banner(background: .Blocks.bunnerColor ?? .cyan, backgroundIcon: .black, iconImage: UIImage(named: "logoBanner"), title: "Start investing now!", discription: "Protected savings and investment plans"))
    
    private let currenciesAndMetalsLabel = OperationTitleView(with: OperationTitle(buttonImage: UIImage(named: "chevronLeft"), title: "Currencies and metals"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
}

private extension MainViewController {
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        navigationItem.leftBarButtonItem = leftBarItemButton
        navigationItem.titleView = titleImageView
        
        contentView.addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(moneyStackView)
        
        moneyStackView.addArrangedSubview(moneyLabel)
        moneyStackView.addArrangedSubview(searchButton)
        
        contentView.addSubview(titleCategoryLabel)
        
        contentView.addSubview(cardsCollectionView)
        contentView.addSubview(categoryCollectionView)
        
        contentView.addSubview(blocksView)
        blocksView.addSubview(currentLoansView)
        blocksView.addSubview(loansPlusButton)
        
        blocksView.addSubview(operationCollectionView)
        
        blocksView.addSubview(startInvestingBanner)
        
        blocksView.addSubview(currenciesAndMetalsLabel)
        blocksView.addSubview(verticalTableStackView)
        verticalTableStackView.addArrangedSubview(headerTableView)
        verticalTableStackView.addArrangedSubview(mainTableView)
    }
    
    func setupLayout() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        balanceStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
        
        cardsCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(balanceStackView.snp.bottom).offset(24)
            make.height.equalTo(170)
        }
        
        titleCategoryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(cardsCollectionView.snp.bottom).offset(40)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(titleCategoryLabel.snp.bottom).offset(12)
            make.height.equalTo(100)
        }
        
        blocksView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(36)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
        
        currentLoansView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(20)
        }
        
        loansPlusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(26)
            make.width.height.equalTo(20)
        }
        
        operationCollectionView.snp.makeConstraints { make in
            make.top.equalTo(currentLoansView.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(operations.count * 90)
        }
        
        startInvestingBanner.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(operationCollectionView.snp.bottom)
            make.size.equalTo(Const.bannerSize)
        }
        
        currenciesAndMetalsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(startInvestingBanner.snp.bottom).offset(26)
            make.height.equalTo(20)
        }
        
        currenciesAndMetalsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(startInvestingBanner.snp.bottom)
        }
        
        headerTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(36)
            make.leading.trailing.equalToSuperview()
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(headerTableView.snp.bottom).offset(12)
            make.height.equalTo(80)
            make.horizontalEdges.equalToSuperview()
        }
        
        verticalTableStackView.snp.makeConstraints { make in
            make.top.equalTo(currenciesAndMetalsLabel.snp.bottom).offset(36)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(50)
            make.height.equalTo(130)
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cardsCollectionView {
            return cards.count
        } else if collectionView == categoryCollectionView {
            return categories.count
        } else if collectionView == operationCollectionView {
            return operations.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cardsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionCell.reuseIdentifier, for: indexPath) as? CardCollectionCell else {
                return CardCollectionCell()
            }
            let currentCard = cards[indexPath.row]
            cell.setupData(with: currentCard)
            return cell
        } else if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.reuseIdentifier, for: indexPath) as? CategoryCollectionCell else {
                return CategoryCollectionCell()
            }
            let currentCategory = categories[indexPath.row]
            cell.setupData(with: currentCategory)
            return cell
        } else if collectionView == operationCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OperationCollectionCell.reuseIdentifier, for: indexPath) as? OperationCollectionCell else {
                return OperationCollectionCell()
            }
            let currentOperation = operations[indexPath.row]
            cell.setupData(with: currentOperation)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == headerTableView {
            return 1
        } else if tableView == mainTableView {
            return quotes.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == headerTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuotesHeaderCell.identifier, for: indexPath) as? QuotesHeaderCell else {
                return UITableViewCell()
            }
            
            guard let headerData = quotes.first else { return UITableViewCell() }
            cell.isUserInteractionEnabled = false
            cell.setupData(with: headerData)
            return cell
            
        } else if tableView == mainTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuotesMainCell.identifier, for: indexPath) as? QuotesMainCell else {
                return UITableViewCell()
            }
            
            let sectionData = quotes[indexPath.section]
            let itemData = sectionData.items[indexPath.row]
            cell.isUserInteractionEnabled = false
            cell.setupData(with: itemData)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == headerTableView {
            return 36
        } else {
            return 40
        }
    }
}

extension MainViewController: UICollectionViewDelegate {}

private enum Const {
    static let cardLineSpacing: CGFloat = 14
    static let cardSize = CGSize(width: 148, height: 170)
    
    static let categoryLineSpacing: CGFloat = 14
    static let categorySize = CGSize(width: 100, height: 100)
    
    static let operationLineSpacing: CGFloat = 14
    static let operationSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 76)
    
    static let blocksBackgroudSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
    static let blocksCornerRadius: CGFloat = 30
    
    static let bannerSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 76)
    
    static let currenciesAndMetalsSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 116)
}

#Preview(traits: .defaultLayout, body: {
    MainViewController()
})
