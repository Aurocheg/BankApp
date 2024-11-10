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
        label.textColor = .white
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
        label.textColor = .white
        return label
    }()
    
    private let searchButton = {
        let button = UIButton()
        let image = UIImage(named: "search")
        button.setImage(image, for: .normal)
        return button
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
        
        view.addSubview(cardsCollectionView)
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
    }
}
extension MainViewController: UICollectionViewDelegate {}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionCell.reuseIdentifier, for: indexPath) as? CardCollectionCell else {
            return CardCollectionCell()
        }
        let currentCard = cards[indexPath.row]
        cell.setupData(with: currentCard)
        return cell
    }
}

private enum Const {
    static let cardLineSpacing: CGFloat = 13
    static let cardSize = CGSize(width: 148, height: 170)
}

#Preview(traits: .defaultLayout, body: {
    MainViewController()
})
