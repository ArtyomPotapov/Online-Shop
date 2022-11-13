//
//  CategoryViewController.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 12.11.2022.
//

import UIKit

class CategoryCollectionViewController: UICollectionViewController {

    var categotiesArray:[Category] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCategories()
        
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categotiesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
        cell.setCell(categotiesArray[indexPath.row])
        return cell
        
    }

    private func loadCategories(){
        downloadCategoryFromFirebase { categories in
            self.categotiesArray = categories
            self.collectionView.reloadData()
        }
    }
    
}
