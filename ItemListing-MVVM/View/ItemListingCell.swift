//
//  ItemListingCell.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import UIKit

class ItemListingCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var itemRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
