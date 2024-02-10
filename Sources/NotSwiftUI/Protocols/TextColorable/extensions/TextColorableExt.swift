//
//  File.swift
//  
//
//  Created by Jonas Gamburg on 03.02.24.
//

import Foundation
import UIKit

extension UILabel: TextColorable {
    func setColor(_ color: UIColor) {
        textColor = color
    }
}

extension UIButton: TextColorable {
    func setColor(_ color: UIColor) {
        setTitleColor(color, for: .normal)
    }
}

extension UITextField: TextColorable {
    func setColor(_ color: UIColor) {
        textColor = color
    }
}

extension UITextView: TextColorable {
    func setColor(_ color: UIColor) {
        textColor = color
    }
}
