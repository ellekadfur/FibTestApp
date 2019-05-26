//
//  SummaryVC.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import UIKit

class SummaryVC: BaseVC {

  //MARK: - LifeCycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    CoreDataManager.shared.fibTime.setup(withVC: self)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.tableView.reloadData()
  }
  
}
