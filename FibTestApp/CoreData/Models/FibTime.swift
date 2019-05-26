//
//  FibTime.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import CoreData

@objc(FibTime)
public class FibTime: NSManagedObject {
  
  @NSManaged public var elapsedTime: String
  @NSManaged public var value: String
  @NSManaged public var order: String
  enum Attribute: String {
    case elapsedTime
    case value
    case order
  }
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<FibTime> {
    return NSFetchRequest<FibTime>(entityName: FibTime.description())
  }
  
}
