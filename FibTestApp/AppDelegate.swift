//
//  AppDelegate.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    CoreDataManager.shared.fibPair.flushData()
    CoreDataManager.shared.fibTime.flushData()
    return true
  }

  func applicationWillTerminate(_ application: UIApplication) {
    CoreDataManager.shared.saveContext()
  }

}

