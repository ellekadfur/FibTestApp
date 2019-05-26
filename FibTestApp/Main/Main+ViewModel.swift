//
//  Main+ViewModel.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation

extension MainVC {
  class ViewModel {
    
    func executeFib(_ n: Double) {
      let ms = measure {
        self.fib(n)
      }
      print("ms - \(n):\(ms*1000)ms");//save to core data
    }
    
    //MARK: - Private Utility
    private func fib(_ n: Double) {
      var x:Double = -1 ,y:Double = 1, sum:Double = 0;
      for i in stride(from: 0, to: n, by: 1) {
        sum = x+y;
        x   = y;
        y   = sum;
        print("pairs - \(i):\(sum)");//save to core data
      }
    }
    
    private func measure(label: String? = nil, tests: Int = 1, printResults output: Bool = true, setup: @escaping () -> Void = { return }, _ block: @escaping () -> Void) -> Double {
      #warning("warning - change defaults before final commit")
      guard tests > 0 else { fatalError("Number of tests must be greater than 0") }
      var avgExecutionTime : CFAbsoluteTime = 0
      for _ in 1...tests {
        setup()
        let start = CFAbsoluteTimeGetCurrent()
        block()
        let end = CFAbsoluteTimeGetCurrent()
        avgExecutionTime += end - start
      }
      avgExecutionTime /= CFAbsoluteTime(tests)
      if output {
        let avgTimeStr = "\(avgExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
        if let label = label {
          print(label, "▿")
          print("\tExecution time: \(avgTimeStr)s")
          print("\tNumber of tests: \(tests)\n")
        } else {
          print("Execution time: \(avgTimeStr)s")
          print("Number of tests: \(tests)\n")
        }
      }
      return avgExecutionTime
    }
    
  }
}
