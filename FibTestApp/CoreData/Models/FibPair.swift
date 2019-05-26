//
//  FibPair.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import CoreData

@objc(FibPair)
public class FibPair: NSManagedObject {
  
  @NSManaged public var functionValue: String
  @NSManaged public var value: Double
  enum Attribute: String {
    case value
    case functionValue
  }

}
