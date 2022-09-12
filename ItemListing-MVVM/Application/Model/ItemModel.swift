//
//  ItemModel.swift
//  ItemListing-MVVM
//
//  Created by Audrey Aurelia Chang on 10/09/22.
//

import Foundation

//MARK: Definition of Item and Rating data model
struct Item{
    let id: Int
    let title: String
    let itemDesc: String
    let image: String
    let price: Double
    let rating: Rating
}

struct Rating: Codable{
    let rate: Double
    let count: Int
}

//MARK: Added Coding Keys for Item data model to allow for mapping between data model and JSON Data
extension Item: Codable{
    enum CodingKeys: String, CodingKey{
        case id, title, price, image, rating
        case itemDesc = "description"
    }
}

