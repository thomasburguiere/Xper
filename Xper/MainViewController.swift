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
    
    @IBOutlet weak var datasetLabel: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var descriptorsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let dataset = self.dataset {
            datasetLabel.text = dataset.name
            itemsLabel.text = String(dataset.items.count)
            descriptorsLabel.text = String(dataset.descriptors.count)
        }
        
    }
    
    
    func loadSampleDataFromUrl() {
        let urlString = "https://www.dropbox.com/s/tr7kon3uc4b7tpq/genetta.sdd.xml?dl=1"
        
        let request = NSURLRequest(URL: NSURL(string: urlString)!)
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        connection.start()
        
    }
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!)  {
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(self.data)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}