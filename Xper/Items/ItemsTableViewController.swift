//
//  ItemsTableViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class ItemsTableViewController: UITableViewController {
    
    var items: [Item]? {
        return datasource?.getItems()
    }
    var datasource: ItemTableViewDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datasource?.register(itemTableView: self.tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell") as! DatasetObjectTableViewCell
        let item = items![indexPath.row]
        cell.objectName?.text = item.name
        
        return cell
    }
    
    // MARK Navigation setup
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showItemDetail" {
            let itemDetailViewController = segue.destinationViewController as! ItemDetailViewController
            
            // Get the cell that generated this segue.
            if let selectedItemCell = sender as? DatasetObjectTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedItemCell)
                let selectedItem = items![(indexPath?.row)!]
                itemDetailViewController.item = selectedItem
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
    
}