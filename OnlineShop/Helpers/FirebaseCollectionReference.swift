//
//  FirebaseCollectionReference.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 13.11.2022.
//

import Foundation
import FirebaseFirestore


enum FCollectionReference: String {
    case User
    case Category
    case Item
    case Basket
    
}

func firebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
