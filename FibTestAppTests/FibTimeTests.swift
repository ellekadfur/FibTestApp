//
//  FibTimeTests.swift
//  FibTimeTests
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import XCTest
@testable import FibTestApp

class FibTimeTests: XCTestCase {
  
  var coreDataManager: CoreDataManager!
  
  override func setUp() {
    coreDataManager = CoreDataManager.shared
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Test cases
  func test_init_coreDataManager(){
    let instance = CoreDataManager.shared
    XCTAssertNotNil( instance )
  }
  
  func test_coreDataStackInitialization() {
    let coreDataStack = CoreDataManager.shared.persistentContainer
    XCTAssertNotNil( coreDataStack )
  }
  
  func test_create() {
    XCTAssertEqual( coreDataManager.fibTime.fetchAll()?.count, 0)

    let order1 = 0
    let value1 = "dfsd"
    let elapsedTime1 = "123"
    coreDataManager.fibTime.insert(order: Double(order1), value: value1, elapsedTime: elapsedTime1)
    XCTAssertNotNil( coreDataManager.fibPair.fetchAll() )
    
    let order2 = 4
    let value2 = "45"
    let elapsedTime2 = "32324354"
    coreDataManager.fibTime.insert(order: Double(order2), value: value2, elapsedTime: elapsedTime2)
    XCTAssertNotNil( coreDataManager.fibTime.fetchAll() )
    
    let order3 = 2
    let value3 = "34"
    let elapsedTime3 = "43423564"
    coreDataManager.fibTime.insert(order: Double(order3), value: value3, elapsedTime: elapsedTime3)
    XCTAssertNotNil( coreDataManager.fibPair.fetchAll() )
  }
  
  
  func test_flushData() {
    coreDataManager.fibTime.flushData()
    XCTAssertEqual( coreDataManager.fibTime.fetchAll()?.count, 0)
  }
  
}
