//
//  MainVC.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import UIKit

class MainVC: BaseVC {
  
  //MARK: - Properties
  @IBOutlet weak var bottomViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet weak var totalCalculationTimeLabel: UILabel!
  @IBOutlet weak var textField: UITextField!
  var viewModel = ViewModel()
  private struct Constants {
    static let tabBarHeight_withNotch: CGFloat = 83
    static let tabBarHeight_withOutNotch: CGFloat = 83
  }
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupBottomView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    CoreDataManager.shared.fibPair.setup(withVC: self)
    
  }
  
  //MARK: - Setup
  func setupBottomView() {
    if Device.hasTopNotch {
      self.bottomViewHeightConstraint.constant = Constants.tabBarHeight_withNotch
    } else {
      self.bottomViewHeightConstraint.constant = Constants.tabBarHeight_withOutNotch
    }
    self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.bottomViewHeightConstraint.constant))
  }
  
}

