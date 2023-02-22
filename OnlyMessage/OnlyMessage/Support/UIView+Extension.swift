//
//  UIView+Extension.swift
//  OnlyMessage
//
//  Created by Ali Amanvermez on 20.02.2023.
//

import Foundation
import UIKit

extension UIView {
  public func addSubviews(_ subviews: UIView...) {
    subviews.forEach(addSubview)
  }
  
  public func addSubviewsList(_ views: [UIView]) {
    views.forEach { addSubview($0) }
  }
}
