//
//  ItemTableViewController.swift
//  OnlineShop
//
//  Created by Artyom Potapov on 16.11.2022.
//

import UIKit

class ItemTableViewController: UITableViewController {

    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemsToAddItemSegue" {
            let vc = segue.destination as! AddItemViewController
            vc.category = category!
        }
    }
}
