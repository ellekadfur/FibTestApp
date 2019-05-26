//
//  Main+TextFieldDelegate.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UITextFieldDelegate {
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return string.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField.hasText, let text = textField.text, let doubleValue = Double(text) {
      self.displayResults(withDoubleValue: doubleValue)
      return true
    }
    return false
  }
  
}
