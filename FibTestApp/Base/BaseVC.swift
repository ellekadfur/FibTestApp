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
    self.setupTableView()
  }
  
  //MARK: - Setup
  func setupTableView() {
    self.tableView.register(UINib(nibName: LabelJustifiedCell.identifier(), bundle: nil), forCellReuseIdentifier: LabelJustifiedCell.identifier())
  self.tableView.tableFooterView = (UIView())
  }
  
}
