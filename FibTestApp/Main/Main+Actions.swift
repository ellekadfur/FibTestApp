//
//  Main+Actions.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation

extension MainVC {
  
  //MARK: - Actions
  @IBAction func onTouchSummary(_ sender: Any) {
    if CoreDataManager.shared.fibTime.fetchReady() {
      self.performSegue(withIdentifier: SummaryVC.identifier(), sender: nil)
    } else {
      Utility.displayAlertController(withVC: self, withAlertStyle: .alert, withTitle: "Oops", withMesssage: "Generated fibonacci sequences, then try again.")
    }
  }
  
}
