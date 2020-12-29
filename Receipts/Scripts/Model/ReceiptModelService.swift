//
//  ReceiptModelService.swift
//  Receipts
//
//  Created by Jaiden Chicote on 12/29/20.
//

import Foundation
import CoreData

class ReceiptModelService {
  
  var receipts: [NSManagedObject] = []
  
  /// Called to prepare the model service's data before usage
  ///
  public func fetchAllData() {
    let appDelegate = AppDelegate()
    
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Receipt")
    
    do {
      receipts = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  
  ///
  ///
  public func addNewReceiptItem(receipt: ReceiptItem) {
    
  }
  
  ///
  ///
  public func getFullReceiptDetail(index: Int) -> ReceiptItem {
    
    let receipt = receipts[index]
    let receiptItem: ReceiptItem
    let receiptImages [Data] = receipt.value(forKey: "image") as? Data ?? nil
    
    receiptItem = ReceiptItem(
      indentifier: receipt.value(forKey: "indentifier") as? String ?? "idGeneralisedKey",
      name: receipt.value(forKey: "name") as? String ?? "No Name",
      date: receipt.value(forKey: "date") as? NSDate ?? NSDate(),
      vendor: receipt.value(forKey: "vendor") as? String ?? "None",
      category: receipt.value(forKey: "category") as? String ?? "General",
      isStarred: receipt.value(forKey: "isStarred") as? Bool ?? false)
    
    receiptItem.images = receiptImages
    return receiptItem
  }
  
  private func retrieveImages(identifier: Int64) -> [Data] {
    let imageArray: [Data]
    
    
  }
}
