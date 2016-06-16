//
//  DescriptorDetailViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DescriptorDetailViewController: UIViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    var descriptor: Descriptor?
    
    @IBOutlet weak var descriptorDetailText: UITextView!
    @IBOutlet weak var descriptorStatesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let descriptor = descriptor {
            navigationItem.title = descriptor.name
            if let detailString = descriptor.detail {
                descriptorDetailText.setHTMLFromString(detailString)
            } else {
                descriptorDetailText.setHTMLFromString("")
            }
        }
        descriptorStatesTableView.dataSource = self
        descriptorStatesTableView.delegate = self
        descriptorStatesTableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (descriptor! as! CategoricalDescriptor).states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell")as! DatasetObjectTableViewCell
        let state = (descriptor! as! CategoricalDescriptor).states[(indexPath as NSIndexPath).row]
        cell.objectName?.text = state.name
        
        return cell
    }
}
