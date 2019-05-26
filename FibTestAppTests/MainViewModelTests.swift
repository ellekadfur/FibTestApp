//
//  MainViewModelTests.swift
//  MainViewModelTests
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import XCTest
@testable import FibTestApp

class MainViewModelTests: XCTestCase {
  
  var viewModel: MainVC.ViewModel!
  
  override func setUp() {
    viewModel = MainVC.ViewModel()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Test cases
    func test_init(){
    let instance = MainVC.ViewModel()
    XCTAssertNotNil( instance )
  }
  
  func test_fetchFib() {
    var value = 0
    let n:Double = 10
    let milliseconds = viewModel.fetchFib(n) {
      value = 1
    }
    XCTAssertNotNil( milliseconds )
    XCTAssertTrue(value == 1)
  }
  
  
}
