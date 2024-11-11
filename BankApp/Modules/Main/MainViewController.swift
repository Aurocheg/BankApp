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
    private let cards: [Card] = Card.generateCards()
    
    private let categories: [Category] = Category.generateCategory()
    
    private let leftBarButtonItem = {
        let view = UIImageView()
        view.image = UIImage(named: "avatar")
        view.contentMode = .scaleToFill
        let button = UIBarButtonItem(customView: view)
        return button
    }()
    
    private let titleView = {
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
    
    private let titleCategory = {
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
    
    private var backgroundBlocksStack = {
        let view = UIView()
        view.backgroundColor = .Blocks.gray
        view.layer.cornerRadius = Const.blocksCornerRadius
        return view
    }()
    
    private var loansLabel = {
        let label = UILabel()
        label.text = "CURRENT LOANS"
        label.font = .Text.xxsmall
        label.textColor = .Text.light
        return label
    }()
    
    private var loansArrowButton = {
        let button = UIButton()
        let image = UIImage(named: "chevronLeft")
        button.setImage(image, for: .normal)
        return button
    }()
    
    private var loansPlusButton = {
        let button = UIButton()
        let image = UIImage(named: "plus")
        button.setImage(image, for: .normal)
        button.backgroundColor = .Blocks.plusButtonBackground
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var operationBackground = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = Const.blocksCornerRadius
        return view
    }()
    
    private let iconOperationView = {
        let view = UIView()
        view.backgroundColor = .Accent.mint
        view.layer.cornerRadius = Const.iconCornerRadius
        return view
    }()
    
    private let iconOperationImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "operationIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let numberOperationLabel = {
        let label = UILabel()
        label.text = "Account № 3874825"
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let dateOperationLabel = {
        let label = UILabel()
        label.text = "Expires 12/22/2023"
        label.font = .Text.xxsmall
        label.textColor = .gray
        return label
    }()
    
    private let sumOperationLabel = {
        let label = UILabel()
        label.text = "$ 78,92"
        label.font = .Text.regular
        label.textColor = .Text.light
        return label
    }()
    
    private let rateCreditOperationLabel = {
        let label = UILabel()
        label.text = "Rate 3.5%"
        label.font = .Text.xxsmall
        label.textColor = .gray
        return label
    }()
    
    private var bannerBackground = {
        let view = UIView()
        view.backgroundColor = .Blocks.bunnerColor
        view.layer.cornerRadius = Const.blocksCornerRadius
        return view
    }()
    
    private let iconView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = Const.iconCornerRadius
        return view
    }()
    
    private let iconImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoBanner")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabelBanner = {
        let label = UILabel()
        label.text = "Start investing now!"
        label.font = .Text.medium
        label.textColor = .Text.dark
        return label
    }()
    
    private let disctiprionLabelBanner = {
        let label = UILabel()
        label.text = "Protected savings and investment plans"
        label.font = .Text.xxsmall
        label.textColor = .Text.dark
        return label
    }()
    
    private let exitButtonBanner = {
        let view = UIImageView()
        view.image = UIImage(named: "exitButton")
        view.contentMode = .scaleToFill
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
}

private extension MainViewController {
    func setupUI() {
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.titleView = titleView
        
        view.addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(moneyStackView)
        
        moneyStackView.addArrangedSubview(moneyLabel)
        moneyStackView.addArrangedSubview(searchButton)
        
        view.addSubview(titleCategory)
        
        view.addSubview(cardsCollectionView)
        view.addSubview(categoryCollectionView)
        
        view.addSubview(backgroundBlocksStack)
        backgroundBlocksStack.addSubview(loansArrowButton)
        backgroundBlocksStack.addSubview(loansLabel)
        backgroundBlocksStack.addSubview(loansPlusButton)
        
        backgroundBlocksStack.addSubview(operationBackground)
        operationBackground.addSubview(iconOperationView)
        iconOperationView.addSubview(iconOperationImageView)
        operationBackground.addSubview(numberOperationLabel)
        operationBackground.addSubview(dateOperationLabel)
        operationBackground.addSubview(sumOperationLabel)
        operationBackground.addSubview(rateCreditOperationLabel)
        
        backgroundBlocksStack.addSubview(bannerBackground)
        bannerBackground.addSubview(iconView)
        iconView.addSubview(iconImageView)
        bannerBackground.addSubview(titleLabelBanner)
        bannerBackground.addSubview(disctiprionLabelBanner)
        bannerBackground.addSubview(exitButtonBanner)
        
    }
    
    func setupLayout() {
        balanceStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
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
        
        titleCategory.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(cardsCollectionView.snp.bottom).offset(40)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(titleCategory.snp.bottom).offset(12)
            make.height.equalTo(100)
        }
        
        backgroundBlocksStack.snp.makeConstraints { make in
            make.size.equalTo(Const.blocksBackgroudSize)
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(36)
        }
        
        loansArrowButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(26)
            make.width.height.equalTo(20)
        }
        
        loansLabel.snp.makeConstraints { make in
            make.leading.equalTo(loansArrowButton.snp.trailing).offset(8)
            make.top.equalToSuperview().inset(30)
        }
        
        loansPlusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(26)
            make.width.height.equalTo(20)
        }
        
        operationBackground.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(loansLabel.snp.bottom).offset(16)
            make.size.equalTo(Const.opetationSize)
        }
        
        iconOperationView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(22)
            make.size.equalTo(Const.operationIconSize)
        }
        
        iconOperationImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.center.equalToSuperview()
        }
        
        numberOperationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.leading.equalTo(iconOperationView.snp.trailing).offset(8)
        }
        
        dateOperationLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOperationLabel.snp.bottom).offset(2)
            make.leading.equalTo(iconOperationView.snp.trailing).offset(8)
        }
        
        sumOperationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.trailing.equalToSuperview().inset(20)
        }
        
        rateCreditOperationLabel.snp.makeConstraints { make in
            make.top.equalTo(sumOperationLabel.snp.bottom).offset(2)
            make.trailing.equalToSuperview().inset(20)
        }
        
        bannerBackground.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(operationBackground.snp.bottom).offset(16)
            make.size.equalTo(Const.bannerSize)
        }
        
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(22)
            make.size.equalTo(Const.iconBannerSize)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.center.equalToSuperview()
        }
        
        titleLabelBanner.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(8)
            make.top.equalToSuperview().inset(22)
        }
        
        disctiprionLabelBanner.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(8)
            make.top.equalTo(titleLabelBanner.snp.bottom)
        }
        
        exitButtonBanner.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(Const.exitButtonSize)
        }
    }
}
extension MainViewController: UICollectionViewDelegate {}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cardsCollectionView {
            return cards.count
        } else if collectionView == categoryCollectionView {
            return categories.count
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
        }
        return UICollectionViewCell()
    }
}



private enum Const {
    static let cardLineSpacing: CGFloat = 14
    static let cardSize = CGSize(width: 148, height: 170)
    
    static let categoryLineSpacing: CGFloat = 14
    static let categorySize = CGSize(width: 100, height: 100)
    
    static let blocksBackgroudSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
    static let blocksCornerRadius: CGFloat = 30
    
    static let opetationSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 76)
    static let operationIconSize: CGSize = CGSize(width: 32, height: 32)
    
    static let bannerSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 76)
    static let iconBannerSize: CGSize = CGSize(width: 32, height: 32)
    static let iconCornerRadius: CGFloat = 10
    static let exitButtonSize: CGSize = CGSize(width: 16, height: 16)
}

#Preview(traits: .defaultLayout, body: {
    MainViewController()
})
