//
//  CategoryBox.swift
//  Receipts
//
//  Created by Jaiden Chicote on 12/19/20.
//

import Foundation
import UIKit

protocol CellDelegate {
  func didTapCell()
}

class CategoryBox : UICollectionViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  
  var cellDelegate: CellDelegate?
  
  func configure() {
    
  }
  
  /// Loads view cell layout elements on load
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
}
