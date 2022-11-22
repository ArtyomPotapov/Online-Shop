//
//  CategoryCollectionViewCell.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 12.11.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    var category: Category?
    
    
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    func setCell(_ category: Category){
        cellLabel.text = category.name
        cellImageView.image = category.image
    }
}
