//
//  Category.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 13.11.2022.
//

import UIKit

class Category {
    
    var id: String = ""
    var name: String = ""
    var image: UIImage?
    var imageName: String?
    
    init(name: String, imageName: String){
        id = ""
        self.name = name
        self.imageName = imageName
        image = UIImage(named: imageName)
    }
    
    init(dictionary: NSDictionary){
        id = dictionary["objectID"] as! String
        name = dictionary["name"] as! String
        image = UIImage(named: dictionary["imageName"] as? String ?? "")
    }
}
