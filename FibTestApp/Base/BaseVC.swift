//
//  BaseVC.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
  
  //MARK: - Properties
  @IBOutlet weak var tableView: UITableView!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    CoreDataManager.shared.fibPair.flushData()
    CoreDataManager.shared.fibTime.flushData()
    self.setupTableView()
  }
  

  //MARK: - Setup
  func setupTableView() {
    self.tableView.register(LabelJustifiedCell.nib(), forCellReuseIdentifier: LabelJustifiedCell.identifier())
    self.tableView.tableFooterView = (UIView())
  }
  
}
