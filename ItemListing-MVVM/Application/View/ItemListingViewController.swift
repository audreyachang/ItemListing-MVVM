//
//  ItemListingViewController.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import UIKit

class ItemListingViewController: UIViewController {

    //MARK: Oulet and variables declaration
    @IBOutlet weak var itemListingTable: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var emptyTitle: UILabel!
    
    var placeholderItem: Item = ItemPlaceholder.getItemPlaceholder()
    var products: [Item] = []
    var displayedProducts: [Item] = []
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Setting initial text for Empty State components
        emptyLabel.text = ""
        emptyTitle.text = ""
        
        //MARK: Set data source and delegate for Item Listing Table
        itemListingTable.dataSource = self
        itemListingTable.delegate = self
        
        //MARK: Registering Itwm Listing Cell XIB & changing separator color in Table View
        itemListingTable.register(UINib.init(nibName: "ItemListingCell", bundle: nil), forCellReuseIdentifier: "ItemListingCell")
        itemListingTable.separatorColor = UIColor.clear

        //MARK: Get Items from API and validation
        networkManager.getProducts { result in
            switch result{
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products
                    for i in 0...3{
                        self.displayedProducts.append(self.products[i])
                    }
                    self.itemListingTable.reloadData()
                }
            case.failure(let error):
                self.emptyData()
                print(error.localizedDescription)
            }
        }
        
    }
    
}

//MARK: Table View Functions
extension ItemListingViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    //MARK: Set number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if products.count != 0{
            return displayedProducts.count
        }else{
            return 0
        }
    }
    
    //MARK: Assign values to UI Elements in cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemListingTable.dequeueReusableCell(withIdentifier: "ItemListingCell", for: indexPath)as! ItemListingCell
        if products.count != 0{
        emptyTitle.isHidden = true
        emptyLabel.isHidden = true
        cell.itemName.text = products[indexPath.row].title
        cell.itemDesc.text = products[indexPath.row].itemDesc
        cell.itemPrice.text = "$ " + String(products[indexPath.row].price)
        cell.itemRating.text = "★" + String(products[indexPath.row].rating.rate)
        cell.itemImage.loadImage(imageURL: URL(string: products[indexPath.row].image)!)
        }
        return cell
    }
    
    //MARK: Set cell height in table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    //MARK: Pagination to allow Infinite srolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (itemListingTable.contentSize.height - 20 - scrollView.frame.height){
            if displayedProducts.count != products.count{
                for i in displayedProducts.count ... displayedProducts.count+3{
                    displayedProducts.append(products[i])
                    self.itemListingTable.reloadData()
                }
            }
        }
    }
    
    //MARK: Add activity indicator spinner
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let sectionIndex = itemListingTable.numberOfSections - 1
        let lastRow = itemListingTable.numberOfRows(inSection: sectionIndex) - 1
        if indexPath.section == sectionIndex && indexPath.row == lastRow && products.count > 0{
            let loadSpinner = UIActivityIndicatorView(style: .medium)
            if displayedProducts.count < 20 {
                loadSpinner.frame = CGRect(x: 0.0, y: 0.0, width: itemListingTable.frame.width, height: 40)
                loadSpinner.startAnimating()
                itemListingTable.tableFooterView = loadSpinner
            }else{
                itemListingTable.tableFooterView = .none
            }
        }
    }
    
}

//MARK: Function to display empty state
extension ItemListingViewController{
    func emptyData(){
        if products.isEmpty{
            emptyTitle.isHidden = false
            emptyLabel.isHidden = false
            emptyTitle.text = placeholderItem.title
            emptyLabel.text = placeholderItem.itemDesc
        }else{
            emptyTitle.isHidden = true
            emptyLabel.isHidden = true
        }
    }
}


