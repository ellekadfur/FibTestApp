//
//  Summary+Utility.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import UIKit

extension SummaryVC {
  
  //MARK: - Utility
  override func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
    guard let cell = cell as? LabelJustifiedCell else { return }
    let item = CoreDataManager.shared.fibTime.fetchedResultsController.object(at: indexPath)
    cell.setup(leftLabelText: item.value, rightLabelText: item.elapsedTime)
  }
  
}
