//
//  ItemModel.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import Foundation

struct Item{
    let id: Int
    let title: String
    let itemDesc: String
    let image: String
    let price: Double
    let rating: Rating
}

extension Item: Codable{
    enum CodingKeys: String, CodingKey{
        case id, title, price, image, rating
        case itemDesc = "description"
    }
}

struct Rating: Codable{
    let rate: Double
    let count: Int
}
