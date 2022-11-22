//
//  ItemTableViewCell.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 21.11.2022.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    var item: Item?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itenNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCell(_ item: Item){
        itenNameLabel.text = item.name
        itemDescriptionLabel.text = item.description
        itemPriceLabel.text = String(item.price)
        
//        if item.imageLinks.count > 0 {
        //TODO: загрузка картинки из Firestore
//            itemImageView.image = ... item.imageLinks.first
//        }
        
    }
    
}
