//
//  CoreDataManager+FibPair.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension CoreDataManager {
  class FibPairManager {
    
    lazy var fetchedResultsController: NSFetchedResultsController<FibPair> = {
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      let managedContext = CoreDataManager.shared.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<FibPair>(entityName: FibPair.description())
      fetchRequest.fetchLimit = 10
      fetchRequest.fetchOffset = 10
      let sortDescriptor = NSSortDescriptor(key: FibPair.Attribute.value.rawValue, ascending: false)
      fetchRequest.sortDescriptors = [sortDescriptor]
      let fetchedResultsController = NSFetchedResultsController<FibPair>(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
      //    fetchedResultsController.delegate = self
      return fetchedResultsController
    }()
    
    func setup(withVC VC: BaseVC){
      self.fetchedResultsController.delegate = VC
      do{
        try self.fetchedResultsController.performFetch()
      }catch{
        print(error)
      }
    }
    
    func insert(value: String, functionValue: String) {
      let managedContext = CoreDataManager.shared.persistentContainer.viewContext
      let entity = NSEntityDescription.entity(forEntityName: FibPair.description(), in: managedContext)!
      let item = NSManagedObject(entity: entity, insertInto: managedContext)
      item.setValue(value, forKeyPath: FibPair.Attribute.value.rawValue)
      item.setValue(functionValue, forKeyPath: FibPair.Attribute.functionValue.rawValue)
      do {
        try managedContext.save()
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
    
    func fetchAll() -> [FibPair]? {
      let managedContext = CoreDataManager.shared.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: FibPair.description())
      do {
        let items = try managedContext.fetch(fetchRequest)
        return items as? [FibPair]
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
        return nil
      }
    }
    
    func flushData() {
      let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: FibPair.description())
      let objs = try! CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
      for case let obj as NSManagedObject in objs {
        CoreDataManager.shared.persistentContainer.viewContext.delete(obj)
      }
      do {
        try CoreDataManager.shared.persistentContainer.viewContext.save()
      } catch let error as NSError {
        print("Could not flush. \(error), \(error.userInfo)")
      }
    }
    
  }
}
