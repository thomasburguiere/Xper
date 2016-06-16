//
//  DescriptorsTableViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DescriptorsTableViewController: UITableViewController, DescriptorsViewControllerProtocol {
    
    var descriptors: [Descriptor]? {
        return datasource?.getDescriptors()
    }
    var datasource: DescriptorsDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datasource?.register(descriptorsViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload() {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source functions
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptors!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptorCell")as! DatasetObjectTableViewCell
        let descriptor = descriptors![(indexPath as NSIndexPath).row]
        cell.objectName?.text = descriptor.name
        
        return cell
    }
    
    // MARK Navigation setup
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDescriptorDetails" {
            let descriptorDetailViewController = segue.destinationViewController as! DescriptorDetailViewController
            
            if let selectedDescriptorCell = sender as? DatasetObjectTableViewCell {
                let indexPath = tableView.indexPath(for: selectedDescriptorCell)
                let selectedDescriptor = descriptors![((indexPath as NSIndexPath?)?.row)!]
                descriptorDetailViewController.descriptor = selectedDescriptor
            }
        }
    }
    
}
