//
//  ItemsTableViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class ItemsTableViewController: UITableViewController, ItemsViewControllerProtocol {
    
    var items: [Item]? {
        return itemsDatasource?.getItems()
    }
    var itemsDatasource: ItemsDatasource?
    var descriptorsDatasource: DescriptorsDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemsDatasource?.register(itemsViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload(){
        self.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source functions
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! DatasetObjectTableViewCell
        let item = items![(indexPath as NSIndexPath).row]
        cell.objectName?.text = item.name
        
        return cell
    }
    
    // MARK Navigation setup
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showItemDetail" {
            let itemDetailViewController = segue.destination as! ItemDetailViewController
            
            // Get the cell that generated this segue.
            if let selectedItemCell = sender as? DatasetObjectTableViewCell {
                let indexPath = tableView.indexPath(for: selectedItemCell)
                let selectedItem = items![((indexPath as NSIndexPath?)?.row)!]
                itemDetailViewController.item = selectedItem
                itemDetailViewController.descriptorsDatasource = descriptorsDatasource
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
    
}
