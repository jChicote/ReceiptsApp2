//
//  RecentReceipsCell.swift
//  Receipts
//
//  Created by Jaiden Chicote on 12/20/20.
//

import Foundation
import UIKit

protocol RecentCellDelegate {
  func didTapCell()
}

class RecentReceiptsCell : UITableViewCell {
  
  // UILabels
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  var cellDelegate: RecentCellDelegate?
  
  func configure() {
    
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  
}
