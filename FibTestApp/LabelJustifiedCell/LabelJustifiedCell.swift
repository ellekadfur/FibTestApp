//
//  LabelJustifiedCell.swift
//  FibTestApp
//
//  Created by Lamar Jay Caaddfiir on 5/25/19.
//  Copyright © 2019 Lamar Jay Caaddfiir. All rights reserved.
//

import UIKit

class LabelJustifiedCell: UITableViewCell {

  //MARK: - Properties
  @IBOutlet weak var leftLabel: UILabel!
  @IBOutlet weak var rightLabel: UILabel!
  
  //MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.leftLabel.text = ""
    self.rightLabel.text = ""
  }
  
  //MARK: - Setup
  func setup(leftLabelText: String, rightLabelText: String) {
    self.leftLabel.text = leftLabelText
    self.rightLabel.text = rightLabelText
  }
    
}
