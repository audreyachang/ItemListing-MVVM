//
//  ItemModel.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import Foundation

struct Item{
    let itemId: Int
    let itemName: String
    let itemDesc: String
    let itemImage: String
    let itemPrice: Float
    let itemRating: Float
}

extension Item: Decodable{
    enum CodingKeys: String, CodingKey{
        case itemId = "id"
        case itemName = "title"
        case itemDesc = "description"
        case itemImage = "image"
        case itemPrice = "price"
        case itemRating = "rating"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        itemId = try container.decode(Int.self, forKey: .itemId)
        itemName =  try container.decode(String.self, forKey: .itemName)
        itemDesc =  try container.decode(String.self, forKey: .itemDesc)
        itemImage = try container.decode(String.self, forKey: .itemImage)
        itemPrice = try container.decode(Float.self, forKey: .itemPrice)
        itemRating = try container.decode(Float.self, forKey: .itemRating)
    }
}
