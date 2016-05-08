//
//  ItemDescriptionViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 08/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class ItemDescriptionViewController: UITableViewController {
    var item: Item?
    var descriptorKeys : [Descriptor]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptorKeys = Array(item!.itemDescription!.descriptionElements.keys)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return item!.itemDescription!.descriptionElements.keys.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let descriptorUsedAsKeyForSection = descriptorKeys![section]
        if descriptorUsedAsKeyForSection.isCategorical {
            return (descriptorUsedAsKeyForSection as! CategoricalDescriptor).states.count
        }
        return 1
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return descriptorKeys?.map{$0.name!}
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("descriptionCell") as! DatasetObjectTableViewCell
        indexPath.row
//        let item = items![indexPath.row]
//        cell.objectName?.text = item.name
        
        return cell
    }
}
