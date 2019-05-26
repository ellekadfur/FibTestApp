//
//  FibPairTests.swift
//  FibPairTests
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import XCTest
@testable import FibTestApp

class FibPairTests: XCTestCase {
  
  var coreDataManager: CoreDataManager!
  
  override func setUp() {
    coreDataManager = CoreDataManager.shared
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Test cases
  func test_init_coreDataManager() {
    let instance = CoreDataManager.shared
    XCTAssertNotNil( instance )
  }
  
  func test_coreDataStackInitialization() {
    let coreDataStack = CoreDataManager.shared.persistentContainer
    XCTAssertNotNil(coreDataStack)
  }
  
  func test_create() {
    XCTAssertEqual( coreDataManager.fibPair.fetchAll()?.count, 0)

    let value1 = 1
    let fuction1 = "123"
    coreDataManager.fibPair.insert(value: Double(value1), functionValue: fuction1)
    XCTAssertNotNil( coreDataManager.fibPair.fetchAll() )
    
    let value2 = 45
    let function2 = "32324354"
    coreDataManager.fibPair.insert(value: Double(value2), functionValue: function2)
    XCTAssertNotNil( coreDataManager.fibPair.fetchAll() )
    
    let value3 = 34
    let function3 = "43423564"
    coreDataManager.fibPair.insert(value: Double(value3), functionValue: function3)
    XCTAssertNotNil( coreDataManager.fibPair.fetchAll() )
  }
  
  
  func test_flushData() {
    coreDataManager.fibPair.flushData()
    XCTAssertEqual( coreDataManager.fibPair.fetchAll()?.count, 0)
  }
  
}
