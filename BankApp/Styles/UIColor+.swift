//
//  UIColor+.swift
//  BankApp
//
//  Created by noychus on 10.11.2024.
//

import Foundation
import UIKit

extension UIColor {
    enum Accent {
        static let yellow = UIColor(red: 0.945, green: 0.992, blue: 0.55, alpha: 1)
        static let mint = UIColor(red: 0.695, green: 0.8125, blue: 0.804, alpha: 1)
        static let lilac = UIColor(red: 0.664, green: 0.617, blue: 0.714, alpha: 1)
    }
    
    enum Category {
        static let gray = UIColor(named: "grayColor2")
    }
    
    enum Blocks {
        static let gray = UIColor(named: "grayColor2")
        static let plusButtonBackground = UIColor(named: "plusButtonBackground")
        static let bunnerColor = UIColor(named: "bannerColor")
    }
    
    enum Text {
        static let dark = UIColor(red: 39/256, green: 42/256, blue: 50/256, alpha: 1)
        static let light = UIColor.white
    }
}
