//
//  MainViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation


import UIKit
import XperFramework

class MainViewController : UIViewController,  UITableViewDataSource, UITableViewDelegate  {
    
    var datasource: MainInfoDatasource?
    
    @IBOutlet weak var datasetLabel: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var descriptorsLabel: UILabel!
    
    var datasetNameKeys: [String] {
        return Array(XperSingleton.instance.datasetsPathsDictionnary.keys)
    }
    @IBOutlet weak var savedDatasetsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayDatasetData()
        savedDatasetsTable.dataSource = self
        savedDatasetsTable.delegate = self
        
    }
    func displayDatasetData() {
        savedDatasetsTable.reloadData()
        if let datasource = self.datasource {
            datasetLabel.text = datasource.getDatasetName()
            itemsLabel.text = String(datasource.getItemsCount()!)
            descriptorsLabel.text = String(datasource.getDescriptorsCount()!)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return XperSingleton.instance.datasetsPathsDictionnary.keys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("savedDatasetCell")as! DatasetObjectTableViewCell
        let datasetName = datasetNameKeys[indexPath.row]
        cell.objectName?.text = datasetName
        
        return cell
    }
    
    // MARK: - Table view delegate functions
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let datasetName = datasetNameKeys[indexPath.row]
        XperSingleton.instance.datasetLoader.loadExistingDataset(named: datasetName)
        
    }
}