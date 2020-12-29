//
//  BottomNavigationView.swift
//  Receipts
//
//  Created by Jaiden Chicote on 12/24/20.
//

import Foundation
import UIKit

protocol BottomNavDelegate {
  func TapHome()
  func TapFiles()
  func TapCamera()
  func TapImport()
}

class BottomNavigationView : UIView {
  
  // Navigation Elements
  @IBOutlet weak var homeButton: UIButton!
  @IBOutlet weak var expandButton: UIButton!
  @IBOutlet weak var filesButton: UIButton!
  
  // Navigation Content View
  @IBOutlet weak var navContentHeight: NSLayoutConstraint!
  
  // Import Button Outlets
  @IBOutlet weak var importButton: UIButton!
  @IBOutlet weak var importAlignY: NSLayoutConstraint!
  @IBOutlet weak var importAlignX: NSLayoutConstraint!
  
  // Camera Button Outlets
  @IBOutlet weak var cameraButton: UIButton!
  @IBOutlet weak var cameraAlignY: NSLayoutConstraint!
  @IBOutlet weak var cameraAlignX: NSLayoutConstraint!
  
  var navDelegate: BottomNavDelegate?
  var isExpanded: Bool = false
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    initialiseLayout()
  }
  
  /// Overrides the internal hit test when tapped, instead will fall through inputs on parent view
  ///
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    // Get the hit view we would normally get with a standard UIView
    let hitView = super.hitTest(point, with: event)
    
    // If the hit view was self -> return nil
    // If the hit was from a subview -> return hitView
    return hitView == self ? nil : hitView
  }
  
  /// Initialises navigation bar layout
  ///
  func initialiseLayout() {
    guard let superView = superview else {
      print("Superview is missing")
      return
    }
    
    navContentHeight.constant = superView.frame.height / 9
    layoutIfNeeded()
  }
  
  /// Called to begin animation sequence when interplating in and out of triggered expansion
  ///
  func AnimateExpandable() {
    // Expanding Out
    if(!isExpanded) {
      onExpansion()
      return
    }
    
    // Shrinking In
    if(isExpanded) {
      onRetraction()
      return
    }
  }
  
  /// Executes statements for expanding the button
  ///
  private func onExpansion() {
    guard let superView = superview else {
      print("Superview is missing")
      return
    }
    
    makeExpandableHidden(isHidden: false)
    expandingButtons(superView: superView)
    
    // Enable Buttons
    makeExpandableInteractable(isInteractable: true)
    isExpanded = true
  }
  
  /// Executes the statements for retrating the button
  ///
  private func onRetraction() {
    guard let superView = superview else {
      print("Superview is missing")
      return
    }
    
    shrinkingButtons(superView: superView)
    
    //disable buttons
    makeExpandableInteractable(isInteractable: false)
    isExpanded = false
  }
  
  /// Called to animate buttons on expansion
  ///
  func expandingButtons(superView: UIView) {
    let newXOffset = (superView.frame.width / 2) * 0.5
    
    // Animate layout
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
      // Update X Position
      self.importAlignX.constant = self.importAlignX.constant + newXOffset
      self.cameraAlignX.constant = self.cameraAlignX.constant - newXOffset
    
      // Update Y Position
      self.importAlignY.constant = self.importAlignY.constant - 70
      self.cameraAlignY.constant = self.cameraAlignY.constant - 70
    
      self.layoutIfNeeded()
    }, completion: nil)
  }
  
  /// Called to animate buttons on shrink
  ///
  func shrinkingButtons(superView: UIView) {
    // Animate layout
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
      // Update X Position
      self.importAlignX.constant = 0
      self.cameraAlignX.constant = 0
      
      // Update Y Position
      self.importAlignY.constant = 0
      self.cameraAlignY.constant = 0
      
      self.layoutIfNeeded()
    }, completion: {_ in
      self.makeExpandableHidden(isHidden: true)
    }
  )}
  
  /// Enables and disables user interaction of expanded buttons
  ///
  func makeExpandableInteractable(isInteractable: Bool) {
    importButton.isUserInteractionEnabled = isInteractable
    cameraButton.isUserInteractionEnabled = isInteractable
  }
  
  /// Hides expanded buttons when retracted
  ///
  func makeExpandableHidden(isHidden: Bool) {
    importButton.isHidden = isHidden
    cameraButton.isHidden = isHidden
  }
  
  // -------- PRIMARY NAVIGATION ITEMS ---------
  @IBAction func touchHomeButton(_ sender: Any) {
    navDelegate?.TapHome()
  }
  
  @IBAction func touchFilesButton(_ sender: Any) {
    navDelegate?.TapFiles()
  }
  
  @IBAction func touchExpandableButton(_ sender: Any) {
    AnimateExpandable()
  }
  
  
  // -------- EXPANDABLE NAVIGATION ITEMS ---------
  @IBAction func touchImportButton(_ sender: Any) {
    navDelegate?.TapImport()
  }
  
  @IBAction func touchCameraButton(_ sender: Any) {
    navDelegate?.TapCamera()
  }
}
