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
        id = dictionary[kOBJECTID] as! String
        name = dictionary[kNAME] as! String
        image = UIImage(named: dictionary[kIMAGENAME] as? String ?? "")
    }
}


func downloadCategoryFromFirebase(completion: @escaping ([Category])->()){
    var categoryArray: [Category] = []
    
    firebaseReference(.Category).getDocuments { snapshot, error in
        guard let snapshot = snapshot else {
            completion(categoryArray)
            return
        }
        if !snapshot.isEmpty {
            for categoryDict in snapshot.documents{
                categoryArray.append(Category(dictionary: categoryDict.data() as NSDictionary))
            }
        }
        completion(categoryArray)
    }
}

//MARK: Save category function

func saveCategoryToFirebase(_ category: Category){
    
    let id = UUID().uuidString
    category.id = id
    firebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
}

func categoryDictionaryFrom(_ category: Category) -> NSDictionary{
    return NSDictionary(objects: [category.id, category.name, category.imageName!], forKeys: [kOBJECTID as NSCopying, kNAME as NSCopying, kIMAGENAME as NSCopying])
}

//используется единственный раз для первоначального создания разделов магазина на сервере, после чего я его закомментировал

//func createCategorySet(){
//    let sets = Category(name: "Наборы", imageName: "sets")
//    let fragrances = Category(name: "Ароматы", imageName: "fragrances")
//    let makeup = Category(name: "Макияж", imageName: "makeup")
//    let hairs = Category(name: "Для волос", imageName: "hairs")
//    let suntan = Category(name: "Для загара", imageName: "suntan")
//    let face = Category(name: "Для лица", imageName: "face")
//    let foots = Category(name: "Для ног", imageName: "foots")
//    let hands = Category(name: "Для рук", imageName: "hands")
//    let body = Category(name: "Для тела", imageName: "body")
//    let anew = Category(name: "ANEW", imageName: "anew")
//    let spa = Category(name: "SPA", imageName: "spa")
//    let men = Category(name: "Для мужчин", imageName: "men")
    
//    let arrayOfCategories = [
//        sets,
//        fragrances,
//        makeup,
//        hairs,
//        suntan,
//        face,
//        foots,
//        hands,
//        body,
//        anew,
//        spa,
//        men
//    ]
//
//    for item in arrayOfCategories {
//        saveCategoryToFirebase(item)
//    }
//
//}
