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
    }
    
    func setupLayout() {
        balanceStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
    }
}

#Preview(traits: .defaultLayout, body: {
    MainViewController()
})
