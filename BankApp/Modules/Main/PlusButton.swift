//
//  PlusButton.swift
//  BankApp
//
//  Created by noychus on 13.11.2024.
//

import Foundation
import UIKit

class PlusButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        let image = UIImage(named: "plus")
        self.setImage(image, for: .normal)
        self.backgroundColor = .Blocks.plusButtonBackground
        self.layer.cornerRadius = 10
    }
}
