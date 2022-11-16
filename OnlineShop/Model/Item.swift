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
    
    init() {}
    
    init(dictionary: NSDictionary){
        id = dictionary[kOBJECTID] as? String
        categoryID = dictionary[kCATEGORYID] as? String
        name = dictionary[kNAME] as? String
        description = dictionary[kDESCRIPTION] as? String
        price = dictionary[kPRICE] as? Int
        imageLinks = dictionary[kIMAGELINKS] as? [String]
    }
}

//MARK: Helper function

func saveItemToFirestore(_ item: Item) {
    firebaseReference(.Item).document(item.id).setData(itemDictionaryFrom(item) as! [String : Any])
}

func itemDictionaryFrom(_ item: Item) -> NSDictionary {
    
    return NSDictionary(objects: [item.id!, item.categoryID!,  item.name!, item.description!, item.price!, item.imageLinks], forKeys: [kOBJECTID as NSCopying, kCATEGORYID as NSCopying, kNAME as NSCopying, kDESCRIPTION as NSCopying, kPRICE as NSCopying, kIMAGELINKS as NSCopying])
}
