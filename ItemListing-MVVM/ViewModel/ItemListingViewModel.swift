//
//  ItemListingViewModel.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import UIKit

struct ItemPlaceholder{
    let id, count: Int
    let title, itemDesc, image: String
    let rating: Rating
    
    static func getItemPlaceholder()-> Item{
        return Item(id: 0, title: "Unable to get Data", itemDesc: "It seems that there's a problem,\n try again later", image: "", price: 0.00, rating: Rating(rate: 0.00, count: 0))
    }
}



