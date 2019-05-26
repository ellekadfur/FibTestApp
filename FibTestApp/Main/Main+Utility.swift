//
//  Main+Utility.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import UIKit

extension MainVC {
  
  //MARK: - Utility
  override func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
    guard let cell = cell as? LabelJustifiedCell else { return }
      let item = CoreDataManager.shared.fibPair.fetchedResultsController.object(at: indexPath)
      cell.setup(leftLabelText: item.value, rightLabelText: item.functionValue)
  }
  
  func displayResults(withDoubleValue doubleValue: Double) {
    ACProgressHUD.shared.showHUD()
    CoreDataManager.shared.fibPair.flushData()
    self.viewModel.executeFib(doubleValue) { [unowned self] calculationTime in
      self.totalCalculationTimeLabel.text = "Calculation Time \(calculationTime)"
      ACProgressHUD.shared.hideHUD()
      self.textField.resignFirstResponder()
    }
  }
  
   func wasBackSpacePressed(_ string: String) -> Bool {
    if let char = string.cString(using: String.Encoding.utf8) {
      let isBackSpace = strcmp(char, "\\b")
      if (isBackSpace == -92) {
        print("Backspace was pressed")
        return true
      }
    }
    return false
  }
  
}
