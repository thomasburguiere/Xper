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
    var dataset: Dataset?
    var data = NSMutableData()
    
    var delegate: MainViewControllerDelegate?
    var datasource: MainInfoDatasource?
    
    @IBOutlet weak var datasetLabel: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var descriptorsLabel: UILabel!
    
    
    @IBAction func loadGenetDataset(sender: AnyObject) {
        loadDatasetDataFromUrl("https://www.dropbox.com/s/tr7kon3uc4b7tpq/genetta.sdd.xml?dl=1")
    }
    @IBAction func loadCoralsDataset(sender: AnyObject) {
        loadDatasetDataFromUrl("https://www.dropbox.com/s/4nxgh06lkaklpdq/corals.sdd.xml?dl=1")
    }
    @IBAction func loadCichoDataset(sender: AnyObject) {
        loadDatasetDataFromUrl("https://www.dropbox.com/s/byjmovgiaftn6e1/cichorieae.sdd.xml?dl=1")
    }
    // 1
    let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    // 2
    var dataTask: NSURLSessionDataTask?
    
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
    
    func loadDatasetDataFromUrl(urlString: String) {
        // 1
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let url = NSURL(string: urlString)
        // 5
        dataTask = defaultSession.dataTaskWithURL(url!) {
            data, response, error in
            // 6
            dispatch_async(dispatch_get_main_queue()) {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
            // 7
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let parser = SddNSXMLParser()
                    self.dataset = parser.parseDataset(data)
                    self.delegate?.mainViewController(self, didLoadDataset: self.dataset!)
                    self.displayDatasetData()
                }
            }
        }
        // 8
        dataTask?.resume()
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}