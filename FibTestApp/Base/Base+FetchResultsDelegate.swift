//
//  Base+FetchResultsDelegate.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import CoreData

extension BaseVC : NSFetchedResultsControllerDelegate {
  
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    self.tableView.beginUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    
//    print("B. NSFetchResultController didChange NSFetchedResultsChangeType \(type.rawValue):)")
    
    switch (type) {
    case .insert:
      if let indexPath = newIndexPath {
        self.tableView.insertRows(at: [indexPath], with: .fade)
      }
      break;
    case .delete:
      if let indexPath = indexPath {
        self.tableView.deleteRows(at: [indexPath], with: .fade)
      }
      break;
    case .update:
      if let indexPath = indexPath, let cell = self.tableView.cellForRow(at: indexPath) {
        self.configureCell(cell, at: indexPath)
      }
      break;
      
    case .move:
      if let indexPath = indexPath {
        self.tableView.deleteRows(at: [indexPath], with: .fade)
      }
      if let newIndexPath = newIndexPath {
        self.tableView.insertRows(at: [newIndexPath], with: .fade)
      }
      break;
      
    @unknown default:
      break
    }
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    self.tableView.endUpdates()
  }
  
}




