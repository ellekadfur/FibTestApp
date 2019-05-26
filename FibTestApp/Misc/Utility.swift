//
//  Utility.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import Foundation
import UIKit

class Utility: NSObject {
  
  class func displayAlertController(withVC vc: UIViewController, withAlertStyle alertStyle:UIAlertController.Style, withTitle title:String?, withMesssage message:String?, withAddCancel addCancel:Bool = false, withActions actions:[UIAlertAction]? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
    if let actions = actions {
      for action in actions {
        alert.addAction(action)
      }
      if actions.count < 1 {
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
      }
    } else {
      let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      alert.addAction(cancelAction)
    }
    if addCancel {
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      alert.addAction(cancelAction)
    }
    vc.present(alert, animated: true, completion: nil)
  }
  
}
