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
    var descriptorsDatasource: DescriptorsDatasource?
    
    let descriptorNameSortFunction = { (descriptor1: Descriptor, descriptor2: Descriptor) -> Bool in
        return descriptor1.name! < descriptor2.name!
    }
    
    let stateNameSortFunction = { (State1: State, state2: State) -> Bool in
        return State1.name! < state2.name!
    }

    
    var descriptorKeys : [Descriptor]? {
        if isEditMode {
            return descriptorsDatasource?.getDescriptors()?.sorted(by: descriptorNameSortFunction)
        }
        else {
            return Array(item!.itemDescription!.descriptionElements.keys).sorted(by: descriptorNameSortFunction)
        }
    }
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBAction func toggleEditMode(_ sender: AnyObject) {
        isEditMode = !isEditMode
        editButton.title = isEditMode ? "Done" : "Edit"
        (self.view as! UITableView).reloadData()
    }
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source functions
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return descriptorKeys!.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let descriptorUsedAsKeyForSection = descriptorKeys![section]
        
        let des = item?.itemDescription?.descriptionElements[descriptorUsedAsKeyForSection]
        
        if descriptorUsedAsKeyForSection.isCategorical {
            if isEditMode {
                return (descriptorUsedAsKeyForSection as! CategoricalDescriptor).states.count
            }
            else {
                return (des?.selectedStates.count)!
            }
        }
        return 1
    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return descriptorKeys![section].name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as! DescriptionTableViewCell
        
        let descriptorKey = descriptorKeys![(indexPath as NSIndexPath).section]
        let des = item?.itemDescription?.descriptionElements[descriptorKey]
        if descriptorKey.isCategorical{
            let selectedStates = des?.selectedStates.sorted(by: stateNameSortFunction)
            if !isEditMode {
                cell.objectName.text = selectedStates![(indexPath as NSIndexPath).row].name!
            }
            else {
                let states = (descriptorKey as! CategoricalDescriptor).states.sorted(by: stateNameSortFunction)
                let currentState = states[(indexPath as NSIndexPath).row]
                let isStateSelected = (selectedStates?.contains(currentState))!
                cell.objectName.text = isStateSelected ? "✓ " + currentState.name! : "  " + currentState.name!
            }
        } else {
            let qm = des?.quantitativeMeasure
            cell.objectName.text = isEditMode ? "" : "min: \(qm?.computedMin), average: \(qm?.mean), max: \(qm?.computedMax)"
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptorKey = descriptorKeys![(indexPath as NSIndexPath).section]
        if isEditMode {
            if descriptorKey.isCategorical {
                let selectedState = (descriptorKey as! CategoricalDescriptor).states.sorted(by: stateNameSortFunction)[(indexPath as NSIndexPath).row]
                let des = item?.itemDescription?.descriptionElements[descriptorKey]
                let selectedStateContainedInDES = (des?.selectedStates.contains(selectedState))!
                if selectedStateContainedInDES {
                    des?.selectedStates.remove(at: des!.selectedStates.index(of: selectedState)!)
                } else {
                    des?.selectedStates.append(selectedState)
                }
            }
        }
    }
}
