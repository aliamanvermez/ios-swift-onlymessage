//
//  UIButton+Extension.swift
//  OnlyMessage
//
//  Created by Ali Amanvermez on 20.02.2023.
//

import Foundation
import UIKit
extension UIButton {
    func setRoundedButton(button : UIButton) {
        button.backgroundColor = .systemBackground
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.setTitleColor(UIColor.systemBlue, for: .normal)
    }
}
