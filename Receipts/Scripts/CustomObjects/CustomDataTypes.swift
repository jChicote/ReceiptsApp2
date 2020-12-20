//
//  CustomDataTypes.swift
//  Receipts
//
//  Created by Jaiden Chicote on 12/20/20.
//

import Foundation
import UIKit

class Category : NSObject {
  let name: String
  
  init(name: String) {
    self.name = name
  }
}

class ReceiptItem : NSObject {
  var name: String
  var date: NSDate
  var vendor: String
  var category: String
  var isStarred: Bool
  
  // Image of the receipt
  var images: [Data] = []
  
  init(name: String, date: NSDate, vendor: String, category: String, isStarred: Bool) {
    self.name = name
    self.date = date
    self.vendor = vendor
    self.category = category
    self.isStarred = isStarred
  }
  
  /// Adds image to array by converting it from UIImage to Data
  func addImage(image: UIImage) {
    if let imageData = image.pngData() {
      images.append(imageData)
    } else {
      print("image to png conversion has failed")
    }
  }
}
