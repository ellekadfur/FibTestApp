//
//  Main+TableView.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import UIKit

extension MainVC {
  
  //MARK: - UITableViewDataSource
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = CoreDataManager.shared.fibPair.fetchedResultsController.sections else { return 0 }
    let sectionInfo = sections[section]
    return sectionInfo.numberOfObjects
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    super.tableView(tableView, didSelectRowAt: indexPath)
    self.textField.resignFirstResponder()
  }
  
}
