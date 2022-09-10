//
//  ItemListingViewController.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import UIKit

class ItemListingViewController: UIViewController {

    @IBOutlet weak var itemListingTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemListingTable.dataSource = self
        itemListingTable.delegate = self
        
        itemListingTable.register(UINib.init(nibName: "ItemListingCell", bundle: nil), forCellReuseIdentifier: "ItemListingCell")
    }
    

  

}

extension ItemListingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemListingTable.dequeueReusableCell(withIdentifier: "ItemListingCell", for: indexPath)as! ItemListingCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
