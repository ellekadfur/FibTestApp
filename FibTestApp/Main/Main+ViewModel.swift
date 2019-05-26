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
    
    //MARK: - Properties
    private var completionBlock:(()->Void)!
    private var sessionCounter: Double = 0
    
    //MARK: - Fetch
    func fetchFib(_ n: Double, completion: @escaping (()->Void)) -> String {
      self.completionBlock = completion
      let ms = measure { time in
        self.fib(n, completion: { [unowned self] in
          self.completionBlock()
        })
      }
      self.sessionCounter += 1
      print("ms - \(n):\(ms*1000)ms");
      CoreDataManager.shared.fibTime.insert(order: self.sessionCounter, value: "\(n)", elapsedTime: "\(ms*1000)ms")
      return "\(ms*1000)ms"
    }
    
    //MARK: - Private Utility
    private func fib(_ n: Double, completion: (()->Void)) {
      var x:Double = -1 ,y:Double = 1, sum:Double = 0;
      for i in stride(from: 0, to: n, by: 1) {
        sum = x+y;
        x = y;
        y = sum;
        print("pairs - \(i):\(sum)");
        CoreDataManager.shared.fibPair.insert(value: i+1, functionValue: "\(sum)")
        if i+1 == n {
          completion()
        }
      }
    }
    
    private func measure(label: String? = nil, tests: Int = 1, printResults output: Bool = false, setup: @escaping () -> Void = { return }, _ block: @escaping (Double) -> Void) -> Double {
      guard tests > 0 else { fatalError("Number of tests must be greater than 0") }
      var avgExecutionTime : CFAbsoluteTime = 0
      for _ in 1...tests {
        setup()
        let start = CFAbsoluteTimeGetCurrent()
        block(CFAbsoluteTime(tests))
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
