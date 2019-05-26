//
//  UIView+Extension.swift
//  AppNaqBase
//
//  Created by Lamar Jay Caaddfiir on 12/25/18.
//  Copyright © 2018 AppNaq, LLC. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIView
extension UIView {
  static func identifier() -> String {
    return String(describing: self)
  }
  
  func addBottomBorder(_ color: UIColor, width: CGFloat) {
    let border = CALayer()
    border.borderColor = color.cgColor
    border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: width)
    border.borderWidth = width
    self.layer.addSublayer(border)
  }
  
  func addShadow(withColor color:UIColor, withShadowOpacity opacity:Float, withOffsetSize offsetSize:CGSize, withShadowRadius radius:CGFloat, shouldRasterize rasterizeAction:Bool) {
    self.layer.shadowColor = color.cgColor
    self.layer.shadowOpacity = opacity
    self.layer.shadowOffset = offsetSize
    self.layer.shadowRadius = radius
    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    self.layer.shouldRasterize = rasterizeAction
    self.clipsToBounds = false
    self.layer.masksToBounds = false
  }
  
  static func nib() -> UINib {
    return UINib(nibName: String(describing: self), bundle:nil)
  }
  static func nibView() -> UIView {
    return Bundle.main.loadNibNamed(self.identifier(), owner: self, options: nil)![0] as! UIView
  }
  //MARK: - Return
  static func returnTopLine(withColor color:UIColor, withHeight height: CGFloat ) -> UIView {
    let topView = UIView.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height: height))
      topView.backgroundColor = color
    return topView
  }
  
  static func returnBottomLine(_ color:UIColor? = nil, withOrigin origin: CGFloat) -> UIView {
    let topView = UIView.init(frame: CGRect(x:0, y:origin - 0.5, width:UIScreen.main.bounds.width, height:0.5))
    if let theColor = color {
      topView.backgroundColor = theColor
    }
    else {
      topView.backgroundColor = UIColor.lightGray //UIColor.hex("d0d0d0")
    }
    return topView
  }
  
  public func layoutAttachAll(to parentView:UIView, margins: (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0,0.0, 0.0)) {
    var constraints = [NSLayoutConstraint]()
    self.translatesAutoresizingMaskIntoConstraints = false
    constraints.append(NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1.0, constant: margins.0))
    constraints.append(NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1.0, constant: -margins.2))
    constraints.append(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1.0, constant: margins.1))
    constraints.append(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1.0, constant: -margins.3))
    parentView.addConstraints(constraints)
  }
  
  /// attaches all sides of the receiver to its parent view
  func layoutAttachAll(margin : CGFloat) {
    let view = superview
    layoutAttachTop(to: view, margin: margin)
    layoutAttachBottom(to: view, margin: margin)
    layoutAttachLeading(to: view, margin: margin)
    layoutAttachTrailing(to: view, margin: margin)
  }
  
  /// attaches the top of the current view to the given view's top if it's a superview of the current view, or to it's bottom if it's not (assuming this is then a sibling view).
  /// if view is not provided, the current view's super view is used
  @discardableResult
  func layoutAttachTop(to: UIView? = nil, margin : CGFloat = 0.0) -> NSLayoutConstraint {
    
    let view: UIView? = to ?? superview
    let isSuperview = view == superview
    let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: isSuperview ? .top : .bottom, multiplier: 1.0, constant: margin)
    superview?.addConstraint(constraint)
    
    return constraint
  }
  
  /// attaches the bottom of the current view to the given view
  @discardableResult
  func layoutAttachBottom(to: UIView? = nil, margin : CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
    
    let view: UIView? = to ?? superview
    let isSuperview = (view == superview) || false
    let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: isSuperview ? .bottom : .top, multiplier: 1.0, constant: -margin)
    if let priority = priority {
      constraint.priority = priority
    }
    superview?.addConstraint(constraint)
    
    return constraint
  }
  
  /// attaches the leading edge of the current view to the given view
  @discardableResult
  func layoutAttachLeading(to: UIView? = nil, margin : CGFloat = 0.0) -> NSLayoutConstraint {
    
    let view: UIView? = to ?? superview
    let isSuperview = (view == superview) || false
    let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: isSuperview ? .leading : .trailing, multiplier: 1.0, constant: margin)
    superview?.addConstraint(constraint)
    
    return constraint
  }
  
  /// attaches the trailing edge of the current view to the given view
  @discardableResult
  func layoutAttachTrailing(to: UIView? = nil, margin : CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
    
    let view: UIView? = to ?? superview
    let isSuperview = (view == superview) || false
    let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: isSuperview ? .trailing : .leading, multiplier: 1.0, constant: -margin)
    if let priority = priority {
      constraint.priority = priority
    }
    superview?.addConstraint(constraint)
    
    return constraint
  }
  
  func findConstraint(layoutAttribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
    if let constraints = superview?.constraints {
      for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: layoutAttribute) {
        return constraint
      }
    }
    return nil
  }
  
  func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
    if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
      let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
      let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
      return firstItemMatch || secondItemMatch
    }
    return false
  }
  
  func takeScreenshot() -> UIImage {
    
    // Begin context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
    
    // Draw view in that context
    drawHierarchy(in: self.bounds, afterScreenUpdates: true)
    
    // And finally, get image
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    if (image != nil)
    {
      return image!
    }
    return UIImage()
  }
  
  func screenshot(completion: @escaping ((UIImage) -> ()))  {
    DispatchQueue.main.async { [weak self] in
      guard let strongSelf = self else { return }
      let image = UIGraphicsImageRenderer(size: strongSelf.bounds.size).image { _ in
        strongSelf.drawHierarchy(in: CGRect(origin: .zero, size: strongSelf.bounds.size), afterScreenUpdates: true)
      }
      completion(image)

    }
  }
  
}
