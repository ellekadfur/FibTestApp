//
//  UIViewController+Extensions.swift
//  AppNaqBase
//
//  Created by Lamar Jay Caaddfiir on 11/5/17.
//  Copyright © 2017 AppNaq, LLC. All rights reserved.
//

import UIKit

//MARK: - UIViewController
extension UIViewController {
  static func identifier() -> String {
    return String(describing: self)
  }
  
  static func navIdentifier() -> String {
    return String(describing: self).replacingOccurrences(of: "VC", with: "Nav")
  }
  
  static func instance() -> UIViewController? {
      return UIStoryboard(name: self.storyboardIdentifier(), bundle: nil).instantiateViewController(withIdentifier : self.identifier())
  }
  
  static func instanceNav(withInitialVC action:Bool) -> UIViewController? {
    if action {
      return UIStoryboard(name: self.storyboardIdentifier(), bundle: nil).instantiateInitialViewController()
    }
    else {
      return UIStoryboard(name: self.storyboardIdentifier(), bundle: nil).instantiateViewController(withIdentifier : self.navIdentifier() + "Nav")
    }
  }
  
  static func storyboardIdentifier() -> String {
    let name = self.identifier().replacingOccurrences(of: "Container", with: "")
    return name.replacingOccurrences(of: "VC", with: "")
  }
  
  func getScreenHeight () -> CGFloat {
    return  UIScreen.main.bounds.size.height
  }
  
}


