//
//  DescriptorsTableViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DescriptorsTableViewController: UITableViewController {
    
    var descriptors: [Descriptor]? {
        return datasource?.getDescriptors()
    }
    var datasource: DescriptorsDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datasource?.register(descriptorsTableViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload() {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source functions
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptors!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("descriptorCell")as! DatasetObjectTableViewCell
        let descriptor = descriptors![indexPath.row]
        cell.objectName?.text = descriptor.name
        
        return cell
    }
    
    // MARK Navigation setup
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDescriptorDetails" {
            let descriptorDetailViewController = segue.destinationViewController as! DescriptorDetailViewController
            
            if let selectedDescriptorCell = sender as? DatasetObjectTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedDescriptorCell)
                let selectedDescriptor = descriptors![(indexPath?.row)!]
                descriptorDetailViewController.descriptor = selectedDescriptor
            }
        }
    }
    
}