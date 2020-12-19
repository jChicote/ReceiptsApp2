//
//  HomeViewController.swift
//  Receipts
//
//  Created by Jaiden Chicote on 12/19/20.
//

import Foundation
import UIKit


class HomeViewController : ViewController {
  
  @IBOutlet weak var categoryCollection: UICollectionView!
  
  let testCategories = ["Groceries", "Technology", "Item3", "Item4", "Item5", "Item6"]
  
  //  Initialises controller on view load
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
}
