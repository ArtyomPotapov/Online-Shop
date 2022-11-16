//
//  CategoryViewController.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 12.11.2022.
//

import UIKit

class CategoryCollectionViewController: UICollectionViewController {

    var categotiesArray:[Category] = []
    let sectionInsert = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    let itemsPerRow: CGFloat = 3
    
    
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "categoryToItemsSegue", sender: categotiesArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoryToItemsSegue" {
            let vc = segue.destination as! ItemTableViewController
            vc.category = sender as! Category
            
        }
    }

    private func loadCategories(){
        downloadCategoryFromFirebase { categories in
            self.categotiesArray = categories
            self.collectionView.reloadData()
        }
    }
    
}


extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsert.left * (itemsPerRow + 1)
        let availableWith = view.frame.width - paddingSpace
        let withPerItem = availableWith / itemsPerRow
        
        return CGSize(width: withPerItem, height: withPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsert
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsert.left
    }
}
