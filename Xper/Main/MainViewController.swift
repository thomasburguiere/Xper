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

class MainViewController : UIViewController {
    
    var datasource: MainInfoDatasource?
    
    @IBOutlet weak var datasetLabel: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var descriptorsLabel: UILabel!
    
    
    @IBAction func loadGenetDataset(sender: AnyObject) {
        
        XperSingleton.sharedInstance.datasetLoader.loadDatasetFromRemoteUrl(NSURL(string: "https://www.dropbox.com/s/tr7kon3uc4b7tpq/genetta.sdd.xml?dl=1"))
    }
    @IBAction func loadCoralsDataset(sender: AnyObject) {
        XperSingleton.sharedInstance.datasetLoader.loadDatasetFromRemoteUrl(NSURL(string: "https://www.dropbox.com/s/4nxgh06lkaklpdq/corals.sdd.xml?dl=1"))
    }
    @IBAction func loadCichoDataset(sender: AnyObject) {
        XperSingleton.sharedInstance.datasetLoader.loadDatasetFromRemoteUrl(NSURL(string: "https://www.dropbox.com/s/byjmovgiaftn6e1/cichorieae.sdd.xml?dl=1"))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayDatasetData()
        
    }
    func displayDatasetData() {
        if let datasource = self.datasource {
            datasetLabel.text = datasource.getDatasetName()
            itemsLabel.text = String(datasource.getItemsCount()!)
            descriptorsLabel.text = String(datasource.getDescriptorsCount()!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}