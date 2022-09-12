//
//  ItemListingCell.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import UIKit

class ItemListingCell: UITableViewCell {
    //MARK: Declaration of Outlets used in Table View Cell
    @IBOutlet weak var itemCellBackground: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var itemRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: Call functions to modify appearance of UI Elements
        cellShadow()
        priceShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: Add shadow to Cell UIView Background
    func cellShadow(){
        itemCellBackground.layer.cornerRadius = 10
        itemCellBackground.layer.shadowColor = UIColor.lightGray.cgColor
        itemCellBackground.layer.shadowOffset = .zero
        itemCellBackground.layer.shadowOpacity = 1
        itemCellBackground.layer.shadowRadius = 5
    }
    
    //MARK: Add shadow to item price label
    func priceShadow(){
        itemPrice.shadowColor = .lightGray
        itemPrice.shadowOffset = .init(width: 0.8, height: 2)
    }
}
