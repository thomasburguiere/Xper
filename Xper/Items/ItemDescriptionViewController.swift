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
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBAction func toggleEditMode(sender: AnyObject) {
        isEditMode = !isEditMode
        editButton.title = isEditMode ? "Done" : "Edit"
    }
    var isEditMode = false
    
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
        
        let des = item?.itemDescription?.descriptionElements[descriptorUsedAsKeyForSection]
        
        if descriptorUsedAsKeyForSection.isCategorical {
            return (des?.selectedStates.count)!
        }
        return 1
    }
    

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return descriptorKeys![section].name
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("descriptionCell") as! DescriptionTableViewCell
        
        let descriptorKey = descriptorKeys![indexPath.section]
        let des = item?.itemDescription?.descriptionElements[descriptorKey]
        if descriptorKey.isCategorical{
            cell.objectName.text = des?.selectedStates[indexPath.row].name
        } else {
            let qm = des?.quantitativeMeasure
            cell.objectName.text = "min: \(qm?.computedMin), average: \(qm?.mean), max: \(qm?.computedMax)"
        }
        
        return cell
    }
}
