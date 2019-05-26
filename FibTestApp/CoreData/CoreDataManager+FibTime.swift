//
//  CoreDataManager+FibTime.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension CoreDataManager {
  class FibTimeManager {
    
    lazy var fetchedResultsController: NSFetchedResultsController<FibTime> = {
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      let managedContext = CoreDataManager.shared.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<FibTime>(entityName: FibTime.description())
      let sortDescriptor = NSSortDescriptor(key: FibTime.Attribute.order.rawValue, ascending: true)
      fetchRequest.sortDescriptors = [sortDescriptor]
      fetchRequest.fetchBatchSize = 15
      let fetchedResultsController = NSFetchedResultsController<FibTime>(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
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
    
    func insert(order: Double, value: String, elapsedTime: String) {
      let managedContext = CoreDataManager.shared.persistentContainer.viewContext
      let entity = NSEntityDescription.entity(forEntityName: FibTime.description(), in: managedContext)!
      let item = NSManagedObject(entity: entity, insertInto: managedContext)
      item.setValue(order, forKeyPath: FibTime.Attribute.order.rawValue)
      item.setValue(value, forKeyPath: FibTime.Attribute.value.rawValue)
      item.setValue(elapsedTime, forKeyPath: FibTime.Attribute.elapsedTime.rawValue)
      do {
        try managedContext.save()
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
    
    func fetchAll() -> [FibTime]? {
      let managedContext = CoreDataManager.shared.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: FibTime.description())
      do {
        let items = try managedContext.fetch(fetchRequest)
        return items as? [FibTime]
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
        return nil
      }
    }
    
    func fetchReady() -> Bool {
      let managedContext = CoreDataManager.shared.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: FibTime.description())
      fetchRequest.fetchLimit = 1
      do {
        let items = try managedContext.fetch(fetchRequest)
        return items.count > 0
      } catch let error as NSError {
        print("fetchReady Failed. \(error), \(error.userInfo)")
        return false
      }
    }
    
    func flushData() {
      let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: FibTime.description())
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


