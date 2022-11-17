//
//  Downloader.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 17.11.2022.
//

import Foundation
import FirebaseStorage

let storage = Storage.storage()

func uploadImages(images: [UIImage?], itemId: String, completion: @escaping (_ imageLinks: [String]) -> Void) {
    
    if Reachabilty.HasConnection() {
        
        var uploadedImagesCount = 0
        var imageLinkArray: [String] = []
        var nameSuffix = 0
        
        for image in images {
            
            let fileName = "ItemImages/" + itemId + "/" + "\(nameSuffix)" + ".jpg"
            let imageData = image!.jpegData(compressionQuality: 0.5)
        }
        
    } else {
        print("No Internet Connection")
    }
}
