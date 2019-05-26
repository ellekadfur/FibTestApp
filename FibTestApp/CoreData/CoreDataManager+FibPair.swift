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
      fetchRequest.fetchBatchSize = 15
     let sortDescriptor = NSSortDescriptor(key: FibPair.Attribute.value.rawValue, ascending: true)
      fetchRequest.sortDescriptors = [sortDescriptor]
      let fetchedResultsController = NSFetchedResultsController<FibPair>(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
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
    
    func insert(value: Double, functionValue: String) {
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
    
    
    func deleteEntire() {
      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: FibPair.description())
      let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
      do {
        try CoreDataManager.shared.persistentContainer.viewContext.execute(deleteRequest)
      } catch let error as NSError {
        print("deleteEntire Failed. \(error), \(error.userInfo)")
      }
    }
    
    func deleteData() {
      let context:NSManagedObjectContext = CoreDataManager.shared.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:  FibTime.description())
      fetchRequest.returnsObjectsAsFaults = false
      
      do {
        let results = try context.fetch(fetchRequest)
        for managedObject in results {
          let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
          context.delete(managedObjectData)
        }
      } catch let error as NSError {
        print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
      }
    }
    
    func purgeAllData() {
      let uniqueNames = CoreDataManager.shared.persistentContainer.managedObjectModel.entities.compactMap({ $0.name })
      
      uniqueNames.forEach { (name) in
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: name)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
          try CoreDataManager.shared.persistentContainer.viewContext.execute(batchDeleteRequest)
        } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
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
