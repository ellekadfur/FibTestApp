//
//  UIView+Extension.swift
//  AppNaqBase
//
//  Created by Lamar Jay Caaddfiir on 12/25/18.
//  Copyright © 2018 AppNaq, LLC. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIView
extension UIView {
  
  static func identifier() -> String {
    return String(describing: self)
  }
  
  static func nib() -> UINib {
    return UINib(nibName: String(describing: self), bundle:nil)
  }

}
