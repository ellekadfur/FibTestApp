//
//  CoreDataManager.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
  
  //MARK: - Properties
  static let shared = CoreDataManager()  
  lazy var fibTime: FibTimeManager = {
    let fibTime = FibTimeManager()
    return fibTime
  }()
  lazy var fibPair: FibPairManager = {
    let fibPair = FibPairManager()
    return fibPair
  }()
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "FibTestApp")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  //MARK: - LifeCycle
  private init() { }
  
  func saveContext () {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
}
