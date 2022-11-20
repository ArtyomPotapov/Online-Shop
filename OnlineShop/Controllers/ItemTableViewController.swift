//
//  ItemTableViewController.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 16.11.2022.
//

import UIKit

class ItemTableViewController: UITableViewController {

    var category: Category!
    var itemArray: [Item] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadItems()
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemsToAddItemSegue" {
            let vc = segue.destination as! AddItemViewController
            vc.category = category!
        }
    }
    
    func loadItems(){
        
    }
}
