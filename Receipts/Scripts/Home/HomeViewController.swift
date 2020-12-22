//
//  HomeViewController.swift
//  Receipts
//
//  Created by Jaiden Chicote on 12/19/20.
//

import Foundation
import UIKit
import MaterialComponents.MaterialBottomAppBar

class HomeViewController : ViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
  
  // Tables and Collection outlets
  @IBOutlet weak var categoryCollection: UICollectionView!
  @IBOutlet weak var recentTable: UITableView!
  
  // UIView related outlets
  @IBOutlet weak var categorySectionView: UIView!
  
  // Interactive related outlets
  @IBOutlet weak var bottomNavExpandable: UIButton!
  
  
  /// Initialises controller on view load
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initialiseCategoryCollection()
    initialiseRecentsTable()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutBottomAppBar()
  }
  
  /// Initialises the category collection view elements
  func initialiseCategoryCollection() {
    // Allocate 'self' to collection view delegate and source
    categoryCollection.delegate = self
    categoryCollection.dataSource = self
    
    // Define base dimensions for collection layout
    let width = view.frame.width * 0.4
    let height = categorySectionView.frame.height * 0.55
    
    // Configure view collection layout
    let layout = categoryCollection.collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: height)
    layout.minimumLineSpacing = 20
    layout.minimumInteritemSpacing = 20
  }
  
  /// Initialises the recent receipts table view
  func initialiseRecentsTable() {
    recentTable.delegate = self
    recentTable.dataSource = self
  }
  
  func layoutBottomAppBar() {
  }
  
  /// --------------------------- Outlet Functions ------------------------------
  
  @IBAction func onSettingsPressed(_ sender: Any) {
    print("Has pressed settings")
  }
  
  @IBAction func onSearchPressed(_ sender: Any) {
    print("Has pressed search")
  }
}


/// Extension containing related methods to UITableView Delegate and Datasource methods.
///
///
extension HomeViewController {
  // Defines the specified number of cells to be created
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7 // TEST COUNT
  }
  
  // Defines the height of table cells
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.size.height / 8
  }
  
  // Creates the cell at index and populates data
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = recentTable.dequeueReusableCell(withIdentifier: "RecentReceiptCell", for: indexPath) as! RecentReceiptsCell
    // STUB TEST
    return cell
  }
  
  // Animates cell gradually throughout all cells
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.alpha = 0
    UIView.animate(withDuration: 0.3, delay: 0.05 * Double(indexPath.row), animations: {
      cell.alpha = 1
    })
  }
  
}


/// Extension contains delegate and datasource methods for the Category Collection View UI
///
///
extension HomeViewController: CellDelegate {
  
  /// Returns integer of the number of items  to define for collection view
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return TestCategories.categories.count; //REMOVE TEST LATER
  }
  
  /// Creates and returns the configured cell object from the specified cell item in the collectionview.
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    // Define cell characteristics and related data
    let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryBox
    cell.nameLabel.text = TestCategories.categories[indexPath.row].name
    cell.cellDelegate = self
    cell.layoutIfNeeded()
    
    return cell
  }
  
  /// Executes function when delegate is triggered
  func didTapCell() {
    print("Tapped Cell")
  }
}
