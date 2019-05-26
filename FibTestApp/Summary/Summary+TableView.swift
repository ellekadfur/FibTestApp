//
//  Summary+TableView.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import UIKit

extension SummaryVC {
  
  //MARK: - UITableViewDataSource
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = CoreDataManager.shared.fibTime.fetchedResultsController.sections else { return 0 }
    let sectionInfo = sections[section]
    return sectionInfo.numberOfObjects
  }
    
}
