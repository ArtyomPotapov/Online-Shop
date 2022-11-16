//
//  Item.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 16.11.2022.
//

import UIKit

class Item {
    
    var id: String!
    var categoryID: String!
    var name: String!
    var description: String!
    var price: Int!
    var imageLinks: [String]!
    
//    init(id: String? = nil, categoryID: String? = nil, name: String? = nil, description: String? = nil, price: Int, imageLinks: [String]? = nil) {
//        self.id = id
//        self.categoryID = categoryID
//        self.name = name
//        self.description = description
//        self.price = price
//        self.imageLinks = imageLinks
//    }
    
    init(dictionary: NSDictionary){
        id = dictionary[kOBJECTID] as? String
        categoryID = dictionary[kCATEGORYID] as? String
        name = dictionary[kNAME] as? String
        description = dictionary[kDESCRIPTION] as? String
        price = dictionary[kPRICE] as? Int
        imageLinks = dictionary[kIMAGELINKS] as? [String]
    }
}
